# Thorlabs APT protocol

https://www.thorlabs.com/Software/Motion%20Control/APT_Communications_Protocol.pdf

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
  ** message ID: describes what the action the message requests
  * datapacket length: number of bytes to follow after header
    * Note: although this is a 2-byte long field, currently no datapacket exceeds 255 bytes in length.
  * dest: | 0x80 the destination module logic OR’d with 0x80 (noted by d|)
  * source: the source of the data
    
