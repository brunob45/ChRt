#ifndef chcore_rt_h
#define chcore_rt_h
#ifdef __AVR__
#include "os/avr/chcore.h"
#else  // __AVR__ 

#include "cmparams.h"

/* Includes the sub-architecture-specific part.*/
#if (CORTEX_MODEL == 0) || (CORTEX_MODEL == 1)
#include "os/arm/chcore_v6m.h"
#elif (CORTEX_MODEL == 3) || (CORTEX_MODEL == 4) || (CORTEX_MODEL == 7)
#include "os/arm/chcore_v7m.h"
#else
#error "unknown Cortex-M variant"
#endif

#endif  // __AVR__
#endif  // chcore_rt_h
