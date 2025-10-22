#!/bin/bash
# helper for copying symlinks in `$2` with base dir `$1` into `$3` and following
link=$(realpath -s --relative-to="$1" "$2")
target=$(realpath --relative-to="$1" "$2")
link=$(echo "$link"|sed -e 's#\.tsp#.csv#')
target=$(echo "$target"|sed -e 's#\.tsp#.csv#')
shift 2
while [[ -n "$1" ]]; do
  (
    dir=$(dirname $target)
    cd "$1"
    rel=$(realpath --relative-to="$dir" "$target")
    ln -s "$rel" "$link"
  )
  shift
done
