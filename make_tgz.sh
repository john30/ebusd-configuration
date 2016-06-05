#!/bin/sh
# ebusd-configuration - configuration files for ebusd, a daemon for
# communication with eBUS heating systems.
# Copyright (C) 2014-2016 John Baier <ebusd@ebusd.eu>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

echo "*************"
echo " prepare"
echo "*************"
echo
LANG=$1
if [ -z "$LANG" ]; then
  LANG="en"
fi
GITVER=`git describe --always 2>/dev/null || (echo -n 'p'; date +%Y%m%d)`
VERSION=`head -n 1 VERSION`
VERSION="$VERSION.$GITVER-$LANG"
ARCH="all"
BUILD="build-$ARCH"
RELEASE="ebusd-configuration-$VERSION"
PACKAGE="${RELEASE}_${ARCH}.tgz"

echo
echo "*************"
echo " pack"
echo "*************"
echo
tar czf "$PACKAGE" -C ebusd-2.1.x/$LANG --exclude=./.* . || exit 1

echo
files=`tar tzvf "$PACKAGE"|wc -l`
echo "Package created: $PACKAGE, $files files"
