#!/bin/bash

CHIBIOS_VERSION=21.11.3
CMSIS_VERSION=6.0.0

if [ ! -d "extra/chibios" ]; then
    echo "Downloading ChibiOS ${CHIBIOS_VERSION}"
    #svn is deprecated
    #svn checkout https://svn.osdn.net/svnroot/chibios/tags/ver${CHIBIOS_VERSION}/os/ extra/chibios
     git clone --depth 1 -b ver${CHIBIOS_VERSION} https://github.com/ChibiOS/ChibiOS extra/chibios
fi
if [ ! -d "extra/cmsis" ]; then
    echo "Downloading CMSIS ${CMSIS_VERSION}"
    git clone --depth 1 -b v${CMSIS_VERSION} https://github.com/ARM-software/CMSIS_6 extra/cmsis
fi

echo "Replacing files"
rm -r src/os/*
cp -r extra/chibios/os/rt src/os/rt
cp -r extra/chibios/os/oslib src/os/oslib
cp -r extra/chibios/os/license src/os/license
cp -r extra/cmsis/CMSIS/Core/Include/ src/os/CMSIS

mkdir src/os/hal
cp extra/chibios/os/hal/include/hal_st.h src/os/hal/
cp extra/chibios/os/hal/osal/rt-nil/osal.h src/os/hal/
cp extra/chibios/os/hal/src/hal_st.c src/os/hal/

mkdir src/os/avr
cp extra/chibios/os/common/ports/AVR/chcore.c src/os/avr/
cp extra/chibios/os/common/ports/AVR/chcore.h src/os/avr/
cp extra/chibios/os/common/ports/AVR/compilers/GCC/chtypes.h src/os/avr/
cp extra/chibios/os/hal/osal/rt-nil/chcore_timer.h src/os/avr/
cp extra/chibios/os/common/portability/GCC/ccportab.h src/os/avr/

mkdir src/os/arm
cp extra/chibios/os/common/ports/ARMv7-M/mpu.h src/os/arm/
cp extra/chibios/os/common/ports/ARM-common/chtypes.h src/os/arm/
cp extra/chibios/os/hal/osal/rt-nil/chcore_timer.h src/os/arm/
cp extra/chibios/os/common/portability/GCC/ccportab.h src/os/arm/

cp extra/chibios/os/common/ports/ARMv6-M/chcore.c src/os/arm/chcore_v6m.c
cp extra/chibios/os/common/ports/ARMv6-M/chcore.h src/os/arm/chcore_v6m.h
cp extra/chibios/os/common/ports/ARMv7-M/chcore.c src/os/arm/chcore_v7m.c
cp extra/chibios/os/common/ports/ARMv7-M/chcore.h src/os/arm/chcore_v7m.h
cp extra/chibios/os/common/ports/ARMv6-M/compilers/GCC/chcoreasm.S src/os/arm/chcoreasm_v6m.S
cp extra/chibios/os/common/ports/ARMv7-M/compilers/GCC/chcoreasm.S src/os/arm/chcoreasm_v7m.S

# Patch ports
echo "Applying patches"
git apply extra/patch.diff

echo "Done"
