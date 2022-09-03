#!/bin/bash

CHIBIOS_VERSION=21.11.2
CMSIS_VERSION=5.9.0

if [ ! -d "extra/chibios" ]; then
    echo "Downloading ChibiOS ${CHIBIOS_VERSION}"
    svn checkout https://svn.osdn.net/svnroot/chibios/tags/ver${CHIBIOS_VERSION}/os/ extra/chibios
fi
if [ ! -d "extra/cmsis" ]; then
    echo "Downloading CMSIS ${CMSIS_VERSION}"
    git clone --depth 1 -b ${CMSIS_VERSION} https://github.com/ARM-software/CMSIS_5 extra/cmsis
fi

echo "Replacing files"
rm -r src/os/*
cp -r extra/chibios/rt src/os/rt
cp -r extra/chibios/oslib src/os/oslib
cp -r extra/chibios/license src/os/license
cp -r extra/cmsis/CMSIS/Core/Include/ src/os/CMSIS

mkdir src/os/hal
cp extra/chibios/hal/include/hal_st.h src/os/hal/
cp extra/chibios/hal/osal/rt-nil/osal.h src/os/hal/
cp extra/chibios/hal/src/hal_st.c src/os/hal/

mkdir src/os/avr
cp extra/chibios/common/ports/AVR/chcore.c src/os/avr/
cp extra/chibios/common/ports/AVR/chcore.h src/os/avr/
cp extra/chibios/common/ports/AVR/compilers/GCC/chtypes.h src/os/avr/
cp extra/chibios/hal/osal/rt-nil/chcore_timer.h src/os/avr/
cp extra/chibios/common/portability/GCC/ccportab.h src/os/avr/

mkdir src/os/arm
cp extra/chibios/common/ports/ARMv7-M/mpu.h src/os/arm/
cp extra/chibios/common/ports/ARM-common/chtypes.h src/os/arm/
cp extra/chibios/hal/osal/rt-nil/chcore_timer.h src/os/arm/
cp extra/chibios/common/portability/GCC/ccportab.h src/os/arm/

cp extra/chibios/common/ports/ARMv6-M/chcore.c src/os/arm/chcore_v6m.c
cp extra/chibios/common/ports/ARMv6-M/chcore.h src/os/arm/chcore_v6m.h
cp extra/chibios/common/ports/ARMv7-M/chcore.c src/os/arm/chcore_v7m.c
cp extra/chibios/common/ports/ARMv7-M/chcore.h src/os/arm/chcore_v7m.h
cp extra/chibios/common/ports/ARMv6-M/compilers/GCC/chcoreasm.S src/os/arm/chcoreasm_v6m.S
cp extra/chibios/common/ports/ARMv7-M/compilers/GCC/chcoreasm.S src/os/arm/chcoreasm_v7m.S

# Patch ports
echo "Applying patches"
git apply extra/patch.diff

echo "Done"
