#!/bin/bash -eu

# Run this file if you want to make and install a static library. Don't
# run until after you've the bootstrap/configure/make/'make install' commands.
# Script relies on compiled assets from that process.
#
# The libtools files do not produce a static library, so this has to be run
# as an addenum command. (Alternatively you could modify configure.ac, but that
# M4 autotools nonsesne is *hard* to untangle).

cLibDir=./src/C++/.libs/
targetLibDir=/usr/local/lib/

# Regular make process should already compile .o files in
# the C++ library directory.
ar -rcs $cLibDir/libquickfix.a $cLibDir/*.o

# Remove any installed shared libs, so that compilation uses static library.
rm $targetLibDir/libquickfix*

cp $cLibDir/libquickfix.a $targetLibDir/

