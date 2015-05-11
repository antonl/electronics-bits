EESchema Schematic File Version 2
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
LIBS:humidity_sensor
EELAYER 27 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "Honeywell HumidIcon 6021 breakout board"
Date "4 jun 2014"
Rev "Mk I"
Comp "Ogilvie Group"
Comment1 "Anton Loukianov 2014"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L C C1
U 1 1 538FAC0B
P 4850 4750
F 0 "C1" H 4850 4850 40  0000 L CNN
F 1 "0.22 uF" H 4856 4665 40  0000 L CNN
F 2 "~" H 4888 4600 30  0000 C CNN
F 3 "~" H 4850 4750 60  0000 C CNN
	1    4850 4750
	1    0    0    -1  
$EndComp
$Comp
L CONN_4 P1
U 1 1 538FAC6D
P 3800 4700
F 0 "P1" V 3750 4700 50  0000 C CNN
F 1 "CONN_4" V 3850 4700 50  0000 C CNN
F 2 "" H 3800 4700 60  0000 C CNN
F 3 "" H 3800 4700 60  0000 C CNN
	1    3800 4700
	-1   0    0    1   
$EndComp
$Comp
L HIH6021 U1
U 1 1 538FAD41
P 5750 4750
F 0 "U1" H 5800 4350 60  0000 C CNN
F 1 "HIH6021" H 5750 5050 60  0000 C CNN
F 2 "SIP-4" H 4050 3800 60  0001 C CNN
F 3 "http://sensing.honeywell.com/honeywell-sensing-humidicon-hih6000-series-product-sheet-009073-6-enq.pdf" H 6550 3300 60  0001 C CNN
F 4 "HIH6021-021-001TR-ND" H 4500 3650 60  0001 C CNN "Digikey Part Numer"
F 5 "HIH6021-021-001" H 4350 3450 60  0001 C CNN "Manufacturer Part Number"
	1    5750 4750
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 538FAF2C
P 4700 4300
F 0 "R2" V 4780 4300 40  0000 C CNN
F 1 "2.2K" V 4707 4301 40  0000 C CNN
F 2 "~" V 4630 4300 30  0000 C CNN
F 3 "~" H 4700 4300 30  0000 C CNN
	1    4700 4300
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 538FAF3B
P 4500 4300
F 0 "R1" V 4580 4300 40  0000 C CNN
F 1 "2.2K" V 4507 4301 40  0000 C CNN
F 2 "~" V 4430 4300 30  0000 C CNN
F 3 "~" H 4500 4300 30  0000 C CNN
	1    4500 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 5300 6400 4950
Wire Wire Line
	6500 4700 6500 5450
Wire Wire Line
	6500 4700 6400 4700
Wire Wire Line
	4150 4850 4300 4850
Wire Wire Line
	4300 4850 4300 5100
Wire Wire Line
	4300 4950 5100 4950
Wire Wire Line
	4850 4050 4850 4550
Connection ~ 4850 4050
Wire Wire Line
	4850 4550 5100 4550
Wire Wire Line
	4150 4650 4700 4650
Wire Wire Line
	4700 4550 4700 5300
Wire Wire Line
	4700 5300 6400 5300
Wire Wire Line
	4600 4750 4600 5450
Wire Wire Line
	4600 5450 6500 5450
Wire Wire Line
	4500 4750 4500 4550
Wire Wire Line
	4150 4750 4600 4750
Connection ~ 4500 4750
Connection ~ 4700 4650
Wire Wire Line
	4150 4550 4150 4050
Connection ~ 4150 4050
Wire Wire Line
	4150 4050 4850 4050
$Comp
L +3.3V #PWR?
U 1 1 538FB0DB
P 4300 4050
F 0 "#PWR?" H 4300 4010 30  0001 C CNN
F 1 "+3.3V" H 4300 4160 30  0000 C CNN
F 2 "" H 4300 4050 60  0000 C CNN
F 3 "" H 4300 4050 60  0000 C CNN
	1    4300 4050
	1    0    0    -1  
$EndComp
$Comp
L DGND #PWR?
U 1 1 538FB0EA
P 4300 5100
F 0 "#PWR?" H 4300 5100 40  0001 C CNN
F 1 "DGND" H 4300 5030 40  0000 C CNN
F 2 "" H 4300 5100 60  0000 C CNN
F 3 "" H 4300 5100 60  0000 C CNN
	1    4300 5100
	1    0    0    -1  
$EndComp
Connection ~ 4300 4950
$EndSCHEMATC
