# APT unsuccessful

```
kaz@kaz-desktop:/epics/iocs/motorThorLabsApt/iocBoot/iocmotorThorLabsApt$ ./st.cmd 
#!../../bin/linux-x86_64/motorThorLabsApt
< envPaths
epicsEnvSet("IOC","iocmotorThorLabsApt")
epicsEnvSet("TOP","/epics/iocs/motorThorLabsApt")
epicsEnvSet("SUPPORT","/epics/support")
epicsEnvSet("ASYN","/epics/support/asyn")
epicsEnvSet("BUSY","/epics/support/busy")
epicsEnvSet("MOTOR","/epics/support/motor")
epicsEnvSet("SNCSEQ","/epics/support/seq")
epicsEnvSet("EPICS_BASE","/epics/base")
cd "/epics/iocs/motorThorLabsApt"
## Register all support components
dbLoadDatabase "dbd/motorThorLabsApt.dbd"
motorThorLabsApt_registerRecordDeviceDriver pdbbase
## Load record instances
dbLoadTemplate "db/user.substitutions"
dbLoadRecords "db/motorThorLabsAptVersion.db", "user=kaz"
## motorUtil (allstop & alldone)
dbLoadRecords("/epics/support/motor/db/motorUtil.db", "P=thorLabsApt:")
cd "/epics/iocs/motorThorLabsApt/iocBoot/iocmotorThorLabsApt"
# Uncomment one of the following lines for KDB101 or another controller
#< thorLabsKDB101.iocsh
< thorLabsKDB101.iocsh
### Motors
# dbLoadTemplate "motor.substitutions.thorLabsKDB101"
#drvAsynIPPortConfigure("APT_ETH", "10.0.1.200:55551", 0, 0, 0)
#######  KDB101 via com-port #########################
### use RS232 over USB, ttyUSB0, baud = 9600. 
##
#drvAsynSerialPortConfigure "COM1", "/dev/ttyS0"
drvAsynSerialPortConfigure "COM1", "/dev/ttyUSB0"
2021/03/08 19:18:57.925 COM1 -1 autoConnect could not connect: /dev/ttyUSB0 Can't open  No such file or directory
 
asynOctetSetInputEos "COM1",0,"\r"
asynOctetSetOutputEos "COM1",0,"\r"
#asynSetOption ("COM1", 0, "baud", "115200")
asynSetOption ("COM1", 0, "baud", "9600")
asynSetOption ("COM1", 0, "bits", "8")
asynSetOption ("COM1", 0, "parity", "none")
asynSetOption ("COM1", 0, "stop", "1")
asynSetOption ("COM1", 0, "clocal", "Y")
asynSetOption ("COM1", 0, "crtscts", "N")
dbLoadRecords("/epics/support/asyn/db/asynRecord.db", "P=IOC:, R=Asyn1, PORT=APT_ETH, ADDR=0, OMAX=256, IMAX=256")
# PORT, APT_PORT, number of axes, active poll period (ms), idle poll period (ms)
#MCS2CreateController("APT", "APT_ETH", 1, 100, 100)
ThorlabsAPTConfigure("KDB", "COM1")
ThorlabsAPT: timeout waiting for message MGMSG_HW_GET_INFO
#asynSetTraceMask("APT", 0, 255)
asynSetTraceIOMask("KDB", -1, 0x8)
#traceIocInit
# cd "${TOP}/iocBoot/${IOC}"
iocInit
Starting iocInit
############################################################################
## EPICS R7.0.4.1
## Rev. R7.0.4.1
############################################################################
KBD101{DDSM100-1}Ch1:StatusForwardLimit devAsynUInt32Digital::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Ch1:StatusReverseLimit devAsynUInt32Digital::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Ch1:StatusMovingForward devAsynUInt32Digital::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Ch1:StatusMovingReverse devAsynUInt32Digital::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Ch1:StatusHoming devAsynUInt32Digital::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Ch1:StatusHomed devAsynUInt32Digital::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Ch1:StatusEnabled devAsynUInt32Digital::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Ch1:CurrentPosition devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Ch1:CurrentVelocity devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}LastEventNotes devAsynOctet::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}ModelNumber devAsynOctet::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Notes devAsynOctet::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Ch1:MinVelocity devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
Error (514,514) PV: KBD101{DDSM100-1}Ch1:MinVelocity ao: init_record

KBD101{DDSM100-1}Ch1:Acceleration devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
Error (514,514) PV: KBD101{DDSM100-1}Ch1:Acceleration ao: init_record

KBD101{DDSM100-1}Ch1:MaxVelocity devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
Error (514,514) PV: KBD101{DDSM100-1}Ch1:MaxVelocity ao: init_record

KBD101{DDSM100-1}Ch1:Backlash devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
Error (514,514) PV: KBD101{DDSM100-1}Ch1:Backlash ao: init_record

KBD101{DDSM100-1}Ch1:MoveAbsolute devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
Error (514,514) PV: KBD101{DDSM100-1}Ch1:MoveAbsolute ao: init_record

KBD101{DDSM100-1}Ch1:Enabled devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Ch1:MoveStop devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}Ch1:MoveHome devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
2021/03/08 19:18:58.929 IOC:Asyn1: Connect error, status=3, asynManager:connectDevice port APT_ETH not found
KBD101{DDSM100-1}NumEvents devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}LastEvent devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}SerialNumber devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}FirmwareVersionMajor devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}FirmwareVersionInterim devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}FirmwareVersionMinor devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}HardwareVersion devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}ModState devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
KBD101{DDSM100-1}NumberChannels devAsynInt32::initCommon connectDevice failed asynManager:connectDevice port KBD not found
iocRun: All initialization complete
## Start any sequence programs
#seq sncExample, "user=kaz"
epics> help
Type 'help <command>' to see the arguments of <command>.
#               ClockTime_Report                ClockTime_Shutdown
ThorlabsAPTConfigure            asDumpHash      asInit          asSetFilename
asSetSubstitutions              ascar           asdbdump        asphag
aspmem          asprules        aspuag          astac           
asynAutoConnect asynEnable      asynInterposeDelay              
asynInterposeEcho               asynInterposeEosConfig          
asynInterposeFlushConfig        asynMotorEnableMoveToHome       
asynOctetConnect                asynOctetDisconnect             asynOctetFlush
asynOctetGetInputEos            asynOctetGetOutputEos           asynOctetRead
asynOctetSetInputEos            asynOctetSetOutputEos           asynOctetWrite
asynOctetWriteRead              asynRegisterTimeStampSource     asynReport
asynSetAutoConnectTimeout       asynSetMinTimerPeriod           asynSetOption
asynSetQueueLockPortTimeout     asynSetTraceFile                
asynSetTraceIOMask              asynSetTraceIOTruncateSize      
asynSetTraceInfoMask            asynSetTraceMask                asynShowOption
asynUnregisterTimeStampSource   asynWaitConnect callbackParallelThreads
callbackQueueShow               callbackSetQueueSize            casr
cd              coreRelease     date            dbDumpBreaktable
dbDumpDevice    dbDumpDriver    dbDumpField     dbDumpFunction  dbDumpLink
dbDumpMenu      dbDumpPath      dbDumpRecord    dbDumpRecordType
dbDumpRegistrar dbDumpVariable  dbLoadDatabase  dbLoadRecords   dbLoadTemplate
dbLockShowLocked                dbNotifyDump    dbPutAttribute  dbPvdDump
dbPvdTableSize  dbReportDeviceConfig            dbStateClear    dbStateCreate
dbStateSet      dbStateShow     dbStateShowAll  dba             dbap
dbb             dbc             dbcar           dbd             dbel
dbgf            dbgl            dbgrep          dbhcr           dbior
dbjlr           dbl             dbla            dbli            dblsr
dbnr            dbp             dbpf            dbpr            dbpvar
dbs             dbsr            dbstat          dbtgf           dbtpf
dbtpn           dbtr            drvAsynIPPortConfigure          
drvAsynIPServerPortConfigure    drvAsynMotorConfigure           
drvAsynSerialPortConfigure      echo            eltc            epicsEnvSet
epicsEnvShow    epicsEnvUnset   epicsMutexShowAll               epicsParamShow
epicsPrtEnvParams               epicsThreadResume               
epicsThreadShow epicsThreadShowAll              epicsThreadSleep
errlog          errlogInit      errlogInit2     exit            
generalTimeReport               gft             help            
installLastResortEventProvider  iocBuild        iocInit         iocLogInit
iocLogPrefix    iocLogShow      iocPause        iocRun          iocshCmd
iocshLoad       iocshRun        listMovingMotors                
motorThorLabsApt_registerRecordDeviceDriver     motorUtilInit   on
pft             postEvent       printChIDlist   pval            pvasr
pwd             refdiff         refmon          refsave         refshow
registryDeviceSupportFind       registryDriverSupportFind       registryDump
registryFunctionFind            registryRecordTypeFind          
scanOnceQueueShow               scanOnceSetQueueSize            scanpel
scanpiol        scanppl         setIdlePollPeriod               
setIocLogDisable                setMovingPollPeriod             startPVAServer
stopPVAServer   taskwdShow      tpn             var             
epics> dbl
KBD101{DDSM100-1}Ch1:StatusForwardLimit
KBD101{DDSM100-1}Ch1:StatusReverseLimit
KBD101{DDSM100-1}Ch1:StatusMovingForward
KBD101{DDSM100-1}Ch1:StatusMovingReverse
KBD101{DDSM100-1}Ch1:StatusHoming
KBD101{DDSM100-1}Ch1:StatusHomed
KBD101{DDSM100-1}Ch1:StatusEnabled
thorLabsApt:alldone
KBD101{DDSM100-1}Ch1:CurrentPosition
KBD101{DDSM100-1}Ch1:CurrentVelocity
kaz:motorThorLabsApt:version
thorLabsApt:alldoneBlink
KBD101{DDSM100-1}LastEventNotes
KBD101{DDSM100-1}ModelNumber
KBD101{DDSM100-1}Notes
thorLabsApt:movingDiff
thorLabsApt:moving
KBD101{DDSM100-1}Ch1:MinVelocity
KBD101{DDSM100-1}Ch1:Acceleration
KBD101{DDSM100-1}Ch1:MaxVelocity
KBD101{DDSM100-1}Ch1:Backlash
KBD101{DDSM100-1}Ch1:MoveAbsolute
KBD101{DDSM100-1}Ch1:Enabled
KBD101{DDSM100-1}Ch1:MoveStop
KBD101{DDSM100-1}Ch1:MoveHome
thorLabsApt:allstop
IOC:Asyn1
KBD101{DDSM100-1}NumEvents
KBD101{DDSM100-1}LastEvent
KBD101{DDSM100-1}SerialNumber
KBD101{DDSM100-1}FirmwareVersionMajor
KBD101{DDSM100-1}FirmwareVersionInterim
KBD101{DDSM100-1}FirmwareVersionMinor
KBD101{DDSM100-1}HardwareVersion
KBD101{DDSM100-1}ModState
KBD101{DDSM100-1}NumberChannels
epics> dbpr KBD101{DDSM100-1}NumberChannels
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}NumberChannels   SEVR: INVALID       
STAT: UDF           SVAL: 0             TPRO: 0             VAL : 0             
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: 0             SEVR: INVALID       STAT: UDF           SVAL: 0             
TPRO: 0             VAL : 0             
```
