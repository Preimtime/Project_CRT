EESchema Schematic File Version 4
LIBS:Centretappedtrafo-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PCB_Phaseshifter-cache:Transformer_ADT8-1T TR1
U 1 1 5D9E561E
P 2100 4250
F 0 "TR1" H 2100 4631 50  0000 C CNN
F 1 "Transformer_ADT8-1T" H 2100 4540 50  0000 C CNN
F 2 "PCB_Phaseschifter:SOIC-6" H 2100 3900 50  0001 C CNN
F 3 "" H 2100 4250 50  0001 C CNN
	1    2100 4250
	1    0    0    -1  
$EndComp
$Comp
L Diode:1N914WT D6
U 1 1 5D9E91F8
P 3350 4100
F 0 "D6" V 3304 4180 50  0000 L CNN
F 1 "1N914WT" V 3395 4180 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 3350 3925 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/149/1N4148WT-461550.pdf" H 3350 4100 50  0001 C CNN
	1    3350 4100
	0    1    1    0   
$EndComp
$Comp
L Diode:1N914WT D4
U 1 1 5D9EA1BE
P 2700 4700
F 0 "D4" V 2746 4620 50  0000 R CNN
F 1 "1N914WT" V 2655 4620 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-523" H 2700 4525 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/149/1N4148WT-461550.pdf" H 2700 4700 50  0001 C CNN
	1    2700 4700
	0    -1   -1   0   
$EndComp
$Comp
L Diode:1N914WT D8
U 1 1 5D9EA76A
P 3350 4700
F 0 "D8" V 3304 4780 50  0000 L CNN
F 1 "1N914WT" V 3395 4780 50  0000 L CNN
F 2 "Diode_SMD:D_SOD-523" H 3350 4525 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/149/1N4148WT-461550.pdf" H 3350 4700 50  0001 C CNN
	1    3350 4700
	0    1    1    0   
$EndComp
$Comp
L Diode:1N914WT D2
U 1 1 5D9EAFD4
P 2700 4100
F 0 "D2" V 2746 4020 50  0000 R CNN
F 1 "1N914WT" V 2655 4020 50  0000 R CNN
F 2 "Diode_SMD:D_SOD-523" H 2700 3925 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/149/1N4148WT-461550.pdf" H 2700 4100 50  0001 C CNN
	1    2700 4100
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Zener D1
U 1 1 5D9EB6A1
P 2700 3800
F 0 "D1" V 2654 3879 50  0000 L CNN
F 1 "D_Zener" V 2745 3879 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" H 2700 3800 50  0001 C CNN
F 3 "~" H 2700 3800 50  0001 C CNN
	1    2700 3800
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D7
U 1 1 5D9EBDA7
P 3350 4400
F 0 "D7" V 3396 4321 50  0000 R CNN
F 1 "D_Zener" V 3305 4321 50  0000 R CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" H 3350 4400 50  0001 C CNN
F 3 "~" H 3350 4400 50  0001 C CNN
	1    3350 4400
	0    -1   -1   0   
$EndComp
$Comp
L Device:D_Zener D3
U 1 1 5D9EC037
P 2700 4400
F 0 "D3" V 2654 4479 50  0000 L CNN
F 1 "D_Zener" V 2745 4479 50  0000 L CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" H 2700 4400 50  0001 C CNN
F 3 "~" H 2700 4400 50  0001 C CNN
	1    2700 4400
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D5
U 1 1 5D9EC2FE
P 3350 3800
F 0 "D5" V 3396 3721 50  0000 R CNN
F 1 "D_Zener" V 3305 3721 50  0000 R CNN
F 2 "Diode_THT:D_DO-15_P12.70mm_Horizontal" H 3350 3800 50  0001 C CNN
F 3 "~" H 3350 3800 50  0001 C CNN
	1    3350 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3350 4250 2700 4250
Connection ~ 3350 4250
Connection ~ 2700 4250
Wire Wire Line
	2700 4250 2300 4250
$Comp
L PCB_Phaseshifter-cache:power_GND #PWR01
U 1 1 5D9F6C25
P 1750 4450
F 0 "#PWR01" H 1750 4200 50  0001 C CNN
F 1 "power_GND" H 1755 4277 50  0000 C CNN
F 2 "" H 1750 4450 50  0001 C CNN
F 3 "" H 1750 4450 50  0001 C CNN
	1    1750 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 4450 2300 4850
Wire Wire Line
	2300 4850 2700 4850
Wire Wire Line
	2700 4850 3350 4850
Connection ~ 2700 4850
Wire Wire Line
	3350 3650 2700 3650
Wire Wire Line
	2300 4050 2300 3650
Wire Wire Line
	2300 3650 2700 3650
Connection ~ 2700 3650
$Comp
L PCB_Phaseshifter-cache:Connector_Conn_Coaxial_Power J1
U 1 1 5D9F96FC
P 1450 4200
F 0 "J1" H 1538 4196 50  0000 L CNN
F 1 "Connector_Conn_Coaxial_Power" H 1538 4105 50  0000 L CNN
F 2 "Connector_Coaxial:BNC_Amphenol_B6252HB-NPP3G-50_Horizontal" H 1450 4150 50  0001 C CNN
F 3 "" H 1450 4150 50  0001 C CNN
	1    1450 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 4100 1450 4050
Wire Wire Line
	1450 4050 1900 4050
Wire Wire Line
	1450 4400 1450 4450
Wire Wire Line
	1450 4450 1750 4450
$Comp
L PCB_Phaseshifter-cache:Connector_Conn_Coaxial_Power J3
U 1 1 5D9FC678
P 3950 4750
F 0 "J3" H 3870 4654 50  0000 R CNN
F 1 "Connector_Conn_Coaxial_Power" H 3870 4745 50  0000 R CNN
F 2 "Connector_Coaxial:BNC_Amphenol_B6252HB-NPP3G-50_Horizontal" H 3950 4700 50  0001 C CNN
F 3 "" H 3950 4700 50  0001 C CNN
	1    3950 4750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3350 4850 3950 4850
Connection ~ 3350 4850
Wire Wire Line
	3950 3650 3350 3650
Connection ~ 3350 3650
Connection ~ 1750 4450
Wire Wire Line
	1750 4450 1900 4450
$Comp
L PCB_Phaseshifter-cache:power_GND #PWR0101
U 1 1 5DD55817
P 3950 4550
F 0 "#PWR0101" H 3950 4300 50  0001 C CNN
F 1 "power_GND" H 3955 4377 50  0000 C CNN
F 2 "" H 3950 4550 50  0001 C CNN
F 3 "" H 3950 4550 50  0001 C CNN
	1    3950 4550
	-1   0    0    1   
$EndComp
$Comp
L PCB_Phaseshifter-cache:power_GND #PWR0102
U 1 1 5DD5733B
P 3950 3950
F 0 "#PWR0102" H 3950 3700 50  0001 C CNN
F 1 "power_GND" H 3955 3777 50  0000 C CNN
F 2 "" H 3950 3950 50  0001 C CNN
F 3 "" H 3950 3950 50  0001 C CNN
	1    3950 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 4250 4150 4250
$Comp
L PCB_Phaseshifter-cache:power_GND #PWR0103
U 1 1 5DD5798C
P 4350 4050
F 0 "#PWR0103" H 4350 3800 50  0001 C CNN
F 1 "power_GND" H 4355 3877 50  0000 C CNN
F 2 "" H 4350 4050 50  0001 C CNN
F 3 "" H 4350 4050 50  0001 C CNN
	1    4350 4050
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_Coaxial J4
U 1 1 5DABBCE5
P 4350 4250
F 0 "J4" H 4450 4132 50  0000 L CNN
F 1 "Conn_Coaxial" H 4450 4223 50  0000 L CNN
F 2 "Connector_Coaxial:BNC_Amphenol_B6252HB-NPP3G-50_Horizontal" H 4350 4250 50  0001 C CNN
F 3 " ~" H 4350 4250 50  0001 C CNN
	1    4350 4250
	1    0    0    1   
$EndComp
$Comp
L PCB_Phaseshifter-cache:Connector_Conn_Coaxial_Power J2
U 1 1 5D9FB8AD
P 3950 3750
F 0 "J2" H 4038 3746 50  0000 L CNN
F 1 "Connector_Conn_Coaxial_Power" H 4038 3655 50  0000 L CNN
F 2 "Connector_Coaxial:BNC_Amphenol_B6252HB-NPP3G-50_Horizontal" H 3950 3700 50  0001 C CNN
F 3 "" H 3950 3700 50  0001 C CNN
	1    3950 3750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
