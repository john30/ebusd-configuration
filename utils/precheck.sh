#!/bin/bash -e
# helper for generating compiled output from `src` into `outcsv` (or the folder passed in as first argument) for checking before publishing
targetdir="${1:-outcsv}"
targetdir="$(realpath "$targetdir")"
cd "$(dirname "$0")/.."
rm -rf outcsv*
npm run compile
mv outcsv/@ebusd/ebus-typespec outcsv/en
mv outcsv.de/@ebusd/ebus-typespec outcsv/de
rm -rf outcsv/@ebusd outcsv.de
find src -type l -exec ./utils/copylink.sh src \{\} outcsv/de outcsv/en \;
if [[ "$(realpath outcsv)" != "$targetdir" ]]; then
  echo "moving folders to $targetdir"
  mkdir -p "$targetdir/"
  mv outcsv/en "$targetdir/"
  mv outcsv/de "$targetdir/"
  rm -rf outcsv
fi
