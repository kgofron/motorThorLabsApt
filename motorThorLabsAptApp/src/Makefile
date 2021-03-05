TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE
#========================================

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET

# Build an IOC support library
LIBRARY_IOC += motorThorLabsAptSupport

# Compile and add code to the support library

# Link locally-provided code into the support library,
# rather than directly into the IOC application, that
# causes problems on Windows DLL builds
motorThorLabsAptSupport_SRCS += devmotorThorLabsAptVersion.c

motorThorLabsAptSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

# Auto-generate a header file containing a version string.
# Version comes from the VCS if available, else date+time.
GENVERSION = motorThorLabsAptVersion.h
# Macro name
GENVERSIONMACRO = motorThorLabsAptVERSION

# Build the IOC application
PROD_IOC = motorThorLabsApt

# motorThorLabsApt.dbd will be created and installed
DBD += motorThorLabsApt.dbd

# motorThorLabsApt.dbd will include these files:
motorThorLabsApt_DBD += base.dbd
motorThorLabsApt_DBD += devmotorThorLabsAptVersion.dbd

# Include dbd files from all support applications:
#ifdef ASYN
motorThorLabsApt_DBD += asyn.dbd
motorThorLabsApt_DBD += drvAsynSerialPort.dbd
motorThorLabsApt_DBD += drvAsynIPPort.dbd
#endif
motorThorLabsApt_DBD += motorSupport.dbd

# Add all the support libraries needed by this IOC
motorThorLabsApt_LIBS += motor
#ifdef ASYN
motorThorLabsApt_LIBS += asyn
#endif
#ifdef SNCSEQ
motorThorLabsApt_LIBS += seq pv
#endif

# motorThorLabsApt_registerRecordDeviceDriver.cpp derives from motorThorLabsApt.dbd
motorThorLabsApt_SRCS += motorThorLabsApt_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
motorThorLabsApt_SRCS_DEFAULT += motorThorLabsAptMain.cpp
motorThorLabsApt_SRCS_vxWorks += -nil-

# Link in the code from our support library
motorThorLabsApt_LIBS += motorThorLabsAptSupport

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    motorThorLabsApt_LIBS += qsrv
    motorThorLabsApt_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    motorThorLabsApt_DBD += PVAServerRegister.dbd
    motorThorLabsApt_DBD += qsrv.dbd
endif

# Finally link IOC to the EPICS Base libraries
motorThorLabsApt_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

# Explicit dependency needed for generated header file
devmotorThorLabsAptVersion$(DEP): $(COMMON_DIR)/$(GENVERSION)
