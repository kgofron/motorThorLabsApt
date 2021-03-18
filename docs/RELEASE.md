# motorThorLabsApt Releases

## __R1-1 (2021-03-16)
* Relative motion implemented in the driver.
* opi screen(s)
* motor status PVs (Settled, PosError, DigiP1, DigiP2)
* motorThorLabsApt standalone ioc
* motor Stop/Home/Asyn 
* bug fixes (FirmwareVersion)
* Hardware Type PV
* motorThorLabsApt version 

## __R1-0 (2021-03-09)__
R1-0 is an initial release based on the master branch.  
This driver is based on asynPortDriver class, and is not using motorRecord.

#### New features {TODO}
* motorThorLabsApt as a standalone module, as well as a submodule of [motor](https://github.com/epics-modules/motor)
* motorThorLabsApt can be built inside/outside of the motor directory
* motorThorLabsApt has a dedicated example IOC that can be built outside of motorThorLabsApt
* opi screens

#### New features 
* motorThorLabsApt is built as stand alone ioc and outside of the motor directory.
* motorThorLabsApt uses APT communication (not Kinesis).
  * Switching between Kinesis (Windows app) and USB/APT (on windows) requires physical reboot of the computer AFAIK.
  * Driver development and testing was done only on Linux (Debian 10), but might work on windows.

#### Modifications to existing features
* None

#### Bug fixes
* None
