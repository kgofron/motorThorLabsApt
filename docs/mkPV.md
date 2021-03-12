# PV

* thorLabsAptMotorDriver.cpp:38:#define MGMSG_MOT_MOVE_ABSOLUTE         0x0453
* thorLabsAptMotorDriver.cpp:509:        return sendShortCommand(MGMSG_MOT_MOVE_ABSOLUTE);
    * thorLabsAptMotorDriver.cpp:35:#define MGMSG_MOT_SET_MOVEABSPARAMS	0x0450
```
    if (function == P_MoveAbsolute) {
        setIntegerParam(P_MoveAbsolute, value);
        unsigned char data[6];
        data[0] = 1;
        data[1] = 0;
        data[2] = value;
        data[3] = value >> 8;
        data[4] = value >> 16;
        data[5] = value >> 24;
        sendLongCommand(MGMSG_MOT_SET_MOVEABSPARAMS, data, 6);
        return sendShortCommand(MGMSG_MOT_MOVE_ABSOLUTE);
```
* thorLabsAptMotorDriver.h:37:#define P_MoveAbsolute_String "MOVE_ABSOLUTE"
* thorLabsAptMotorDriver.h:88:    int P_MoveAbsolute;
    * class ThorlabsAPTDriver : public asynPortDriver {
        * protected
            * int P_MoveAbsolute;

* thorLabsAptMotorDriver.cpp:156:    createParam(P_MoveAbsolute_String, asynParamInt32, &P_MoveAbsolute);

* ThorlabsAPTDriver::ThorlabsAPTDriver(const char *portName, const char *serialPortName)
   : asynPortDriver() {} 
    * thorLabsAptMotorDriver.cpp:156:    createParam(P_MoveAbsolute_String, asynParamInt32, &P_MoveAbsolute);
    * thorLabsAptMotorDriver.cpp:211:    setIntegerParam(P_MoveAbsolute, (data[5] << 24) | (data[4] << 16) | (data[3] << 8) | data[2]);
