# Fates DAC board for Raspberry Pi

Fates is an audio and UI platform for Raspberry Pi 3 Model B+ and Pi 4 Model B that provides a stereo audio codec with headphone driver, 3 (or 4) encoders, 3 buttons, a 128x64 OLED display, 2x audio ins, and 2x audio outs. 

Fates is fully compatible with the [monome norns](<https://github.com/monome/norns>) software ecosystem. A “DIY norns” if you like. Once installed, Fates can be used with the primary norns codebase, without any branches or mods.

Fates can also be used directly with Orac 2.0 (puredata) and also with other Raspberry Pi audio projects like PatchboxOS, etc.

NOTE - this install and norns software has been tested mostly on the Pi3b+ and Pi4b. It may not work perfectly on older/slower Pi models (3b, etc.) and may need different configuration. 

### Specs:

- WM8731 stereo audio codec with headphone driver
- NHD-2.7-12864WDW3 128x64 grayscale OLED display
- 3 pushbuttons
- 3 rotary encoders (optional 4th encoder for Orac or other software)
- 2x 1/8in inputs
- 2x 1/8in outputs
- 1/8in stereo headphone out

Fates was designed for Raspberry Pi 3 Model B+ and Raspberry Pi 4 Model B. It’s not been performance tested with earlier Raspberry PI models.

For Raspberry Pi 4, Fates includes a USB-C power jack which fixes the Pi4 issue with "e-marked" USB-C cables not powering the device.

Fates can be powered either from it's own USB-C power jack, or the Raspberry Pi power jack (but NOT both).

![<fates pcb top>](<hardware/fates1.8.1_top.png>)

## BOM and Build 

[BOM](hardware/BOM.md)  

[BOM - Thru-hole only](hardware/BOM-thruhole.md)  (for SMD assembled boards)

[Build Guide](hardware/Build.md)



## Install instructions

- [Installing Fates 1.8+ from disk image](https://github.com/okyeron/fates/blob/master/install/norns/Norns_disk_image_install.md) **(recommended)**  

- [Installing Norns on Fates  1.8+ (Full Install Procedure)](https://github.com/okyeron/fates/blob/master/install/norns/Norns_install_instructions_1.8.md)

- [Installing Orac](https://github.com/okyeron/fates/blob/master/install/orac/README.md) 


## UART

Fates includes UART pins broken out for a serial connection to another computer using a UART-USB cable.

For example - the [Adafruit 954 cable](https://www.adafruit.com/product/954):
- white lead TX
- green lead RX
- black lead GND
- ***red lead (5v) from the UART cable is not connected on Fates***

Then connect using `screen`

  `screen /dev/cu.usbserial* 115200`

If this does not work, try swapping TX and RX