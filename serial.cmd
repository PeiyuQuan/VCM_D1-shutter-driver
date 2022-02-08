epicsEnvSet ("STREAM_PROTOCOL_PATH", "$(IP)/db")

################################################################################
# AJA power supply setup

#drvAsynSerialPortConfigure("portName","ttyName",priority,noAutoConnect,noProcessEosIn)
#asynSetOption("portName",addr,"Key","value")

#drvAsynSerialPortConfigure("serial1", "192.168.0.10:4001<http://192.168.0.10:4001/> COM", 0, 0, 0)
drvAsynSerialPortConfigure("serial1", "/dev/ttyUSB0", 0, 0, 0)
asynSetOption("serial1",0,"baud","9600")
asynSetOption("serial1",0,"bits","8")
asynSetOption("serial1",0,"stop","1")
asynSetOption("serial1",0,"parity","none")
asynSetOption("serial1",0,"clocal","N")
asynSetOption("serial1",0,"crtscts","N")
#asynSetTraceIOMask("serial1",0, ESCAPE|HEX)
#asynSetTraceMask("serial1", 0, ERROR|DRIVER|FLOW)

# Load asyn records on all serial ports
dbLoadTemplate("asynRecord.template")
dbLoadRecords("$(IP)/db/VCMD1.db","P=$(PREFIX),PORT=serial1")
