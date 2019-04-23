# Fates DAC board for raspberry pi

## Build and BOM

BOM coming soon

## Install instructions of specific environments
These install instructions have been tested and are provided for information purpose only.
- [Installing Norns](Install_instructions.md)


## Keys GPIO (v1.4)

- K1 : GPIO 24
- K2 : GPIO 25
- K3: GPIO 23


## Encoders GPIO  (v1.4)

- E1A : GPIO 5  
  E1B : GPIO 6  

- E2A : GPIO 13  
  E2B : GPIO 12  

- E3A : GPIO 27  
  E3B : GPIO 22

- E4A : GPIO 26  
  E4B : GPIO 16

## OLED display  (v1.4)

- RES : GPIO 4
- DC : GPIO 17


## UART

Using the Adafruit 954 cable:
- white lead TX
- green lead RX
- black lead GND
- ***DO NOT connect the red lead if the Pi is powered from USB !***

  `screen /dev/cu.usbserial* 115200`
