#ifndef chcore_rt_h
#define chcore_rt_h
#ifdef __AVR__
#include "os/avr/chcore.h"
#else  // __AVR__ 
#include "os/arm/chcore.h" 
#endif  // __AVR__
#endif  // chcore_rt_h
