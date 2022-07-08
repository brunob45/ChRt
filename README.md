#### ChRt - ChibiOS/RT Arduino Library

This is an updated version of ChibiOS for Arduino, forked from greiman/ChRt. 

- Teensy 4.0 has support for free running tick-less mode (default) and periodic mode.
- AVR has support for periodic mode (default) and tick-less mode.
- Due, SAMD, and Teensy 3.x are supported in periodic mode.

The base code for ChRt was written by Giovanni Di Sirio, the author
of ChibiOS/Nil and ChibiOS/RT.

See this site for detailed documentation of ChibiOS/RT.

http://www.chibios.org/dokuwiki/doku.php

The kernel is version 7.0.3 of ChibiOS/RT from ChibiOS release 21.11.2. 
CMSIS version 5.9.0 is also included.

https://osdn.net/projects/chibios/releases

If you are installing from the GitHub repo zips, rename the folder ChRt
before copying it to your Arduino/libraries folder.

Please read libraries/ChRt/doc/ChRt.html for more information.  See the 
Examples section of the html documentation.

Start with the ChBlink example which is traditional for almost every RTOS.

