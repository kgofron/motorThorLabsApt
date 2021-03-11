#!../../bin/linux-x86_64/motorThorLabsApt

#- You may have to change motorThorLabsApt to something else
#- everywhere it appears in this file

< envPaths

epicsEnvSet("ENGINEER",  "kgofron x5283")
epicsEnvSet("LOCATION", "XF11BM{RG:B1}")

epicsEnvSet("Sys",         "KBD101")
epicsEnvSet("Dev",         "{DDSM100-1}")
epicsEnvSet("C_Sys",         "XF:11BM-CT")
epicsEnvSet("ETH_PORT",    "IP1")

#epicsEnvSet("EPICS_CA_AUTO_ADDR_LIST", "NO")
#epicsEnvSet("EPICS_CA_ADDR_LIST", "10.10.0.255")

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/motorThorLabsApt.dbd"
motorThorLabsApt_registerRecordDeviceDriver pdbbase

## Load record instances
dbLoadTemplate "db/user.substitutions"
dbLoadRecords "db/motorThorLabsAptVersion.db", "user=$(Sys)$(Dev)"

## motorUtil (allstop & alldone)
dbLoadRecords("$(MOTOR)/db/motorUtil.db", "P=$(Sys)$(Dev)")

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
