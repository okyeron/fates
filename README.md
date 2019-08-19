# Fates DAC board for raspberry pi

Fates is a pcb add-on board for Raspberry Pi 3 Model B+ and Pi 4 Model B that provides a stereo audio codec with headphone driver, 3 encoders, 3 buttons, and a ssd1322 grayscale display. It’s fully compatible with [monome norns](<https://github.com/monome/norns>) software. A “DIY norns” if you like. 

Fates can also be used for other Raspberry Pi audio projects including PatchboxOS, Orac, etc.

NOTE - the norns software has been tested mostly on the Pi 3B+. It may not work perfectly on older/slower Pi models (3B, etc.) and may need different configuration. 

![<fates pcb top>](<hardware/fates1.8_top.png>)

## Build and BOM

[BOM](hardware/BOM.md)


## Install instructions

- [Installing Norns on fates 1.7+](https://github.com/okyeron/fates/blob/master/install/norns/Norns_install_instructions_1.7.md)
- [Installing Orac](https://github.com/okyeron/fates/blob/master/install/orac/README.md) (work in progress) 


## UART

Using the [Adafruit 954 cable](https://www.adafruit.com/product/954):
- white lead TX
- green lead RX
- black lead GND
- ***DO NOT connect the red lead if the Pi is powered from USB !***

  `screen /dev/cu.usbserial* 115200`

If this does not work, try swapping TX and RX