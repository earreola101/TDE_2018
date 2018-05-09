import subprocess
import sys,string,os
import random
from time import sleep
from colorconsole import terminal

TSI_HDMI_RX_TIMEOUT=5000            #0x10200 5000 Electrical test timeout, (ms).
TSI_HDMI_RX_POWER_LOW_LIMIT=4700    #0x10201 4700 HDMI power-supply low limit, (mV).
TSI_HDMI_RX_POWER_HIGH_LIMIT=5300   #0x10202 5300 HDMI power-supply high limit, (mV).
TSI_HDMI_RX_LINK_LOW_LIMIT=2900     #0x10203 2900 HDMI Link voltage low limit, (mV).
TSI_HDMI_RX_LINK_HIGH_LIMIT=3100    #0x10204 3100 HDMI Link voltage high limit, (mV).
TSI_HDMI_RX_HPD_ZERO_LOW_LIMIT=0    #0x10205 0 HDMI HPD logical zero voltage level low limit, (mV).
TSI_HDMI_RX_HPD_ZERO_HIGH_LIMIT=400 #0x10206 400 HDMI HPD logical zero voltage level high limit, (mV).
TSI_HDMI_RX_HPD_ONE_LOW_LIMIT=2400  #0x10207 2400 HDMI HPD logical one voltage level low limit, (mV).
TSI_HDMI_RX_HPD_ONE_HIGHT_LIMIT=5300#0x10208 5300 HDMI HPD logical one voltage level high limit, (mV).
TSI_HDMI_RX_DDC_LOW_LIMIT=4500      #0x10209 4500 HDMI DDC voltage level low limit, (mV).
TSI_HDMI_RX_DDC_HIGH_LIMIT=5500     #0x1020a 5500 HDMI DDC voltage level high limit,(mV).
TSI_HDMI_RX_CEC_ZERO_LOW_LIMIT=0    #0x1020b 0 HDMI CEC Logical zero low voltage limit,(mV).
TSI_HDMI_RX_CEC_ZERO_HIGH_LIMIT=600 #0x1020c 600 HDMI CEC logical zero hight voltage limit, (mV).
TSI_HDMI_RX_CEC_ONE_LOW_LIMIT=2500  #0x1020d 2500 HDMI CEC logical one low voltage limit,(mV).
TSI_HDMI_RX_CEC_ONE_HIGH_LIMI=3600  #0x1020e 3600 HDMI CEC logical one high voltage limit,(mV).

TSI_R_HDMI_INFOFRAME_NULL=0x11000   #0x11000 0 READ ONLY. NULL infoframe.
TSI_R_HDMI_INFOFRAME_ACR=0x11001    #0x11001 1 READ ONLY. Audio Clock Regeneration.
TSI_R_HDMI_INFOFRAME_ASP=0x11002    #0x11002 2 READ ONLY. Audio Sample Packet
TSI_R_HDMI_INFOFRAME_GCP=0x11003    #0x11003 3 READ ONLY. General Control Packet
TSI_R_HDMI_INFOFRAME_ACP=0x11004    #0x11004 4 READ ONLY. Audio Content Protection packet
TSI_R_HDMI_INFOFRAME_ISRC1=0x11005  #0x11005 5 READ ONLY. International Standard Recording Code
TSI_R_HDMI_INFOFRAME_ISRC2=0x11006  #0x11006 6 READ ONLY. International Standard Recording Code
TSI_R_HDMI_INFOFRAME_OBA=0x11007    #0x11007 7 READ ONLY. One Bit Audio sample packet
TSI_R_HDMI_INFOFRAME_DTS=0x11008    #0x11008 8 READ ONLY. DTS audio packet
TSI_R_HDMI_INFOFRAME_HBR=0x11009    #0x11009 9 READ ONLY. High BitRate audio stream packet
TSI_R_HDMI_INFOFRAME_GMP=0x1100a    #0x1100a 10 READ ONLY. Gamut Metadata Packet
TSI_R_HDMI_INFOFRAME_VSI=0x11081    #0x11081 129 READ ONLY. Vendor Specific Infoframe
TSI_R_HDMI_INFOFRAME_AVI=0x11082    #0x11082 130 READ ONLY. Auxiliary Video Information infoframe
TSI_R_HDMI_INFOFRAME_SPD=0x11083    #0x11083 131 READ ONLY. Source Product Descriptor infoframe
TSI_R_HDMI_INFOFRAME_AIF=0x11084    #0x11084 132 READ ONLY. Audio Infoframe
TSI_R_HDMI_INFOFRAME_MPEG=0x11085   #0x11085 133 READ ONLY. MPEG Source infoframe
TSI_R_HDMI_INFOFRAME_3D_ASP=0x1100b #0x1100b 11 READ ONLY. 3D Audio Sample Packet
TSI_R_HDMI_INFOFRAME_3D_OBA=0x1100c #0x1100c 12 READ ONLY. 3D One Bit Audio sample packet
TSI_R_HDMI_INFOFRAME_AMP=0x1100d    #0x1100d 13 READ ONLY. Audio Metadata Packet
TSI_R_HDMI_INFOFRAME_MST_ASP=0x1100e#0x1100e 14 READ ONLY. Multi-stream Audio Sample Packet
TSI_R_HDMI_INFOFRAME_MST_OBA=0x1100f#0x1100f 15 READ ONLY. Multi-stream One Bit Audio sample packet
TSI_R_HDMI_INFOFRAME_DRM=0x11087    #0x11087 135 READ ONLY. Dynamic Range and Mastering infoframe

TSI_R_GENERIC_STATUS=0x210          #N/A Report generic device status as status bits. 5.13.1
TSI_R_UNITS_PRESENT=0x211           #N/A Number of units chained. 5.13.2
TSI_W_FORCE_HOT_PLUG_STATE=0x212    #N/A Controls HPD state: 0 = low, 1 = High. 5.13.3
TSI_EDID_TE_INPUT=0x1100            #(TSI_CURRENT_SINK_EDID) 0x1100 N/A Access TE side EDID. 5.13.4
TSI_EDID_TE_OUTPUT=0x1101           #N/A Access DUT side EDID over signal cable. 5.13.5
TSI_VERSION_TEXT=0x80000001         #N/A TSI Version information as text. 5.13.6
TSI_LOG_FILE=0x80000002             #N/A Log file-name for recording logs easily. 5.13.7
TSI_INVALID_CONFIG_ITEM=0xffffffff  #N/A Reserved for invalid CI indication. Do not use. N/A
TSI_HPD_LENGTH=0x1201               #1000 HPD Pulse length for TSI generated pulses. 5.13.8
TSI_W_ARC_CONTROL=0x1210            #0 Audio Return Channel control. 5.13.9

PASS_STATE=True
FAIL_STATE=False
FAILMESSAGE="TEST FAILED"
PASSMESSAGE="TEST PASSED"
FAILURE=1
SUCCESS=0
ERROR_CODE_NO_DEVICE="*** Error -10: A device index is out of range"
ERROR_CODE_ASYNC_TIMEOUT="*** Error -31: An asynchronous operation has timed out."
ERROR_CODE_UNSUPPORTED_ID=" Unknown or unsupported configuration ID. Done. "

HDMI_TX_OUTPUT="./tool/StartStream.exe 6 0 output 28 0"
#HDMI TX output 4k2k@30 timing and color bar pattern:

HDMI_FTCMD="./tool/HDMILineTest.exe";
DataFilePath='./HDMIData.csv';
outTestDataFile="./inout/HDMI_VoltageTest.out";
inTestDataFile="./inout/HDMI_VoltageTest.in";

ID_TEST_HDMI_SOURCE_POWERLINE_TEST=1   #     1 = HDMI Source power line test.
ID_TEST_HDMI_SOURCE_HPDLINE_TEST=2     #     2 = HDMI Source HPD line test.
ID_TEST_HDMI_DDC_AND_CEC_LINE_TEST=3   #     3 = HDMI DDC and CEC lines test.
ID_TEST_HDMI_TMDS_LINE_TEST=4          #     4 = HDMI TMDS line test
ID_TEST_HDMI_DP_MAIN_LINK_LINES_TEST=5 #     5 = DP Main link lines test
ID_TEST_HDMI_DP_AUX_LINES_TEST=6       #     6 = DP AUX Lines test
ID_TEST_HDMI_DP_HPD_LINE_TEST=7        #     7 = DP HPD line test


D01_DP_LINKS_LOW_VOLTAGE_mV=0             #     -D01 = DP LINKS LOW VOLTAGE (mV)
D02_DP_LINKS_HI_VOLTAGE_mV=0              #     -D02 = DP LINKS_HI_VOLTAGE (mV)
D03_DP_HPD_ZERO_LOW_VOLTAGE_mV=0          #     -D03 = DP HPD ZERO LOW VOLTAGE (mV)
D04_DP_HPD_ZERO_HI_VOLTAGE_mV=0           #     -D04 = DP HPD ZERO HI VOLTAGE (mV)
D05_DP_HPD_ONE_LOW_VOLTAGE_mV=0           #     -D05 = DP HPD ONE LOW VOLTAGE (mV)
D06_DP_HPD_ONE_HI_VOLTAGE_mV=0            #     -D06 = DP HPD ONE HI VOLTAGE (mV)
D07_DP_AUX_P_IDLE_LOW_VOLTAGE_mV=0        #     -D07 = DP AUX P IDLE LOW VOLTAGE (mV)
D08_DP_AUX_P_IDLE_HI_VOLTAGE_mV=0         #     -D08 = DP AUX P IDLE HI VOLTAGE (mV)
D09_DP_AUX_N_IDLE_LOW_VOLTAGE_mV=0        #     -D09 = DP AUX N IDLE LOW VOLTAGE (mV)
D10_DP_AUX_N_IDLE_HI_VOLTAGE_mV=0         #     -D10 = DP AUX N IDLE HI VOLTAGE (mV)
D11_DP_AUX_P_TRIG_VOLTAGE_mV=0            #     -D11 = DP AUX P TRIG VOLTAGE (mV)
D12_DP_AUX_N_TRIG_VOLTAGE_mV=0            #     -D12 = DP AUX N TRIG VOLTAGE (mV)
D13_DP_AUX_SIGNAL_CAPT_TIMEOUT_ms=0       #     -D13 = DP AUX SIGNAL CAPT TIMEOUT (ms)
D14_DP_AUX_SIGNAL_CAPT_TRIES_Num=0        #     -D14 = DP AUX SIGNAL CAPT TRIES (Num.)
D15_DP_MAX_DUT_MAX_LANES_1_4=0            #     -D15 = DP MAX DUT MAX LANES (1 - 4)
D16_DP_MAX_DUT_LANE_RATE_Value_0_27Gbps=0 #     -D16 = DP MAX DUT LANE RATE (Value*0.27Gbps)


#TEST LIMITS
CLKp_Val1HighLimit=0 
CLKp_Val2LowLimit=0
CLKn_Val1HighLimit=0 
CLKn_Val2LowLimit=0
                           
H01_HDMI_POWER_LOW_LIMIT_mV=4700          #     -H01 = HDMI POWER LOW LIMIT (mV)
H02_HDMI_POWER_HIGH_LIMIT_mV=5300         #     -H02 = HDMI POWER HIGH LIMIT (mV)

H03_HDMI_LINK_LOW_LIMIT_mV=2900           #     -H03 = HDMI LINK LOW LIMIT (mV)
H04_HDMI_LINK_HIGH_LIMIT_mV=3100          #     -H04 = HDMI LINK HIGH LIMIT (mV)

H05_HDMI_HPD_ZERO_LOW_LIMIT_mV=0          #     -H05 = HDMI HPD ZERO LOW LIMIT (mV)
H06_HDMI_HPD_ZERO_HIGH_LIMIT_mV=400       #     -H06 = HDMI HPD ZERO HIGH LIMIT (mV)

H07_HDMI_HPD_ONE_LOW_LIMIT_mV=2400        #     -H07 = HDMI HPD ONE LOW LIMIT (mV)
H08_HDMI_HPD_ONE_HIGHT_LIMIT_mV=5300      #     -H08 = HDMI HPD ONE HIGHT LIMIT (mV)

H09_HDMI_DDC_LOW_LIMIT_mV=4500            #     -H09 = HDMI DDC LOW LIMIT (mV)
H10_HDMI_DDC_HIGH_LIMIT_mV=5500           #     -H10 = HDMI DDC HIGH LIMIT (mV)

H11_HDMI_CEC_ZERO_LOW_LIMIT_mV=0          #     -H11 = HDMI CEC ZERO LOW LIMIT (mV)
H12_HDMI_CEC_ZERO_HIGH_LIMIT_mV=600       #     -H12 = HDMI CEC ZERO HIGH LIMIT (mV)

H13_HDMI_CEC_ONE_LOW_LIMIT_mV=2500        #     -H13 = HDMI CEC ONE LOW LIMIT (mV)
H14_HDMI_CEC_ONE_HIGH_LIMIT_mV=3600       #     -H14 = HDMI CEC ONE HIGH LIMIT (mV)

#TargetLimits
CLK_Val1_TARGET_Limit=0;
CLK_Val2_TARGET_Limit=0;HDMI_FTCMD
CLKp_Val1_TARGET_Limit=0;
CLKp_Val2_TARGET_Limit=0;
CLKn_Val1_TARGET_Limit=0;
CLKn_Val2_TARGET_Limit=0;

H02_HDMI_POWER_TARGET_LIMIT_mV=0;
H04_HDMI_LINK_TARGET_LIMIT_mV=0;
H06_HDMI_HPD_ZERO_TARGET_LIMIT_mV=0;
H08_HDMI_HPD_ONE_TARGET_LIMIT_mV=0;
H10_HDMI_DDC_TARGET_LIMIT_mV=0;
H12_HDMI_CEC_ZERO_TARGET_LIMIT_mV=0;
H14_HDMI_CEC_ONE_TARGET_LIMIT_mV=0;

#Error Codes
MEASURE_HDMI_RX_CLK_KEYSTR="Measure HDMI RX CLK lane voltage levels"
MEASURE_HDMI_RX_D0_KEYSTR="Measure HDMI RX D0 lane voltage levels"
MEASURE_HDMI_RX_D1_KEYSTR="Measure HDMI RX D1 lane voltage levels"
MEASURE_HDMI_RX_D2_KEYSTR="Measure HDMI RX D2 lane voltage levels"
OutTestStatus_KEYSTR="FAIL"
StartTestTMDS_Test_INDEX=74
COLOR_RED=12
COLOR_LIME=10
Measure_HDMI_RX_CLK_INDEX=78
Measure_HDMI_RX_D0_INDEX=92
Measure_HDMI_RX_D1_INDEX=106
Measure_HDMI_RX_D2_INDEX=120
OutTestStatus_INDEX=134
OutTestConfirm_INDEX=143


def cleanStr(strmm):
    msgcleaned=strmm.replace(' ',"").replace("isoutofrange","").replace("V","");
    msgcleaned=msgcleaned.strip('\n');
    return 
    
def screenMsg(message,color):
    screen.cprint(color, 0,message);
    screen.reset_colors();
    return True

def scanforErrors(inscreen):

    if(inscreen.find("Error")):
          screenMsg("errors detected\n",COLOR_RED);
          print(inscreen);
          
    outputs=inscreen.split(' ');
    for i in range(len(outputs)):
        if(outputs[i]=="Error"):
           screenMsg("["+outputs[i]+"]\r\n",COLOR_RED);

           return True;           
        else:
           return False;

    
    return False;

def processOutData(SN,stat,CLK_Val1,CLK_Val2,D0_Val1,D0_Val2,D1_Val1,D1_Val2,D2_Val1,D2_Val2):
    status=1
    testName="HDMI_VoltageLineTest"
    valuesd="Values="+str(CLK_Val1)+","+str(CLK_Val2)+","+str(D0_Val1)+","+str(D0_Val2)+","+str(D1_Val1)+","+str(D1_Val2)+","+str(D2_Val1)+","+str(D2_Val2);
    valuesd=valuesd.strip('\n');

    if(stat==True):
        status=0
        msg="OK!"
    else:
        status=1             
        msg="FAILED!"

        
    print("Test message:"+msg);
    print("Open file:"+outTestDataFile);
    
    f = open(outTestDataFile,'a');
    print("Open"+str(f));
    
    f.write("[Outputs]\n");
    f.write("Status="+str(status)+"\n");
    f.write("ReturnCode="+str(status)+"\n");
    f.write("Message="+msg+"\n");
    f.write("Headers="+testName+"\n");
    f.write(valuesd+"\n");
    
    f.write("LowLimit="+str(CLKp_Val1HighLimit)+","+str(CLKn_Val1HighLimit)+","+
                        str(H01_HDMI_POWER_LOW_LIMIT_mV)+","+
                        str(H03_HDMI_LINK_LOW_LIMIT_mV)+","+
                        str(H05_HDMI_HPD_ZERO_LOW_LIMIT_mV)+","+
                        str(H07_HDMI_HPD_ONE_LOW_LIMIT_mV)+","+
                        str(H09_HDMI_DDC_LOW_LIMIT_mV)+","+
                        str(H11_HDMI_CEC_ZERO_LOW_LIMIT_mV)+","+
                        str(H13_HDMI_CEC_ONE_LOW_LIMIT_mV)+"\n");

    f.write("UpLimit="+str(CLKp_Val2LowLimit)+","+str(CLKn_Val1HighLimit)+","+
                       str(H02_HDMI_POWER_HIGH_LIMIT_mV)+","+
                       str(H04_HDMI_LINK_HIGH_LIMIT_mV)+","+
                       str(H06_HDMI_HPD_ZERO_HIGH_LIMIT_mV)+","+
                       str(H08_HDMI_HPD_ONE_HIGHT_LIMIT_mV)+","+
                       str(H10_HDMI_DDC_HIGH_LIMIT_mV)+","+
                       str(H12_HDMI_CEC_ZERO_HIGH_LIMIT_mV)+","+
                       str(H14_HDMI_CEC_ONE_HIGH_LIMIT_mV)+"\n");

    f.write("TargetLimit="+str(CLKp_Val1_TARGET_Limit)+","+
                           str(CLKp_Val2_TARGET_Limit)+","+
                           str(CLKn_Val1_TARGET_Limit)+","+
                           str(CLKn_Val2_TARGET_Limit)+","+
                           str(H02_HDMI_POWER_TARGET_LIMIT_mV)+","+
                           str(H04_HDMI_LINK_TARGET_LIMIT_mV)+","+
                           str(H06_HDMI_HPD_ZERO_TARGET_LIMIT_mV)+","+
                           str(H08_HDMI_HPD_ONE_TARGET_LIMIT_mV)+","+
                           str(H10_HDMI_DDC_TARGET_LIMIT_mV)+","+
                           str(H12_HDMI_CEC_ZERO_TARGET_LIMIT_mV)+
                           str(H14_HDMI_CEC_ONE_TARGET_LIMIT_mV)+"\n");

    f.write("VarResultSummary="+msg+"\n");
    
    f.close();
    
    print("save outputs results done\n");
    saveLogData(SN,stat,CLK_Val1,CLK_Val2,D0_Val1,D0_Val2,D1_Val1,D1_Val2,D2_Val1,D2_Val2);
     
    return


def saveLogData(SN,TestStatus,CLK_Val1,CLK_Val2,D0_Val1,D0_Val2,D1_Val1,D1_Val2,D2_Val1,D2_Val2):
    print("saving data!");
    msg="PASSED"

    if(TestStatus==True):
        msg="PASSED"
    else:            
        msg="FAILED"

    header="SN,TestStatus,CLK+,CLK-,D0+,D0-,D1+,D1-,D2+,D2-";
    foutput=SN+","+msg+","+str(CLK_Val1)+","+str(CLK_Val2)+","+str(D0_Val1)+","+str(D0_Val2)+","+str(D1_Val1)+","+str(D1_Val2)+","+str(D2_Val1)+","+str(D2_Val2);
    foutput=foutput.strip('\n')
    outmDataFile=foutput;
    print("Log:"+outmDataFile);
    
    if(os.path.isfile(DataFilePath)):
        f = open(DataFilePath,'a');
        f.write(foutput+"\n");
        f.close()
    else:
        f = open(DataFilePath,'a');
        f.write(header+"\n");
        f.write(foutput+"\n");
        f.close();

    print("results processed done");

    return


def processOutput(SN,output):
    SN="0"
    TestStatus="FAIL"
    stat=False
    CLK_Val1="0"
    CLK_Val2="0"
    
    D0_Val1="0"
    D0_Val2="0"

    D1_Val1="0"
    D1_Val2="0"

    D2_Val1="0"
    D2_Val2="0"
    errorDetection=scanforErrors(output);
    outputs=output.split(':');
    #print(outputs);
    for i in range(len(outputs)):
      if(i==Measure_HDMI_RX_CLK_INDEX):
         if(outputs[i].find(MEASURE_HDMI_RX_CLK_KEYSTR)):
             var1=outputs[83].replace('\r\n',' ').split("[");
             var2=outputs[88].replace('\r\n',' ').split("[");
             CLK_Val1=var1[0].replace(' ',"").replace("isoutofrange","").replace("V","");
             CLK_Val2=var2[0].replace(' ',"").replace("isoutofrange","").replace("V","")
             print("CLK+"+CLK_Val1);
             print("CLK-"+CLK_Val2);
         else:
             print("NOT FOUND!")
             print("CLK+"+D1_Val1);
             print("CLK-"+D1_Val2);
             
      if(i==Measure_HDMI_RX_D0_INDEX):
         if(outputs[i].find(MEASURE_HDMI_RX_D0_KEYSTR)):
             var1=outputs[97].replace('\r\n',' ').split("[");
             var2=outputs[102].replace('\r\n',' ').split("[");
             D0_Val1=var1[0].replace(' ',"").replace("isoutofrange","").replace("V","");
             D0_Val2=var2[0].replace(' ',"").replace("isoutofrange","").replace("V","");
             print("D0+"+D0_Val1);
             print("D0-"+D0_Val2);
         else:
             print("NOT FOUND!")
             print("D0+"+D1_Val1);
             print("D0-"+D1_Val2);
             
      if(i==Measure_HDMI_RX_D1_INDEX):
         if(outputs[i].find(MEASURE_HDMI_RX_D1_KEYSTR)):
             var1=outputs[111].replace('\r\n',' ').split("[");
             var2=outputs[116].replace('\r\n',' ').split("[");
             D1_Val1=var1[0].replace(' ',"").replace("isoutofrange","").replace("V","");
             D1_Val2=var2[0].replace(' ',"").replace("isoutofrange","").replace("V","");
             print("D1+"+D1_Val1);
             print("D1-"+D1_Val2);processOutData
         else:
             print("NOT FOUND!")
             print("D1+"+D1_Val1);
             print("D1-"+D1_Val2);

      if(i==Measure_HDMI_RX_D2_INDEX):
         if(outputs[i].find(MEASURE_HDMI_RX_D2_KEYSTR)):
             var1=outputs[125].replace('\r\n',' ').split("[");
             var2=outputs[130].replace('\r\n',' ').split("[");
             D2_Val1=var1[0].replace(' ',"").replace("isoutofrange","").replace("V","");
             D2_Val2saveLogData=var2[0].replace(' ',"").replace("isoutofrange","").replace("V","");
             print("D2+"+D2_Val1);
             print("D2-"+D2_Val2);
         else:
             print("NOT FOUND!")
             print("D2+"+D2_Val1);
             print("D2-"+D2_Val2);
             
      if(i==OutTestStatus_INDEX):
          testoutstr=outputs[i].replace('\r\n',' ');
          print("[[[["+testoutstr+"]]]]");
          if(testoutstr==" Test PASSED"):
              stat=True
              #screenMsg("++++PASS[[[["+testoutstr+"]]]] \n",COLOR_LIME);
          else:
              stat=False
              #screenMsg("----FAIL[[[["+testoutstr+"]]]] \n",COLOR_RED);



    processOutData(SN,stat,CLK_Val1,CLK_Val2,D0_Val1,D0_Val2,D1_Val1,D1_Val2,D2_Val1,D2_Val2);
    print("save results!!!!!");
    return stat;



def asmLimits(H01_HDMI_POWER_LOW_LIMIT_mV,
            H02_HDMI_POWER_HIGH_LIMIT_mV,
            H03_HDMI_LINK_LOW_LIMIT_mV,
            H04_HDMI_LINK_HIGH_LIMIT_mV,
           H05_HDMI_HPD_ZERO_LOW_LIMIT_mV,
            H06_HDMI_HPD_ZERO_HIGH_LIMIT_mV,
            H07_HDMI_HPD_ONE_LOW_LIMIT_mV,
            H08_HDMI_HPD_ONE_HIGHT_LIMIT_mV,
            H09_HDMI_DDC_LOW_LIMIT_mV,
            H10_HDMI_DDC_HIGH_LIMIT_mV,
            H11_HDMI_CEC_ZERO_LOW_LIMIT_mV,
            H12_HDMI_SUCCESSCEC_ZERO_HIGH_LIMIT_mV,
            H13_HDMI_CEC_ONE_LOW_LIMIT_mV,
            H14_HDMI_CEC_ONE_HIGH_LIMIT_mV):

    return("-H01 "+str(H01_HDMI_POWER_LOW_LIMIT_mV)+
           " -H02 "+str(H02_HDMI_POWER_HIGH_LIMIT_mV)+
           " -H03 "+str(H03_HDMI_LINK_LOW_LIMIT_mV)+
           " -H04 "+str(H04_HDMI_LINK_HIGH_LIMIT_mV)+
           " -H05 "+str(H05_HDMI_HPD_ZERO_LOW_LIMIT_mV)+
           " -H06 "+str(H06_HDMI_HPD_ZERO_HIGH_LIMIT_mV)+
           " -H07 "+str(H07_HDMI_HPD_ONE_LOW_LIMIT_mV)+
           " -H08 "+str(H08_HDMI_HPD_ONE_HIGHT_LIMIT_mV)+
           " -H09 "+str(H09_HDMI_DDC_LOW_LIMIT_mV)+
           " -H10 "+str(H10_HDMI_DDC_HIGH_LIMIT_mV)+
           " -H11 "+str(H11_HDMI_CEC_ZERO_LOW_LIMIT_mV)+
           " -H12 "+str(H12_HDMI_CEC_ZERO_HIGH_LIMIT_mV)+
           " -H13 "+str(H13_HDMI_CEC_ONE_LOW_LIMIT_mV)+
           " -H14 "+str(H14_HDMI_CEC_ONE_HIGH_LIMIT_mV))

def CheckErrorCode(errorcode):
    
    if errorcode.find(ERROR_CODE_NO_DEVICE) == -1:
     return SUCCESS
    else:
     print(errorcode) 
     return FAILURE
    
    if errorcode.find(ERROR_CODE_ASYNC_TIMEOUT) == -1:
     return SUCCESS
    else:
     print(errorcode) 
     return FAILURE
    
def FinalStatus(status):
    if status==False:
     screenMsg("-["+FAILMESSAGE+"]-\n",COLOR_RED);
     return FAILURE;
    else:
     screenMsg("-["+PASSMESSAGE+"]-\n",COLOR_LIME);
     return SUCCESS;

def runCmdx(cmd):
    cmdStr=HDMI_FTCMD+cmd
    resultscmd=subprocess.check_output(cmdStr,stderr=subprocess.STDOUT)
    print("OUTPUT: "+resultscmd+"\r\n")
    return resultscmd

def runCmd(cmd):
    cmdStr=HDMI_FTCMD+cmd
    resultscmd=subprocess.check_output(cmdStr,stderr=subprocess.STDOUT)
    #print("OUTPUT: "+resultscmd+"\r\n")
    return resultscmd

def Run_HDMI_PowerLine_TEST():
    RESULT=False
    print '-------------START POWERLINE TEST---------------\n';
    print("starting... HDMI_Test")

    SN=0
    
    #INPUT
    #<Device> <Input> <Test> <-params <value>>
    #////////////////////////
    Device=2
    Input=1
    Test=ID_TEST_HDMI_TMDS_LINE_TEST
    
    Params=asmLimits(H01_HDMI_POWER_LOW_LIMIT_mV,
            H02_HDMI_POWER_HIGH_LIMIT_mV,
            H03_HDMI_LINK_LOW_LIMIT_mV,
            H04_HDMI_LINK_HIGH_LIMIT_mV,
            H05_HDMI_HPD_ZERO_LOW_LIMIT_mV,
            H06_HDMI_HPD_ZERO_HIGH_LIMIT_mV,
            H07_HDMI_HPD_ONE_LOW_LIMIT_mV,
            H08_HDMI_HPD_ONE_HIGHT_LIMIT_mV,
            H09_HDMI_DDC_LOW_LIMIT_mV,
            H10_HDMI_DDC_HIGH_LIMIT_mV,
            H11_HDMI_CEC_ZERO_LOW_LIMIT_mV,
            H12_HDMI_CEC_ZERO_HIGH_LIMIT_mV,
            H13_HDMI_CEC_ONE_LOW_LIMIT_mV,
            H14_HDMI_CEC_ONE_HIGH_LIMIT_mV);
    parameter=" "+str(Device)+" "+str(Input)+" "+str(Test)+" "+str(Params)
    output=runCmd(parameter)
    #CheckErrorCode(runCmd(parameter));
    #////////////////////////

    #OUTPUT
    RESULT=processOutput(SN,output);
    #////////////////////////
    print '-------------END POWERLINE TEST---------------';
    return RESULT


screen = terminal.get_terminal(conEmu=False);

if os.path.isfile(HDMI_FTCMD) and os.access(HDMI_FTCMD, os.R_OK):
   print("FOUND TOOL:"+HDMI_FTCMD);
else:
   print("Set new tool path:"+HDMI_FTCMD);
   HDMI_FTCMD="./HDMI_4K_Volt_LineTest/tool/HDMILineTest.exe"



if os.path.isfile(outTestDataFile) and os.access(outTestDataFile, os.R_OK):
   print("FOUND TOOL:"+outTestDataFile);
   os.remove(outTestDataFile);
else:
   print("Set new tool path:"+outTestDataFile);
   outTestDataFile="./HDMI_4K_Volt_LineTest/inout/HDMI_VoltageTest.out";
   

TEST_Results=Run_HDMI_PowerLine_TEST();
print("The HDMI TEST EXIT CODE IS:"+str(TEST_Results));
EXITCODE=FinalStatus(TEST_Results);
print("The HDMI TEST EXIT CODE IS:"+str(EXITCODE));
sys.exit(EXITCODE);
