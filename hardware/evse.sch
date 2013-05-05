EESchema Schematic File Version 2  date Dom 05 Mai 2013 18:44:14 WEST
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
LIBS:lm555
LIBS:evse-cache
EELAYER 25  0
EELAYER END
$Descr A4 11700 8267
encoding utf-8
Sheet 1 1
Title ""
Date "5 may 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 5000 2350 0    60   ~ 0
Read about LM555:\n- http://electronicsclub.info/555timer.htm
Text Label 5100 4750 0    60   ~ 0
output
Wire Wire Line
	4500 3750 4500 3600
Wire Wire Line
	4050 4050 4050 3950
Wire Wire Line
	6700 4400 6700 4300
Wire Wire Line
	6700 3900 6700 3750
Wire Wire Line
	6700 3750 6650 3750
Connection ~ 8350 3600
Wire Wire Line
	8350 3750 8350 2750
Wire Wire Line
	8350 3750 6800 3750
Wire Wire Line
	6800 3750 6800 3600
Wire Wire Line
	6800 3600 6650 3600
Wire Wire Line
	8350 2750 4500 2750
Wire Wire Line
	4500 2750 4500 3450
Connection ~ 6900 3300
Wire Wire Line
	7650 3450 7650 3300
Wire Wire Line
	7650 3300 6650 3300
Wire Wire Line
	6900 2950 6900 3300
Wire Wire Line
	4500 3600 4850 3600
Wire Wire Line
	4750 3850 4750 3750
Wire Wire Line
	4650 3200 4650 3050
Wire Wire Line
	4650 3050 4800 3050
Wire Wire Line
	4800 3050 4800 3300
Wire Wire Line
	4800 3300 4850 3300
Wire Wire Line
	4750 3750 4850 3750
Wire Wire Line
	6650 3450 7000 3450
Wire Wire Line
	7500 3450 7750 3450
Connection ~ 7650 3450
Wire Wire Line
	6900 3450 6900 3600
Wire Wire Line
	6900 3600 7350 3600
Connection ~ 6900 3450
Wire Wire Line
	8350 3600 7750 3600
Wire Wire Line
	8250 3450 8350 3450
Connection ~ 8350 3450
Wire Wire Line
	4850 3450 4050 3450
Wire Wire Line
	4050 3450 4050 3550
Connection ~ 4500 3450
Wire Wire Line
	4500 4250 4500 4750
Wire Wire Line
	4500 4750 5350 4750
$Comp
L C C1
U 1 1 518684AE
P 4050 3750
F 0 "C1" H 4100 3850 50  0000 L CNN
F 1 "C" H 4100 3650 50  0000 L CNN
	1    4050 3750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 518684AD
P 4050 4050
F 0 "#PWR1" H 4050 4050 30  0001 C CNN
F 1 "GND" H 4050 3980 30  0001 C CNN
	1    4050 4050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR4
U 1 1 51868497
P 6700 4400
F 0 "#PWR4" H 6700 4400 30  0001 C CNN
F 1 "GND" H 6700 4330 30  0001 C CNN
	1    6700 4400
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 51868484
P 6700 4100
F 0 "C2" H 6750 4200 50  0000 L CNN
F 1 "100nF" H 6750 4000 50  0000 L CNN
	1    6700 4100
	1    0    0    -1  
$EndComp
$Comp
L DIODE D1
U 1 1 5186837A
P 7550 3600
F 0 "D1" H 7700 3650 40  0000 C CNN
F 1 "1N4748" H 7550 3500 40  0000 C CNN
	1    7550 3600
	1    0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 518682F5
P 8000 3450
F 0 "R3" V 8080 3450 50  0000 C CNN
F 1 "1K" V 8000 3450 50  0000 C CNN
	1    8000 3450
	0    -1   -1   0   
$EndComp
$Comp
L R R2
U 1 1 518682DA
P 7250 3450
F 0 "R2" V 7330 3450 50  0000 C CNN
F 1 "1K" V 7250 3450 50  0000 C CNN
	1    7250 3450
	0    -1   -1   0   
$EndComp
$Comp
L +12V #PWR5
U 1 1 518682BB
P 6900 2950
F 0 "#PWR5" H 6900 2900 20  0001 C CNN
F 1 "+12V" H 6900 3050 30  0000 C CNN
	1    6900 2950
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 51868268
P 4500 4000
F 0 "R1" V 4580 4000 50  0000 C CNN
F 1 "1K" V 4500 4000 50  0000 C CNN
	1    4500 4000
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR3
U 1 1 51868230
P 4750 3850
F 0 "#PWR3" H 4750 3850 30  0001 C CNN
F 1 "GND" H 4750 3780 30  0001 C CNN
	1    4750 3850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR2
U 1 1 51867F0C
P 4650 3200
F 0 "#PWR2" H 4650 3200 30  0001 C CNN
F 1 "GND" H 4650 3130 30  0001 C CNN
	1    4650 3200
	1    0    0    -1  
$EndComp
$Comp
L LM555 U1
U 1 1 51867EEF
P 5750 3500
F 0 "U1" H 5700 3500 60  0000 C CNN
F 1 "LM555" H 5700 3600 60  0000 C CNN
	1    5750 3500
	1    0    0    -1  
$EndComp
$EndSCHEMATC
