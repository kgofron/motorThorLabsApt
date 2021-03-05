#!../../bin/linux-x86_64/motorThorLabsApt

#- You may have to change motorThorLabsApt to something else
#- everywhere it appears in this file

< envPaths

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/motorThorLabsApt.dbd"
motorThorLabsApt_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadTemplate "db/user.substitutions"
dbLoadRecords "db/motorThorLabsAptVersion.db", "user=kaz"

#- Set this to see messages from mySub
#var mySubDebug 1

#- Run this to trace the stages of iocInit
#traceIocInit

cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=kaz"
