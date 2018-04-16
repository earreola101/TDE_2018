Summary
=======
Date: 07/02/2013
Module version: 7.4.13.1077
Machine: Newark TDE lab, TDE1

Test Conditions:
1. Record device, Microphone (USB Audio CODEC), set volumne to 0.5 (range from low as 0 to high as 1).
2. Microphone hardware switch set to LO (range LO, MID, HI).
3. Lens module: FW 100.0.1697, EEPROM 1.0, VID 0x046D, PID 0x0845.
4. Kinetic script: UTEST_MAIN.ktst
5. Kinetic script lets recorded sound go through bandpass filter before analysis.
6. AC and frequency response tests are there to collect data.
7. Peak measurements are meant to PASS/FAIL; but for PB1 the main goal is to collect data.
8. Test limits are wide open for PB1 for two reasons:
   1) Short of samples: with only one working unit for lab work.
   2) No correlation: due to limitations, have not done correlation study with SPL meter in acoustic chamber. 

=======
E.O.F.