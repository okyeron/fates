# Fates DAC board for raspberry pi

## Build and BOM

BOM coming soon

## Install instructions

- [Installing Norns](https://github.com/okyeron/fates/install/Norns_install_instructions.md)
- Installing Orac

## UART

Using the Adafruit 954 cable:
- white lead TX
- green lead RX
- black lead GND
- ***DO NOT connect the red lead if the Pi is powered from USB !***

  `screen /dev/cu.usbserial* 115200`
