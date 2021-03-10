# motorThorLabsApt Releases

## __R1-0 (2021-03-09)__
R1-0 is an initial release based on the master branch.  

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
