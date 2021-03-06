EESchema Schematic File Version 2
LIBS:adl-parts
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:pd-amplifier-cache
EELAYER 25 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title ""
Date "Friday, October 17, 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L IVC102 U1
U 1 1 5441340D
P 5200 3150
F 0 "U1" H 5400 3750 60  0000 C CNN
F 1 "IVC102" H 5200 3350 60  0000 C CNN
F 2 "" H 5150 3150 60  0000 C CNN
F 3 "" H 5150 3150 60  0000 C CNN
	1    5200 3150
	1    0    0    -1  
$EndComp
$Comp
L +15V #PWR01
U 1 1 5441353C
P 5850 2650
F 0 "#PWR01" H 5850 2600 20  0001 C CNN
F 1 "+15V" H 5850 2750 30  0000 C CNN
F 2 "" H 5850 2650 60  0000 C CNN
F 3 "" H 5850 2650 60  0000 C CNN
	1    5850 2650
	1    0    0    -1  
$EndComp
$Comp
L C C1
U 1 1 544136B5
P 6100 2750
F 0 "C1" V 6250 2700 40  0000 L CNN
F 1 "0.1 μF" V 5950 2650 40  0000 L CNN
F 2 "" H 6138 2600 30  0000 C CNN
F 3 "" H 6100 2750 60  0000 C CNN
	1    6100 2750
	0    -1   -1   0   
$EndComp
$Comp
L DGND #PWR02
U 1 1 544137F5
P 5400 4050
F 0 "#PWR02" H 5400 4050 40  0001 C CNN
F 1 "DGND" H 5400 3980 40  0000 C CNN
F 2 "" H 5400 4050 60  0000 C CNN
F 3 "" H 5400 4050 60  0000 C CNN
	1    5400 4050
	1    0    0    -1  
$EndComp
$Comp
L -15V #PWR03
U 1 1 544139F0
P 5850 3800
F 0 "#PWR03" H 5850 3750 20  0001 C CNN
F 1 "-15V" H 5850 3900 30  0000 C CNN
F 2 "" H 5850 3800 60  0000 C CNN
F 3 "" H 5850 3800 60  0000 C CNN
	1    5850 3800
	-1   0    0    1   
$EndComp
$Comp
L C C2
U 1 1 54413C6E
P 6100 3600
F 0 "C2" V 5950 3550 40  0000 L CNN
F 1 "0.1 μF" V 6250 3500 40  0000 L CNN
F 2 "" H 6138 3450 30  0000 C CNN
F 3 "" H 6100 3600 60  0000 C CNN
	1    6100 3600
	0    1    1    0   
$EndComp
$Comp
L AGND #PWR04
U 1 1 54416E17
P 4400 3700
F 0 "#PWR04" H 4400 3700 40  0001 C CNN
F 1 "AGND" H 4400 3630 50  0000 C CNN
F 2 "" H 4400 3700 60  0000 C CNN
F 3 "" H 4400 3700 60  0000 C CNN
	1    4400 3700
	1    0    0    -1  
$EndComp
$Comp
L AGND #PWR05
U 1 1 54416E30
P 6400 3700
F 0 "#PWR05" H 6400 3700 40  0001 C CNN
F 1 "AGND" H 6400 3630 50  0000 C CNN
F 2 "" H 6400 3700 60  0000 C CNN
F 3 "" H 6400 3700 60  0000 C CNN
	1    6400 3700
	1    0    0    -1  
$EndComp
$Comp
L AGND #PWR06
U 1 1 54416F57
P 6400 2850
F 0 "#PWR06" H 6400 2850 40  0001 C CNN
F 1 "AGND" H 6400 2780 50  0000 C CNN
F 2 "" H 6400 2850 60  0000 C CNN
F 3 "" H 6400 2850 60  0000 C CNN
	1    6400 2850
	1    0    0    -1  
$EndComp
$Comp
L COAX_JACK J1
U 1 1 54419066
P 3250 3200
F 0 "J1" H 3250 3300 60  0000 C CNN
F 1 "COAX_JACK" H 3300 3100 60  0001 C CNN
F 2 "" H 3300 3200 60  0000 C CNN
F 3 "" H 3300 3200 60  0000 C CNN
	1    3250 3200
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5441914C
P 3500 3400
F 0 "R1" V 3450 3550 60  0000 C CNN
F 1 "10R" H 3500 3300 60  0000 C CNN
F 2 "" H 3565 3400 60  0000 C CNN
F 3 "" H 3565 3400 60  0000 C CNN
	1    3500 3400
	0    1    1    0   
$EndComp
Text Label 3500 3200 0    60   ~ 0
PD_IN
$Comp
L COAX_JACK J2
U 1 1 54419932
P 6650 3150
F 0 "J2" H 6650 3250 60  0000 C CNN
F 1 "COAX_JACK" H 6700 3050 60  0001 C CNN
F 2 "" H 6700 3150 60  0000 C CNN
F 3 "" H 6700 3150 60  0000 C CNN
	1    6650 3150
	-1   0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 54419A9E
P 6400 3400
F 0 "R4" V 6350 3550 60  0000 C CNN
F 1 "10R" H 6400 3300 60  0000 C CNN
F 2 "" H 6465 3400 60  0000 C CNN
F 3 "" H 6465 3400 60  0000 C CNN
	1    6400 3400
	0    1    1    0   
$EndComp
Text Label 6100 3150 0    60   ~ 0
SIGNAL
$Comp
L COAX_JACK J3
U 1 1 5441A894
P 3300 4400
F 0 "J3" H 3300 4500 60  0000 C CNN
F 1 "COAX_JACK" H 3350 4300 60  0001 C CNN
F 2 "" H 3350 4400 60  0000 C CNN
F 3 "" H 3350 4400 60  0000 C CNN
	1    3300 4400
	1    0    0    -1  
$EndComp
$Comp
L DGND #PWR07
U 1 1 5441AF44
P 3450 4550
F 0 "#PWR07" H 3450 4550 40  0001 C CNN
F 1 "DGND" H 3450 4480 40  0000 C CNN
F 2 "" H 3450 4550 60  0000 C CNN
F 3 "" H 3450 4550 60  0000 C CNN
	1    3450 4550
	1    0    0    -1  
$EndComp
Text Label 3550 4400 0    60   ~ 0
RESET
Wire Wire Line
	5800 2750 5850 2750
Wire Wire Line
	5850 2750 5950 2750
Wire Wire Line
	5850 2750 5850 2650
Connection ~ 5850 2750
Wire Wire Line
	6300 2750 6400 2750
Wire Wire Line
	6400 2750 6400 2850
Wire Wire Line
	5400 3900 5400 4000
Wire Wire Line
	5400 4000 5400 4050
Wire Wire Line
	5800 3600 5850 3600
Wire Wire Line
	5850 3600 5900 3600
Wire Wire Line
	5850 3600 5850 3800
Connection ~ 5850 3600
Wire Wire Line
	6300 3600 6400 3600
Wire Wire Line
	4600 3500 4400 3500
Wire Wire Line
	4400 3350 4400 3500
Wire Wire Line
	4400 3500 4400 3550
Wire Wire Line
	4400 3550 4400 3700
Wire Wire Line
	4600 3350 4400 3350
Connection ~ 4400 3500
Wire Wire Line
	4600 3200 3350 3200
Wire Wire Line
	3350 3250 3500 3250
Wire Wire Line
	3500 3550 4400 3550
Connection ~ 4400 3550
Wire Wire Line
	5800 3150 6550 3150
Wire Wire Line
	6550 3200 6400 3200
Connection ~ 6400 3600
Wire Wire Line
	6400 3200 6400 3250
Wire Wire Line
	6400 3550 6400 3600
Wire Wire Line
	6400 3600 6400 3700
Wire Wire Line
	3400 4400 5200 4400
Wire Wire Line
	5200 4400 5200 3900
Wire Wire Line
	3400 4450 3450 4450
Wire Wire Line
	3450 4450 3450 4550
Wire Wire Line
	5000 3900 5000 4000
Wire Wire Line
	5000 4000 5400 4000
Connection ~ 5400 4000
Wire Wire Line
	4600 2750 4600 2900
Wire Wire Line
	4600 2900 4600 3050
Wire Wire Line
	4600 3050 4600 3200
Connection ~ 4600 3050
Connection ~ 4600 2900
Connection ~ 4600 2750
Connection ~ 4600 3200
$EndSCHEMATC
