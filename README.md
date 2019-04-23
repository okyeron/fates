# Fates DAC board for raspberry pi

## Build and BOM

BOM coming soon

## Install instructions
These install instructions have been tested and are provided for information purpose only.
- [Installing Norns](install/Install_instructions.md)


## UART

Using the Adafruit 954 cable:
- white lead TX
- green lead RX
- black lead GND
- ***DO NOT connect the red lead if the Pi is powered from USB !***

  `screen /dev/cu.usbserial* 115200`
