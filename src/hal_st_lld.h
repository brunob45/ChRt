#include "os/rt/include/ch.h"
#if defined(__IMXRT1062__)
#include "boards/teensy4/st_lld.h"
#elif defined(__AVR__)
#include "boards/avr/st_lld.h"
#else  // defined(__IMXRT1062__)
#ifdef __cplusplus
extern "C" {
#endif
  void st_lld_init(void);
#ifdef __cplusplus
}
#endif
#endif  // defined(__IMXRT1062__)