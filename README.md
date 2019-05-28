# Fates DAC board for raspberry pi

## Build and BOM

BOM coming soon

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
