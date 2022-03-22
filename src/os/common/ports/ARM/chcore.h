
/* Inclusion of the Cortex-Mx implementation specific parameters.*/
#include "cmparams.h"

/* Includes the sub-architecture-specific part.*/
#if (CORTEX_MODEL == 0) || (CORTEX_MODEL == 1)
#include "chcore_v6m.h"
#elif (CORTEX_MODEL == 3) || (CORTEX_MODEL == 4) || (CORTEX_MODEL == 7)
#include "mpu.h"
#include "chcore_v7m.h"
#else
#error "unknown Cortex-M variant"
#endif