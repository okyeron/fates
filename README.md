# Fates DAC board for raspberry pi

Fates is a pcb add-on board for Raspberry PI 3 Model B+ that provides a stereo audio codec with headphone driver, 3 encoders, 3 buttons, and a grayscale display. It’s fully compatible with [monome norns](<https://github.com/monome/norns>) software. A “DIY norns” if you like.

![<fates pcb top>](<hardware/fates1.5-top.png>)

## Build and BOM

BOM coming soon

| Mouser  | QTY | Part | Value | Package | Desc | LINK |
|-----|--|-----|-----|-----|-----|------|
||3|R1 R2 R3|10k|0805||
||2|R5 R16|100R|0805||
||2|R7 R8|2.2K|0805||
||4|R4 R20 R22 R26|5.6K|0805||
||4|R6 R18 R32 R33|47K|0805||
||2|C13 C14|18p|0805||
||2|C8 C17|220p|0805||
||7|C1 C6 C11 C22 C23 C25 C27|100n|C0805||
|710-860020672005|4|C9 C7 C4 C12|1uF Electrolytic|11mm|||
|667-ECE-A1VKS100|3|C2 C3 C10|10uF Electrolytic|11mm|||
|667-ECA-0JM221B|2|C15 C16|220uF Electrolytic|11mm|||
|ADP150AUJZ-3.3-R7|1|ADP150-3.3|ADP150AUJZ-3.3-R7|||
|238-WM8731SEDS/RV|1|U1|WM8731SEDS/V|SSOP28||
|815-ABLS2-12.2-D4Y-T|1|Y1|12.288MHz|HC49UP||
|652-PEC11R-4015F-N24|3|ENC1 ENC2 ENC3|ENC_BOURNS_PEC11|PEC11||
|NHD-2.7-12864WDW3|1|SSD1322|NHD-2.7-12864WDW3|||
|806-STX-3100-3CB|1|STX3100-5CB|STEREOJACK|STX3100||
||4|Z5 Z6 Z7 Z8|PJ302M2|PJ302M||
|490-MJ-3536|0||alternate jack - CUI MJ-3536|||
|517-929984-01-20-RK|1||1x20 low profile female header for display|||
|485-2222|1||2x20 GPIO female header for Raspberry pi||Adafruit Part # 2222|
||1|PCB1|RPI3 b+|RPI3|Device for Raspberry Pi 3 board |
|5GSH920Q|3|S1 S2 S3|5G MEC switch - Quiet|||
||0|I2C-V|1X4 header|1X04-BIG|4-pin connector|

## Install instructions

- [Installing Norns on fates 1.2](https://github.com/okyeron/fates/blob/master/install/norns/Norns_install_instructions_1.2.md)
- [Installing Norns on fates 1.5](https://github.com/okyeron/fates/blob/master/install/norns/Norns_install_instructions_1.5.md)
- Installing Orac

## UART

Using the Adafruit 954 cable:
- white lead TX
- green lead RX
- black lead GND
- ***DO NOT connect the red lead if the Pi is powered from USB !***

  `screen /dev/cu.usbserial* 115200`
