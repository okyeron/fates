# Fates DAC board for raspberry pi

Fates is a pcb add-on board for Raspberry Pi 3 Model B+ that provides a stereo audio codec with headphone driver, 3 encoders, 3 buttons, and a ssd1322 grayscale display. It’s fully compatible with [monome norns](<https://github.com/monome/norns>) software. A “DIY norns” if you like. 

Fates can also be used for other Raspberry Pi audio projects including PatchboxOS, Orac, etc.

![<fates pcb top>](<hardware/fates1.5-top.png>)

## Build and BOM

[BOM](hardware/BOM.md)


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
