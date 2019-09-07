# Fates DAC board for raspberry pi

Fates is a pcb add-on board for Raspberry Pi 3 Model B+ and Pi 4 Model B that provides a stereo audio codec with headphone driver, 3 encoders, 3 buttons, and a ssd1322 grayscale display. It’s fully compatible with [monome norns](<https://github.com/monome/norns>) software. A “DIY norns” if you like. 

Fates can also be used for other Raspberry Pi audio projects including PatchboxOS, Orac, etc.

NOTE - this install and norns software has been tested mostly on the Pi3b+ and Pi4b. It may not work perfectly on older/slower Pi models (3b, etc.) and may need different configuration. 

![<fates pcb top>](<hardware/fates1.8.1_top.png>)

## BOM and Build 

[BOM](hardware/BOM.md)  

[Build Guide](hardware/Build.md)



## Install instructions

- [Installing Fates 1.8+ from disk image](https://github.com/okyeron/fates/blob/master/install/norns/Norns_disk_image_install.md) **(recommended)**  

- [Installing Norns on Fates  1.8+ (Full Install Procedure)](https://github.com/okyeron/fates/blob/master/install/norns/Norns_install_instructions_1.8.md)

- [Installing Orac](https://github.com/okyeron/fates/blob/master/install/orac/README.md) (work in progress) 


## UART

Using the [Adafruit 954 cable](https://www.adafruit.com/product/954):
- white lead TX
- green lead RX
- black lead GND
- ***DO NOT connect the red lead if the Pi is powered from USB !***

  `screen /dev/cu.usbserial* 115200`

If this does not work, try swapping TX and RX