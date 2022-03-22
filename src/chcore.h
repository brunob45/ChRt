#ifndef chcore_rt_h
#define chcore_rt_h
#ifdef __AVR__
#include "common/ports/AVR/chcore.h"
#else  // __AVR__ 
#include "common/ports/ARM/chcore.h" 
#endif  // __AVR__
#endif  // chcore_rt_h
