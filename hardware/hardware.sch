EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "ATtiny25 PWM controller"
Date "2021-04-09"
Rev "1.1"
Comp "BME SBT"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R_POT RV1
U 1 1 606FA74C
P 7050 3150
F 0 "RV1" H 6980 3104 50  0000 R CNN
F 1 "R_POT" H 6980 3195 50  0000 R CNN
F 2 "Potentiometer_THT:Potentiometer_Alps_RK09K_Single_Vertical" H 7050 3150 50  0001 C CNN
F 3 "~" H 7050 3150 50  0001 C CNN
	1    7050 3150
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 606FE292
P 7050 3000
F 0 "#PWR03" H 7050 2850 50  0001 C CNN
F 1 "+5V" H 7050 3150 50  0000 C CNN
F 2 "" H 7050 3000 50  0001 C CNN
F 3 "" H 7050 3000 50  0001 C CNN
	1    7050 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 607001FB
P 7050 3300
F 0 "#PWR08" H 7050 3050 50  0001 C CNN
F 1 "GND" H 7055 3127 50  0000 C CNN
F 2 "" H 7050 3300 50  0001 C CNN
F 3 "" H 7050 3300 50  0001 C CNN
	1    7050 3300
	1    0    0    -1  
$EndComp
Text GLabel 6250 3150 0    50   Output ~ 0
POT
Text GLabel 5000 3250 2    50   Input ~ 0
POT
Text GLabel 5000 3350 2    50   Output ~ 0
PWM
$Comp
L power:GND #PWR010
U 1 1 60700F21
P 4400 3850
F 0 "#PWR010" H 4400 3600 50  0001 C CNN
F 1 "GND" H 4405 3677 50  0000 C CNN
F 2 "" H 4400 3850 50  0001 C CNN
F 3 "" H 4400 3850 50  0001 C CNN
	1    4400 3850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR05
U 1 1 607013D2
P 4400 2650
F 0 "#PWR05" H 4400 2500 50  0001 C CNN
F 1 "+5V" H 4415 2823 50  0000 C CNN
F 2 "" H 4400 2650 50  0001 C CNN
F 3 "" H 4400 2650 50  0001 C CNN
	1    4400 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 60701BCA
P 6400 3300
F 0 "C3" H 6515 3346 50  0000 L CNN
F 1 "100n" H 6515 3255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6438 3150 50  0001 C CNN
F 3 "~" H 6400 3300 50  0001 C CNN
	1    6400 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 60702339
P 6400 3450
F 0 "#PWR07" H 6400 3200 50  0001 C CNN
F 1 "GND" H 6405 3277 50  0000 C CNN
F 2 "" H 6400 3450 50  0001 C CNN
F 3 "" H 6400 3450 50  0001 C CNN
	1    6400 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3150 6400 3150
Connection ~ 6400 3150
Wire Wire Line
	6400 3150 6900 3150
$Comp
L Device:C C1
U 1 1 6070273A
P 4200 4700
F 0 "C1" H 4315 4746 50  0000 L CNN
F 1 "1u" H 4315 4655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4238 4550 50  0001 C CNN
F 3 "~" H 4200 4700 50  0001 C CNN
	1    4200 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C2
U 1 1 60702D31
P 4600 4700
F 0 "C2" H 4715 4746 50  0000 L CNN
F 1 "100n" H 4715 4655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4638 4550 50  0001 C CNN
F 3 "~" H 4600 4700 50  0001 C CNN
	1    4600 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4550 4400 4550
Wire Wire Line
	4200 4850 4400 4850
$Comp
L power:GND #PWR02
U 1 1 607035BA
P 4400 4850
F 0 "#PWR02" H 4400 4600 50  0001 C CNN
F 1 "GND" H 4405 4677 50  0000 C CNN
F 2 "" H 4400 4850 50  0001 C CNN
F 3 "" H 4400 4850 50  0001 C CNN
	1    4400 4850
	1    0    0    -1  
$EndComp
Connection ~ 4400 4850
Wire Wire Line
	4400 4850 4600 4850
$Comp
L power:+5V #PWR01
U 1 1 60703BDE
P 4400 4550
F 0 "#PWR01" H 4400 4400 50  0001 C CNN
F 1 "+5V" H 4415 4723 50  0000 C CNN
F 2 "" H 4400 4550 50  0001 C CNN
F 3 "" H 4400 4550 50  0001 C CNN
	1    4400 4550
	1    0    0    -1  
$EndComp
Connection ~ 4400 4550
Wire Wire Line
	4400 4550 4200 4550
$Comp
L power:+5V #PWR09
U 1 1 606F8A3E
P 5700 3450
F 0 "#PWR09" H 5700 3300 50  0001 C CNN
F 1 "+5V" H 5715 3623 50  0000 C CNN
F 2 "" H 5700 3450 50  0001 C CNN
F 3 "" H 5700 3450 50  0001 C CNN
	1    5700 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 606F96B6
P 5450 3450
F 0 "R1" V 5243 3450 50  0000 C CNN
F 1 "10k" V 5334 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5380 3450 50  0001 C CNN
F 3 "~" H 5450 3450 50  0001 C CNN
	1    5450 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	5700 3450 5600 3450
Wire Wire Line
	5300 3450 5000 3450
$Comp
L MCU_Microchip_ATtiny:ATtiny25-20SSU U1
U 1 1 606F9DA6
P 4400 3250
F 0 "U1" H 3871 3296 50  0000 R CNN
F 1 "ATtiny25-20SSU" H 3871 3205 50  0000 R CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 4400 3250 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2586-avr-8-bit-microcontroller-attiny25-attiny45-attiny85_datasheet.pdf" H 4400 3250 50  0001 C CNN
	1    4400 3250
	1    0    0    -1  
$EndComp
Text GLabel 5050 3450 3    50   Input ~ 0
nRST
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J2
U 1 1 606FC067
P 5650 4650
F 0 "J2" H 5700 4967 50  0000 C CNN
F 1 "ISP" H 5700 4876 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 5650 4650 50  0001 C CNN
F 3 "~" H 5650 4650 50  0001 C CNN
	1    5650 4650
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR013
U 1 1 606FD2F7
P 6050 4500
F 0 "#PWR013" H 6050 4350 50  0001 C CNN
F 1 "+5V" H 6065 4673 50  0000 C CNN
F 2 "" H 6050 4500 50  0001 C CNN
F 3 "" H 6050 4500 50  0001 C CNN
	1    6050 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4500 6050 4550
Wire Wire Line
	6050 4550 5950 4550
$Comp
L power:GND #PWR014
U 1 1 606FE04D
P 6050 4800
F 0 "#PWR014" H 6050 4550 50  0001 C CNN
F 1 "GND" H 6055 4627 50  0000 C CNN
F 2 "" H 6050 4800 50  0001 C CNN
F 3 "" H 6050 4800 50  0001 C CNN
	1    6050 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4800 6050 4750
Wire Wire Line
	6050 4750 5950 4750
$Comp
L Connector:Screw_Terminal_01x06 J1
U 1 1 60702F3D
P 7100 4550
F 0 "J1" H 7180 4542 50  0000 L CNN
F 1 "Screw_Terminal_01x06" H 7180 4451 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-6-5.0-H_1x06_P5.00mm_Horizontal" H 7100 4550 50  0001 C CNN
F 3 "~" H 7100 4550 50  0001 C CNN
	1    7100 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 607037E3
P 6400 4350
F 0 "#PWR011" H 6400 4200 50  0001 C CNN
F 1 "+5V" H 6415 4523 50  0000 C CNN
F 2 "" H 6400 4350 50  0001 C CNN
F 3 "" H 6400 4350 50  0001 C CNN
	1    6400 4350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 60703B51
P 6400 4450
F 0 "#PWR012" H 6400 4200 50  0001 C CNN
F 1 "GND" H 6405 4277 50  0000 C CNN
F 2 "" H 6400 4450 50  0001 C CNN
F 3 "" H 6400 4450 50  0001 C CNN
	1    6400 4450
	1    0    0    -1  
$EndComp
Text GLabel 6900 4550 0    50   Input ~ 0
PWM
Text GLabel 5000 2950 2    50   Input ~ 0
PB0
Text GLabel 5000 3050 2    50   Input ~ 0
PB1
Text GLabel 5000 3150 2    50   Input ~ 0
PB2
Text GLabel 5950 4650 2    50   Input ~ 0
PB0
Text GLabel 5450 4550 0    50   Input ~ 0
PB1
Text GLabel 5450 4650 0    50   Input ~ 0
PB2
Text GLabel 6900 4650 0    50   Input ~ 0
PB0
Text GLabel 6900 4750 0    50   Input ~ 0
PB1
Text GLabel 6900 4850 0    50   Input ~ 0
PB2
Wire Wire Line
	6400 4450 6900 4450
Wire Wire Line
	6400 4350 6900 4350
Text GLabel 5450 4750 0    50   Output ~ 0
nRST
$Comp
L Mechanical:MountingHole H1
U 1 1 6071A633
P 8100 3650
F 0 "H1" H 8200 3696 50  0000 L CNN
F 1 "MountingHole" H 8200 3605 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 8100 3650 50  0001 C CNN
F 3 "~" H 8100 3650 50  0001 C CNN
	1    8100 3650
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6071B009
P 8100 3850
F 0 "H2" H 8200 3896 50  0000 L CNN
F 1 "MountingHole" H 8200 3805 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 8100 3850 50  0001 C CNN
F 3 "~" H 8100 3850 50  0001 C CNN
	1    8100 3850
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 6071B586
P 8100 4050
F 0 "H3" H 8200 4096 50  0000 L CNN
F 1 "MountingHole" H 8200 4005 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 8100 4050 50  0001 C CNN
F 3 "~" H 8100 4050 50  0001 C CNN
	1    8100 4050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 6071BBA3
P 8100 4250
F 0 "H4" H 8200 4296 50  0000 L CNN
F 1 "MountingHole" H 8200 4205 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 8100 4250 50  0001 C CNN
F 3 "~" H 8100 4250 50  0001 C CNN
	1    8100 4250
	1    0    0    -1  
$EndComp
$EndSCHEMATC
