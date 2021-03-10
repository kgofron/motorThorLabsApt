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

## motorUtil (allstop & alldone)
dbLoadRecords("$(MOTOR)/db/motorUtil.db", "P=thorLabsApt:")

cd "${TOP}/iocBoot/${IOC}"
# Uncomment one of the following lines for KDB101 or another controller
#< thorLabsKDB101.iocsh
< thorLabsKDB101.iocsh

#- Run this to trace the stages of iocInit
#traceIocInit

# cd "${TOP}/iocBoot/${IOC}"
iocInit

## Start any sequence programs
#seq sncExample, "user=kaz"
