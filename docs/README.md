# Thorlabs APT driver
* Autor: K. Gofron
* Date:  2021-3-9
* Based on: asynPortDriver class

## ioc start
```
kaz@kaz-desktop:/epics/iocs/motorThorLabsApt/iocBoot/iocmotorThorLabsApt$ sudo ./st.cmd 
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
drvAsynSerialPortConfigure("IP1", "/dev/ttyUSB0", 0, 0, 0)
 
#asynOctetSetInputEos "COM1",0,"\r"
#asynOctetSetOutputEos "COM1",0,"\r"
asynSetOption ("IP1", 0, "baud", "115200")
#asynSetOption ("IP1", 0, "baud", "9600")
asynSetOption ("IP1", 0, "bits", "8")
asynSetOption ("IP1", 0, "parity", "none")
asynSetOption ("IP1", 0, "stop", "1")
asynSetOption ("IP1", 0, "clocal", "Y")
asynSetOption ("IP1", 0, "crtscts", "N")
dbLoadRecords("/epics/support/asyn/db/asynRecord.db", "P=IOC:, R=Asyn, PORT=IP1, ADDR=0, OMAX=256, IMAX=256")
# PORT, APT_PORT, number of axes, active poll period (ms), idle poll period (ms)
#MCS2CreateController("APT", "APT_ETH", 1, 100, 100)
ThorlabsAPTConfigure("KBD", "IP1")
ThorlabsAPT: model KBD101; fw ver 1.0.0; hw ver 1; 1 channels
#asynSetTraceMask("APT", 0, 255)
asynSetTraceIOMask("KBD", -1, 0x8)
#traceIocInit
# cd "${TOP}/iocBoot/${IOC}"
iocInit
Starting iocInit
############################################################################
## EPICS R7.0.4.1
## Rev. R7.0.4.1
############################################################################
iocRun: All initialization complete
## Start any sequence programs
#seq sncExample, "user=kaz"
```
## PV list
```
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
IOC:Asyn
KBD101{DDSM100-1}NumEvents
KBD101{DDSM100-1}LastEvent
KBD101{DDSM100-1}SerialNumber
KBD101{DDSM100-1}FirmwareVersionMajor
KBD101{DDSM100-1}FirmwareVersionInterim
KBD101{DDSM100-1}FirmwareVersionMinor
KBD101{DDSM100-1}HardwareVersion
KBD101{DDSM100-1}ModState
KBD101{DDSM100-1}NumberChannels
```

## PV values
```
epics> dbpr KBD101{DDSM100-1}SerialNumber
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}SerialNumber     SEVR: NO_ALARM      
STAT: NO_ALARM      SVAL: 0             TPRO: 0             VAL : 28000335      
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: -21093        SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : -210930       
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: -48222        SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : -482220       
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: -58688        SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : -586880       
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: -63282        SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : -632820       
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: 11705         SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : 117050        
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: 18001         SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : 180010        
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: 39717         SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : 397170        
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: -26996        SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : -269960       
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: -40354        SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : -403540       
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: -11600        SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : -116000       
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: -3786         SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : -37860        
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: 5607          SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : 56070         
epics> dbpr KBD101{DDSM100-1}Ch1:CurrentPosition
ASG :               DESC:               DISA: 0             DISP: 0             
DISV: 1             NAME: KBD101{DDSM100-1}Ch1:CurrentPosition                  
RVAL: -5962         SEVR: NO_ALARM      STAT: NO_ALARM      SVAL: 0             
TPRO: 0             VAL : -59620        
```

## ioc Shell commands
```
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
```
