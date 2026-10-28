// Run after npm run compile-en (or pass outcsv.de/@ebusd/ebus-typespec).
import test from 'node:test';
import assert from 'node:assert/strict';
import fs from 'node:fs';
import path from 'node:path';

const root = process.env.EBUS_TEST_CSV_ROOT || 'outcsv/@ebusd/ebus-typespec';
const read = file => fs.readFileSync(path.join(root, 'vaillant', file), 'utf8').trim().split(/\r?\n/);
const base = read('bai.0010011701.inc');
const variant = read('bai.0010011694.inc');
const selection = read('08.bai.csv');
const isPump = row => row.split(',')[3] === 'HcPumpMode';

test('all inherited CSV rows except D.018 are unchanged, including write access levels', () => {
  assert.deepEqual(variant.filter(row => !isPump(row)), base.filter(row => !isPump(row)));
});

test('the product override contains one read-only B700 definition', () => {
  const rows = variant.filter(isPump);
  assert.equal(rows.length, 1);
  const fields = rows[0].split(',');
  assert.equal(fields[0], 'r');
  assert.equal(fields[2], '');
  assert.equal(fields[7], 'b509');
  assert.equal(fields[8], '0db700');
  assert.equal(fields[11], 'UCH');
  assert.equal(fields[12], '1=comfort;3=eco');
});

test('the parent keeps the old read/write register for other HW5502 products', () => {
  const rows = base.filter(isPump).map(row => row.split(','));
  assert.equal(rows.length, 2);
  assert(rows.some(row => row[0] === 'r' && row[8] === '0d4904'));
  assert(rows.some(row => row[0] === 'w' && row[2] === 'install' && row[8] === '0e4904'));
});

test('selection is limited to the observed product, software and hardware before fallback', () => {
  const rows = selection.filter(row => row.includes('!load,bai.0010011694.inc,'));
  assert.equal(rows.length, 1);
  assert.equal(rows[0], "[Scan_id_product='0010011694'][id_sw=0602][id_hw=5502]!load,bai.0010011694.inc,,,");
  const fallback = selection.findIndex(row => row.startsWith('[id_hw=5502]!load,bai.0010011701.inc,'));
  assert(fallback > selection.indexOf(rows[0]));
});

test('observed one-byte reply matches Comfort, unlike the empty old-register reply', () => {
  // Captured from one unit, 2026-10-28; neither a write nor an Eco read was tested.
  const oldReply = Buffer.from('00', 'hex');
  const newReply = Buffer.from('0101', 'hex');
  assert.equal(oldReply[0], oldReply.length - 1);
  assert.equal(oldReply.length - 1, 0);
  assert.equal(newReply[0], newReply.length - 1);
  assert.equal(newReply[1], 1);
  const mapping = Object.fromEntries(variant.find(isPump).split(',')[12].split(';').map(pair => pair.split('=')));
  assert.equal(mapping[newReply[1]], 'comfort');
  assert.equal(mapping[0], undefined);
});
