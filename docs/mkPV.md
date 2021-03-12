# PV - Absolute Move

* thorLabsAptMotorDriver.cpp:38:#define MGMSG_MOT_MOVE_ABSOLUTE         0x0453
```
#define MGMSG_MOT_SET_MOVEABSPARAMS     0x0450
#define MGMSG_MOT_REQ_MOVEABSPARAMS     0x0451
#define MGMSG_MOT_GET_MOVEABSPARAMS     0x0452
#define MGMSG_MOT_MOVE_ABSOLUTE         0x0453
```
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
```
    createParam(P_MinVelocity_String, asynParamInt32, &P_MinVelocity);
    setIntegerParam(P_MinVelocity, (data[5] << 24) | (data[4] << 16) | (data[3] << 8) | data[2]);
    createParam(P_Acceleration_String, asynParamInt32, &P_Acceleration);
    setIntegerParam(P_Acceleration, (data[9] << 24) | (data[8] << 16) | (data[7] << 8) | data[6]);
```
    createParam(P_MaxVelocity_String, asynParamInt32, &P_MaxVelocity);
    setIntegerParam(P_MaxVelocity, (data[13] << 24) | (data[12] << 16) | (data[11] << 8) | data[10]);
    free(data);
    
    // Channel 1: Get destination of last absolute move command
    sendShortCommand(MGMSG_MOT_REQ_MOVEABSPARAMS, 1, 0);
    status = waitForReply(MGMSG_MOT_GET_MOVEABSPARAMS, (char **) &data, &dataLen);
```

* "HOMING": thorLabsAptMotorDriver.cpp:396:            setIntegerParam(P_MoveAbsolute, 0);
    * void ThorlabsAPTDriver::processUnsolicitedMessage(unsigned short int messageId, unsigned char *extraData, size_t extraDataLen) {
        * case MGMSG_MOT_MOVE_HOMED: {
            * setIntegerParam(P_MoveAbsolute, 0);

* thorLabsAptMotorDriver.cpp:499:    if (function == P_MoveAbsolute) {
* thorLabsAptMotorDriver.cpp:500:        setIntegerParam(P_MoveAbsolute, value);
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
