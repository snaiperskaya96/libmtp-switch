#!/bin/bash
CPUS=$((`nproc --all` + 1))
source /opt/devkitpro/switchvars.sh
touch config.rpath
autoreconf -i
automake --add-missing --gnu || fail
./configure --host=aarch64-none-elf --prefix=/opt/devkitpro/portlibs/switch/ --exec-prefix=/opt/devkitpro/portlibs/switch/
make install -j`echo $CPUS`
