# move Relative

* thorLabsAptMotorDriver.h
```
#define P_MoveRelative_String "MOVE_RELATIVE"
int P_MoveRelative;
```
## Little endian
```
Example:
Host-Controller Communications Protocol
Issue 26
Move the motor associated with chan 2 by 10 mm:
TX 48, 04, 06, 00, A2, 01, 01, 00, 40, 0D, 03, 00,
Header: 45, 04, 06, 00, A2, 01: MoveRelative, 06 byte data packet, Channel 2.
Chan Ident: 01, 00: Channel 1 (always set to 1 for TDC001)
Rel Dist: 40, 0D, 03, 00: Set absolute move distance to 10 mm (200,000 encoder counts).
```
* NOTE
DEC(200,000) = HEX(00 03 0D 40).
