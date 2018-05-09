import subprocess
import sys,string,os
import random
from time import sleep
from colorconsole import terminal


#Versions
FW_TDEBT_VERSION="1.0.45";
FW_TVHUB_VERSION="v.1.0.163"
FW_TABLEHUB_VERSION="v.1.0.72"
FW_BLE_VERSION="1.0.11"

#PATHS
TDETOOLPATH="\\tools\tdebt.exe";
DATETIME_SER="\\172.17.159.36\Sharing\Bolide\date.inf";
#BT server APP will write Internet "Date" on PM 24:00 
#Everyday into one .ini file (the file name will be fixed in "date.ini")
#read "Date" from server ini during initial stage and compare with 
#local PC time for correction or not.
#will create ini file if not exist which would be 
#occurred when P_line changed testing PC or setup new line.
#load server path " \\172.17.159.36\Sharing\Bolide" from .TXT file
#we can manually change path to local to resume P_line build once server shut down accidentally.

#UID
UID_FORMAT="PID:YYYYmmdd:<macaddress>";
SIM_UID="{0x0889:20180508:001122334455}";

#Flags
m_DeviceCheckCount=10;     #The number of times that will be checked before returning printer failure mode. 
m_UID_Present=False;       #Track the UID flag being present. 
m_Printer_Present=False;   #Track the printer present.
m_DeviceDUT_present=False; #Track the device DUT.
m_UID_DUT_Readback="NULL"; #Macaddress read back value.

#Error Codes
ERROR_PRINTER_DUT_FAILURE=0x01;                #attempted to print again up too N times but still failed. 
ERROR_READ_UID_TABLE=0x02;                     #return string UID validity check. failed if the validity check failed. 
ERROR_DATE_UID_LOCALTIME_OR_BADSTR=0x03        #the local time does not match as expected.
ERROR_PERIODIC_VISUAL_INSPECTION_FAULURE=0x04; #if the date is not a match with local date  
                                               #then the station will fail dut.
                                               #otherwise continue.
ERROR_GENERAL_PRINTER_FAILURE=0x05;            #general printer failure.
ERROR_INSTRUCTION_PHYSICAL_PLACEMENT=0x06;     # physical instruction placement error.
ERROR_VISUAL_CHECK_FAILED=0x07                 #visual check issue.
ERROR_BARCODE_SCANNER_FAILURE=0x08;            #scanned bar code error or failure.
ERROR_LABEL_PLACEMENT_READ_BACK_FAILED=0x09;   #Label placement read back error. 





#Table Hub APIs
#SetTableHubSecurityIC/UIDControl()
def SetTableHubSecurityIC_UIDControl():
    return

#SetTableHubOPT_SecuirtyIC
#sets the security ID chip applied OPT permanent function.
def SetTableHubOPT_SecuirtyIC():
    success=False;
    return success;

#GetTableHubSecurityUID()
def GetTableHubSecurityUID():
    success=False;
    return success;	

#SetTableHubOPT_SecuirtyIC()
def SetTableHubOPT_SecuirtyIC():
    success=False;
    return success;
	
#generate UID
def SetgenUID():
    print("Apply OTP security setting");
    success=False;
    return success;

#tableHub_USB status
def GetUSBTableHub_Status():
    success=False;
	#-g tablehub_usbhub_status
	#-g tablehub_chrontel_status-
	#-s tde_unique_id
    return success
	
#get usb pid vid directly	
def GetUSBPIDVID():
    success=False;
	#-g btusbpidvid
    return success
	
	
#apply table hub reset function.
def ApplyTableHub_Reset():
    success=False;
    #tablehub_reset(Set/Get)
    return success	
	
	
#check the tdebt version.
def CheckTDEBT_version():
    success=False;
	#FW_TDEBT_VERSION="1.0.45";
	#will check the tdebt tool version. 
    return success
	
#Check the tvHub version	
def CheckTVHub_Version():
    success=False;
    #FW_TVHUB_VERSION="v.1.0.163"
    #will check the tablehub version.
    return success

#Check the table hub version
def CheckTableHub_version():
    success=False;
    FW_TABLEHUB_VERSION="v.1.0.72"
    FW_BLE_VERSION="1.0.11"
    return success
	
#ProgramEthernetMacaddress
def ProgramEthernetMacaddress():
    success=False;
	#send print command.
	
	#SetEthernetMacaddress
	success=SetEthernetMacaddress(ScannedMacaddress);
	
	#GetEthernetMacaddress
	GetEthernetMacaddress();
	
    return success;


#Get Ethernet Macaddress.
def GetEthernetMacaddress():
    ethernetmac="NA";
	#2. Get tablehub mac address:
	#tdebt.exe -c tablehub -g tablehub_eth_mac
    return ethernetmac 

	
#set Ethernet Macaddress 
def SetEthernetMacaddress():
    ethernetmac="NA";
	#1. Set tablehub mac address:
	#tdebt.exe -c tablehub -s tablehub_eth_mac 088500018045
    return ethernetmac 	
	
	
def SetDeviceLabel():
	#3. Set tablehub device label: (need to provide the mac address)
	#tdebt.exe -c tablehub -s tablehub_device_label 088500018045
	#4. Get tablehub device label: (Returns this format , PID:YYYYMMDD:MAC ADDR)
    #tdebt.exe -c tablehub -g tablehub_device_label
    return


#///
	
#Set UID Setting.	
def SetUID():
    print("setUID setting")
	UID_Success=False;
    return UID_Success

	
#Get UID Setting.	
def GetUID():
    print("get uid security IC setting")
	UID_Success=False;
    return UID_Success
	
	
#Check UID for errors.
def UIDValidityCheck(m_UID_DUT_Readback):
    print("UID Check");
	bool UIDCheck=False;
    return UIDCheck	

def logActivity():
#log activities for trouble shooting.
return
	
#Check the printer access.	
def CheckPrinterAccess():
    print("check printer access");
	bool checkPrinter=False;
    return checkPrinter
	
	
#Check the device access.	
def CheckDeviceAccess():
    print("check device access");
	bool checkDevice=False;
    return checkDevice



def ApplyTableHubStation_Test():

	#check printer access
	#check device access 
	#read UID read the macaddress(for safety)
	#is the status OK ?
	#
	#1.The printer is checked for connectivity
	# if the printer is not connected the station will should fail. 
	#2.
	#The test will retry connectivity with the printer and the device up too N time defined in the test. 
	#The test also checks for the bar-code scanner to be present.

	#3. 
	#The device is then checked for connectivity by reading out the PIDVID and Macaddress. 
	#If after multiple retries the devices are not detected then the test will fail with error code (0x01).

	#4. then the mac is applied. 
	#if the date is not a match with local date then the station will fail the dut otherwise continue.

    EXITCODE=0x00
	success=False;
	
    for i in range(m_DeviceCheckCount):
     m_Printer_Present=CheckPrinterAccess();
     m_DeviceDUT_present=CheckDeviceAccess();
      if ((m_Printer_Present!=True)&&(m_DeviceDUT_present!=True)):
	    EXITCODE=ERROR_PRINTER_DUT_FAILURE
		else:
		m_UID_DUT_Readback=GetTableHubSecurityUID();
		if (m_UID_DUT_Readback!="NA"):
		  print("UID:["+m_UID_DUT_Readback+"]");
		  SetTableHubOPT_SecuirtyIC();
		else:
		  print("UID:["+m_UID_DUT_Readback+"]");
		   UIDValidityCheck=UIDValidityCheck(m_UID_DUT_Readback);
		   if(UIDValidityCheck!=True): #checks date 
             EXITCODE=ERROR_READ_UID_TABLE;
			 m_UID_Present=True;
			else:
			 m_UID_Present=False;
			 EXITCODE=ERROR_DATE_UID_LOCALTIME;
			 
	#if not the right UID as the one printed then fail.
	#return Macaddress validity check.

    #send UID string to the printer continue.
	#operator instruction to perform physical placement.
	#
	ScannedMacaddress=GetScannedBarcode();
	ProgramEthernetMacaddress();
	
    #periodically check the date visually check.
	timecheck=DisplayTimeCheck();
    if (timecheck==False):
      EXITCODE=ERROR_VISUAL_CHECK_FAILED;
    else:
      #visual check is good continue.	
	  #scan 2d bar-code reverify after label applied.
	  
      #if not the right UID as the one printers than FAIL.
      Display_Scan_2DBarcode_UIDLabel();

	  #return string Macaddress validity check.
	   UIDValidityCheck=UIDValidityCheck(m_UID_DUT_Readback);
	   print(UIDValidityCheck)
	   
    return EXITCODE
	


EXITCODE=ApplyTableHubStation_Test();
sys.exit(EXITCODE);




