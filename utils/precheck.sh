#!/bin/bash -e
# helper for generating compiled output from `src` into `outcsv` for checking before publishing
cd "$(dirname "$0")/.."
rm -rf outcsv*
npm run compile
mkdir -p outcsv/en outcsv/de
mv outcsv/@ebusd/ebus-typespec/* outcsv/en/
mv outcsv.de/@ebusd/ebus-typespec/* outcsv/de/
rm -rf outcsv/@ebusd outcsv.de
find src -type l -exec ./utils/copylink.sh src \{\} outcsv/de outcsv/en \;
