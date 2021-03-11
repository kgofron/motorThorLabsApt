# Thorlabs APT protocol

## Vendor documentation
* Communiction: https://www.thorlabs.com/Software/Motion%20Control/APT_Communications_Protocol.pdf
* User Guide APT: https://www.thorlabs.com/drawings/6d057d00f144dd5c-5B951A3C-C8ED-2099-EFA9FD3C443C4BCA/KBD101-KBD101ManualforAPT.pdf
* User Guide Kinesis: https://www.thorlabs.com/drawings/6d057d00f144dd5c-5B951A3C-C8ED-2099-EFA9FD3C443C4BCA/KBD101-KBD101ManualforKinesis.pdf

## KBD101
This device came with Future Technology Devices International (FTDI), type FT232BM USB chip.
* Low level protocol
  * USB2.0 FT232BM/FTDI chip
  * RS232
* Note: Beware of USB enumeration scheme.

========================================

* USB communication settings
  * baud rate = 115200
  * 8 data bits
  * 1 stop bit
  * no parity
  * Pre purge dwell 50ms.
  * Purge the device.
  * Post purge dwell 50ms.
  * Thorlabs APT Controllers Host-Controller Communications Protocol Issue 26, Page 30 of 385
  * Reset device.
  * Set flow control to RTS/CTS.
  * Set RTS.

=========================================
* USB Device Enumeration
  * Read 8 digit USB S/N from USB device descriptor
    * 28xxxxxx = KBD101, controller type 1st two digits

=========================================

## Communication Protocol
* 6-byte message header {always}
  * MSB in header byte 4 (dest) is not set for simple message.
* Variable length "data packet" {some cases: complex commands = set of parameters passed}
  * MSB in header byte 4 (dest|0x80) is set
* Intel little endian format
  
* Simple message: no data packet to follow
```
-------------------------------------------------------
| byte 0 | byte 1 | byte 2 | byte 3 | byte 4 | byte 5 |
|--------|--------|--------|--------|--------|--------|
| message ID      | param1 | param2 | dest   | source |
-------------------------------------------------------
```
  * message ID: describes what the action the message requests
  * param1: first parameter (if the command requires a parameter, otherwise 0)
  * param2: second parameter (if the command requires a parameter, otherwise 0)
  * dest: the destination module
  * source: the source of the message

* Complex message: data packet to follow
```
-------------------------------------------------------------
| byte 0 | byte 1 | byte 2 | byte 3    | byte 4    | byte 5 |
| message ID      | data packet length | dest|0x80 | source |
-------------------------------------------------------------
```
  * message ID: describes what the action the message requests
  * datapacket length: number of bytes to follow after header
    * Note: although this is a 2-byte long field, currently no datapacket exceeds 255 bytes in length.
  * dest: | 0x80 the destination module logic OR’d with 0x80 (noted by d|)
  * source: the source of the data
    
* Source / Destination {non-card-slot}
  * src  = 0x01 {host}
  * dest = 0x50 {generic USB unit}

* Source / Destination {card-slot}
  * See page 33/385 {send to motherboard with destination field of slot}

======================================
### Message exchange rules

A. No information from the sub-module (set digital outputs).
   1. Host issues a command,
   2. Sub-module carries out the command without acknowledgement
      1. no response is sent back to the host.
      
B. SET -> REQUEST -> GET. {Request the sub-module to report the state of the digital inputs}
   1. Host issues a command (message request)
   2. Sub-module responds by sending data back to the host.

C. Status update messages (sent automatically every 100 msec from the sub-module to the host).
   1. Command from the host,
   2. Sub-module periodically sends a message to the host without further prompting.

D. Error messages, exceptions (rearly).
   1. Spontaneously issued by the sub-module if some error occurs.
      1. Power supply fails in the sub-module, a message is sent to the host PC to inform the user.

=======================================
### Format specifiers

| format | encoding |
|--------|----------|
| word   | Unsigned 16 bit integer (2 bytes) in the Intel (little-endian) format for example decimal 12345 (3039H) is encoded as the byte sequence 39, 30 |
| short  | Signed 16 bit integer (2 bytes) in 2’s compliment format for example decimal -1 is encoded as the byte sequence FF, FF |
| dword  | Unsigned 32 bit integer (4 bytes) in the Intel (little-endian) format for example decimal 123456789 (75BCD15H) is encoded as the byte sequence 15, CD, 5B, 07 |
| long   | Signed 32 bit integer (4 bytes) in 2’s compliment format for example decimal -1 is encoded as the byte sequence FF, FF 4 bytes in the Intel (little-endian) format for example decimal -123456789 (FFFFFFFFF8A432EBH) is encoded as the byte sequence EB, 32, A4, F8, |
| char   | 1 byte (2 digits) |
| char[N] | string of N characters |

