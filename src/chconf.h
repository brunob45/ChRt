#ifndef chconf_rt_h
#define chconf_rt_h
#define _CHIBIOS_RT_CONF_
#ifdef __AVR__
#include "boards/avr/chconf_avr.h"
#elif defined(__SAM3X8E__) || defined(__SAM3X8H__)
#include "boards/sam3x/chconf_sam3x.h"
#elif defined(__SAMD21G18A__) || defined(__SAMD21J18A__)
#include "boards/samd/chconf_samd.h"
#elif defined(__MK20DX256__) || defined(__MK20DX128__)\
      || defined(__MK64FX512__) || defined(__MK66FX1M0__)
#include "boards/teensy3/chconf_teensy3.h"    
#elif defined(__IMXRT1062__)
#include "boards/teensy4/chconf_teensy4.h"   
#else 
#error "unknown processor type"
#endif  // __AVR__
#include "os/rt/templates/chconf.h"
#endif  // chconf_rt_h
