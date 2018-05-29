data Moore;  
input Processor $ TransistorCount Year Designer $ Process Areasqmm PastCurrent $ PastCurrentInd $;
datalines;
Intel4004 2300 1971 Intel 10000 12 Past 0
Intel8008 3500 1972 Intel 10000 14 Past 0
Intel8080 4500 1974 Intel 6000 20 Past 0
Motorola6800 4100 1974 Motorola 6000 16 Past 0
RCA1802 5000 1974 RCA 5000 27 Past 0
TMS1000 8000 1974 TexasInstruments 8000 11 Past 0
MOSTechnology6502 3510 1975 MOSTechnology 8000 21 Past 0
Intel8085 6500 1976 Intel 3000 20 Past 0
ZilogZ80 8500 1976 Zilog 4000 18 Past 0
Intel8086 29000 1978 Intel 3000 33 Past 0
Motorola6809 9000 1978 Motorola 5000 21 Past 0
Intel8088 29000 1979 Intel 3000 33 Past 0
Motorola68000 68000 1979 Motorola 3500 44 Past 0
WDC65C02 11500 1981 WDC 3000 6 Past 0
Intel80186 55000 1982 Intel 3000 60 Past 0
Intel80286 134000 1982 Intel 1500 49 Past 0
WDC65C816 22000 1983 WDC 3000 9 Past 0
Motorola68020 190000 1984 Motorola 2000 85 Past 0
ARM1 25000 1985 Acorn 3000 50 Past 0
NovixNC4016 16000 1985 HarrisCorporation 3000 . Past 0
Intel80386 275000 1985 Intel 1500 104 Past 0
ARM2 30000 1986 Acorn 2000 30 Past 0
68030 273000 1987 Motorola 800 102 Past 0
TIExplorer's32-bitLispmachinechip 553000 1987 TexasInstruments 2000 . Past 0
DECWRLMultiTitan 180000 1988 DECWRL 1500 61 Past 0
Inteli960 250000 1988 Intel 600 . Past 0
ARM3 310000 1989 Acorn 1500 87 Past 0
Intel80486 1180235 1989 Intel 1000 173 Past 0
68040 1200000 1990 Motorola 650 152 Past 0
ARM6 35000 1991 ARM 800 . Past 0
R4000 1350000 1991 MIPS 1000 213 Past 0
Pentium 3100000 1993 Intel 800 294 Past 0
ARM700 578977 1994 ARM . 69 Past 0
68060 2500000 1994 Motorola 600 218 Past 0
SA-110 2500000 1995 Acorn/DEC/Apple 350 50 Past 0
PentiumPro 5500000 1995 Intel 500 307 Past 0
AMDK5 4300000 1996 AMD 500 251 Past 0
AMDK6 8800000 1997 AMD 350 162 Past 0
PentiumIIKlamath 7500000 1997 Intel 350 195 Past 0
PentiumIIDeschutes 7500000 1998 Intel 250 113 Past 0
ARM9TDMI 111000 1999 Acorn 350 5 Past 0
AMDK6-III 21300000 1999 AMD 250 118 Past 0
AMDK7 22000000 1999 AMD 250 184 Past 0
PentiumIIIKatmai 9500000 1999 Intel 250 128 Past 0
PentiumIIMobileDixon 27400000 1999 Intel 180 180 Past 0
PentiumIIICoppermine 21000000 2000 Intel 180 80 Past 0
Pentium4Willamette 42000000 2000 Intel 180 217 Past 0
PentiumIIITualatin 45000000 2001 Intel 130 81 Past 0
Pentium4Northwood 55000000 2002 Intel 130 145 Past 0
Itanium2McKinley 220000000 2002 Intel 180 421 Past 0
Barton 54300000 2003 AMD 130 101 Past 0
AMDK8 105900000 2003 AMD 130 193 Past 0
Itanium2Madison6M 410000000 2003 Intel 130 374 Past 0
Pentium4Prescott 112000000 2004 Intel 90 110 Past 0
Itanium2with9MBcache 592000000 2004 Intel 130 432 Past 0
Pentium4Prescott-2M 169000000 2005 Intel 90 143 Past 0
PentiumDSmithfield 228000000 2005 Intel 90 206 Past 0
Pentium4CedarMill 184000000 2006 Intel 65 90 Past 0
Core2DuoConroe 291000000 2006 Intel 65 143 Past 0
PentiumDPresler 362000000 2006 Intel 65 162 Past 0
Dual-coreItanium2 1700000000 2006 Intel 90 596 Past 0
Cell 241000000 2006 Sony/IBM/Toshiba 90 221 Past 0
AMDK10quad-core2ML3 463000000 2007 AMD 65 283 Past 0
ARMCortex-A9 26000000 2007 ARM 45 31 Past 0
POWER6 789000000 2007 IBM 65 341 Past 0
Core2DuoAllendale 169000000 2007 Intel 65 111 Past 0
Core2DuoWolfdale 411000000 2007 Intel 45 107 Past 0
AMDK10quad-core6ML3 758000000 2008 AMD 45 258 Past 0
Atom 47000000 2008 Intel 45 24 Past 0
Core2DuoWolfdale3M 230000000 2008 Intel 45 83 Past 0
Corei7(Quad) 731000000 2008 Intel 45 263 Past 0
Six-coreXeon7400 1900000000 2008 Intel 45 503 Past 0
Six-coreOpteron2400 904000000 2009 AMD 45 346 Past 0
8-corePOWER732ML3 1200000000 2010 IBM 45 567 Current 1
Quad-corez196[23] 1400000000 2010 IBM 45 512 Current 1
Six-coreCorei7(Gulftown) 1170000000 2010 Intel 32 240 Current 1
Quad-coreItaniumTukwila 2000000000 2010 Intel 65 699 Current 1
8-coreXeonNehalem-EX 2300000000 2010 Intel 45 684 Current 1
16-coreSPARCT3 1000000000 2010 Sun/Oracle 40 377 Current 1
Quad-core+GPUCorei7 1160000000 2011 Intel 32 216 Current 1
Six-coreCorei7/8-coreXeonE5 2270000000 2011 Intel 32 434 Current 1
10-coreXeonWestmere-EX 2600000000 2011 Intel 32 512 Current 1
8-coreAMDBulldozer 1200000000 2012 AMD 32 315 Current 1
Quad-core+GPUAMDTrinity 1303000000 2012 AMD 32 246 Current 1
8-corePOWER7+80MBL3cache 2100000000 2012 IBM 32 567 Current 1
Six-corezEC12 2750000000 2012 IBM 32 597 Current 1
Atom"Medfield" 432000000 2012 Intel 32 64 Current 1
Quad-core+GPUCorei7IvyBridge 1400000000 2012 Intel 22 160 Current 1
8-coreItaniumPoulson 3100000000 2012 Intel 32 544 Current 1
61-coreXeonPhi 5000000000 2012 Intel 22 720 Current 1
AppleA7(dual-coreARM64"mobileSoC") 1000000000 2013 Apple 28 102 Current 1
12-corePOWER8 4200000000 2013 IBM 22 650 Current 1
Six-coreCorei7IvyBridgeE 1860000000 2013 Intel 22 256 Current 1
XboxOnemainSoC 5000000000 2013 Microsoft/AMD 28 363 Current 1
AppleA8(dual-coreARM64"mobileSoC") 2000000000 2014 Apple 20 89 Current 1
AppleA8X(tri-coreARM64"mobileSoC") 3000000000 2014 Apple 20 128 Current 1
Quad-core+GPUCorei7Haswell 1400000000 2014 Intel 22 177 Current 1
8-coreCorei7Haswell-E 2600000000 2014 Intel 22 355 Current 1
15-coreXeonIvyBridge-EX 4310000000 2014 Intel 22 541 Current 1
18-coreXeonHaswell-E5 5560000000 2014 Intel 22 661 Current 1
IBMz13 3990000000 2015 IBM 22 678 Current 1
IBMz13StorageController 7100000000 2015 IBM 22 678 Current 1
Quad-core+GPUGT2Corei7SkylakeK 1750000000 2015 Intel 14 122 Current 1
Dual-core+GPUIrisCorei7Broadwell-U 1900000000 2015 Intel 14 133 Current 1
32-coreSPARCM7 10000000000 2015 Oracle 20 . Current 1
AppleA10Fusion(quad-coreARM64"mobileSoC") 3300000000 2016 Apple 16 125 Current 1
10-coreCorei7Broadwell-E 3200000000 2016 Intel 14 246 Current 1
22-coreXeonBroadwell-E5 7200000000 2016 Intel 14 456 Current 1
QualcommSnapdragon835(octa-coreARM64"mobileSoC") 3000000000 2016 Qualcomm 10 . Current 1
8-coreRyzen 4800000000 2017 AMD 14 192 Current 1
32-coreAMDEpyc 19200000000 2017 AMD 14 768 Current 1
AppleA11Bionic(hexa-coreARM64"mobileSoC") 4300000000 2017 Apple 10 89 Current 1
IBMz14 6100000000 2017 IBM 14 696 Current 1
POWER9 8000000000 2017 IBM 14 695 Current 1
IBMz14StorageController 9700000000 2017 IBM 14 696 Current 1
XboxOneX(ProjectScorpio)mainSoC 7000000000 2017 Microsoft/AMD 16 360 Current 1
Centriq2400 18000000000 2017 Qualcomm 10 398 Current 1
. . 2019 . . . Current 1
;
run;

proc print data=Moore;
run;

data AmdMot;
set Moore;
if Designer ^="AMD" AND Designer ^="Motorola" then delete;
run;

proc print data=AmdMot;
run;


/*
proc glm data = Moore;
class Designer;
model TransistorCount = Designer;
means Designer / HOVTEST= BF Welch;
contrast 'Compare transistors for designers amd and motorolla' Designer 1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0/e;
estimate 'Compare transistors for designers amd and motorolla' Designer 1 0 0 0 0 0 0 0 0 0 0 0 -1 0 0 0 0 0 0 0 0/e;
run;*/

data lMoore;
set Moore;
lTrans = log(TransistorCount);
run;


proc sgscatter data = Moore;
plot TransistorCount*Year;
run;

proc sgscatter data = lMoore;
plot lTrans*Year;
run;

data lMoore0;
set LMoore;
if PastCurrentInd =1 then delete;
run;


proc glm data=lMoore0 plots=all alpha=.1;
model lTrans= Year / clparm solution;
run;

proc glm data=lMoore plots=all alpha=.1;
class PastCurrentInd;
model lTrans= Year | PastCurrentInd / clparm solution p cli;
run;





