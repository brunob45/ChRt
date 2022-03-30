#!/bin/bash

rm -r src/os/*
cp -r ChibiOS/os/rt src/os/rt
cp -r ChibiOS/os/oslib src/os/oslib
cp -r ChibiOS/os/license src/os/license
cp -r CMSIS_5/CMSIS/Core/Include/ src/os/CMSIS

mkdir src/os/hal
printf '#include "ch.h"\n#include "osal.h"\n#include "hal_st.h"' > src/os/hal/hal.h
cp ChibiOS/os/hal/include/hal_st.h src/os/hal/
cp ChibiOS/os/hal/osal/rt-nil/osal.h src/os/hal/
cp ChibiOS/os/hal/src/hal_st.c src/os/hal/

mkdir src/os/avr
cp ChibiOS/os/common/ports/AVR/chcore.c src/os/avr/
cp ChibiOS/os/common/ports/AVR/chcore.h src/os/avr/
cp ChibiOS/os/common/ports/AVR/compilers/GCC/chtypes.h src/os/avr/
cp ChibiOS/os/hal/osal/rt-nil/chcore_timer.h src/os/avr/
cp ChibiOS/os/common/portability/GCC/ccportab.h src/os/avr/

mkdir src/os/arm
cp ChibiOS/os/common/ports/ARMv7-M/mpu.h src/os/arm/
cp ChibiOS/os/common/ports/ARM-common/chtypes.h src/os/arm/
cp ChibiOS/os/hal/osal/rt-nil/chcore_timer.h src/os/arm/
cp ChibiOS/os/common/portability/GCC/ccportab.h src/os/arm/

cp ChibiOS/os/common/ports/ARMv6-M/chcore.c src/os/arm/chcore_v6m.c
cp ChibiOS/os/common/ports/ARMv6-M/chcore.h src/os/arm/chcore_v6m.h
cp ChibiOS/os/common/ports/ARMv7-M/chcore.c src/os/arm/chcore_v7m.c
cp ChibiOS/os/common/ports/ARMv7-M/chcore.h src/os/arm/chcore_v7m.h
cp ChibiOS/os/common/ports/ARMv6-M/compilers/GCC/chcoreasm.S src/os/arm/chcoreasm_v6m.S
cp ChibiOS/os/common/ports/ARMv7-M/compilers/GCC/chcoreasm.S src/os/arm/chcoreasm_v7m.S

# Patch ports
git apply .github/scripts/upstream.diff
