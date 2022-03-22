#ifndef chtypes_rt_h
#define chtypes_rt_h
#ifdef __AVR__
#include "os/common/ports/AVR/chtypes.h"
#elif defined(__arm__)
#include "os/common/ports/ARM/chtypes.h"
#else 
#error "unknown processor type"
#endif  // __AVR__
#endif  // chtypes_rt_h