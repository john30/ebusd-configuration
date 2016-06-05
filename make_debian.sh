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
PACKAGE="${RELEASE}_${ARCH}.deb"
rm -rf "$BUILD"
mkdir -p "$BUILD" || exit 1
cd "$BUILD" || exit 1

echo
echo "*************"
echo " pack"
echo "*************"
echo
mkdir -p $RELEASE/DEBIAN $RELEASE/etc/ebusd || exit 1
(tar cf - -C ../ebusd-2.1.x/$LANG "--exclude=./$BUILD" --exclude=./.* . | tar xf - -C $RELEASE/etc/ebusd) || exit 1

cat <<EOF > $RELEASE/DEBIAN/control
Package: ebusd-configuration
Version: $VERSION
Section: net
Priority: required
Architecture: $ARCH
Maintainer: John Baier <ebusd@ebusd.eu>
Homepage: https://github.com/john30/ebusd-configuration
Bugs: https://github.com/john30/ebusd-configuration/issues
Depends: ebusd (>= 2.1)
Description: ebusd configuration files ($LANG).
EOF
cat <<EOF > $RELEASE/DEBIAN/dirs
/etc/ebusd
EOF

dpkg -b $RELEASE || exit 1
mv ebusd-configuration-$VERSION.deb "../$PACKAGE" || exit 1

echo
echo "*************"
echo " cleanup"
echo "*************"
echo
cd ..
rm -rf "$BUILD"

echo
files=`dpkg -c "$PACKAGE"|wc -l`
echo "Package created: $PACKAGE, $files files"
