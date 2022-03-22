## Files from upstream "as is":

```
ChibiOS (upstream)
└─os
  └─common
  | └─ext/ARM/CMSIS/Core/*
  | └─portability/GCC/ccportab.h
  | └─ports
  |   └─ARMv6-common/chtypes.h
  |   └─ARMv6-M/chcore.h
  |   └─ARMv7-M
  |   | └─chcore.h
  |   | └─mpu.h
  |   └─AVR
  |     └─compilers/GCC/chtypes.h
  |     └─chcore.h
  └─hal
  | └─include/hal_st.h
  | └─osal/rt-nil/osal.h
  | └─osal/rt-nil/chcore_timer.h
  | └─src/hal_st.c
  └─license/*
  └─oslib/*
  └─rt/*
```
```
ChRt (here)
└─src/os
  └─common
  | └─CMSIS/*
  | └─ports
  |   └─ARM
  |   | └─ccportab.h
  |   | └─chcore_timer.h
  |   | └─chcore_v6m.h
  |   | └─chcore_v7m.h
  |   | └─chtypes.h
  |   | └─mpu.h
  |   └─AVR
  |     └─ccportab.h
  |     └─chcore_timer.h
  |     └─chcore.h
  |     └─chtypes.h
  └─hal
  | └─hal_st.c
  | └─hal_st.h
  | └─osal.h
  └─license/*
  └─oslib/*
  └─rt/*
```

## Edited files

```
ChRt (here)
└─src
  └─boards/*                  (new files)
  └─os
  |  └─common
  |  | └─ports
  |  |   └─ARM
  |  |   | └─chcore_v6m.c     (#include guard)
  |  |   | └─chcore_v7m.c     (#include guard)
  |  |   | └─chcore.h         (new file)
  |  |   | └─chcoreasm_v6m.S  (#include guard)
  |  |   | └─chcoreasm_v7m.S  (#include guard)
  |  |   └─AVR/chcore.c       (#include guard)
  |  └─hal/hal.h              (new file)
  └─*.c/cpp/h                 (new files)
```
