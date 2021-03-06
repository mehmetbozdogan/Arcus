#!../../bin/linux-x86_64/arcus

## You may have to change arcus to something else
## everywhere it appears in this file

< envPaths
epicsEnvSet("STREAM_PROTOCOL_PATH","${TOP}/protocols")

cd "${TOP}"

## Register all support components
dbLoadDatabase("dbd/arcus.dbd",0,0)
arcus_registerRecordDeviceDriver(pdbbase) 

## Load record instances
dbLoadTemplate "db/template.substitutions"

drvAsynIPPortConfigure ("SYS-SEC-ARCUS", "192.168.1.250:5001")
asynSetTraceMask("SYS-SEC-ARCUS",-1,0x9)
asynSetTraceIOMask("SYS-SEC-ARCUS",-1,0x2)

cd "${TOP}/iocBoot/${IOC}"
iocInit()
startPVAServer
