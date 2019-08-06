# Fates DAC board for raspberry pi

# Orac setup

## Linux & Kernel

### Run updates install git, build dependencies, and compile the linux kernel

This installs some required packages and builds the Raspberry Pi kernel modules. 

	sudo apt-get update
    sudo apt-get dist-upgrade -y
    sudo apt-get install vim git bc i2c-tools -y
    
    git clone https://github.com/okyeron/fates.git

for pi3  

    cd /home/pi/fates/install/orac/scripts && ./fates_prepare_rpi3buster.sh

or for pi4

    cd /home/pi/fates/install/orac/scripts && ./fates_prepare_rpi4.sh


### Testing the ssd1322 OLED
Now pi're going to test the OLED display. If your soldering is fine and if the kernel has been built correctly, you should see the console displayed on the OLED screen but first pi need to do this :


    sudo modprobe fbtft_device custom name=fb_ssd1322 width=128 height=64 speed=16000000 gpios=reset:4,dc:17 rotate=180
    con2fbmap 1 1
    
You can also use `lsmod` to check if the `fbtft_device` has loaded properly. Which should look something like:

	fb_ssd1322             16384  0
	fbtft_device           49152  0
	fbtft                  45056  2 fbtft_device,fb_ssd1322

`con2fbmap 1 0` will map the console back to HDMI (fb0) if you need that.
    
Note - The OLED will continue to display whatever is on it until you reboot again.

## Compile overlays for buttons, encoders and OLED
```
sudo dtc -W no-unit_address_vs_reg -@ -I dts -O dtb -o /boot/overlays/fates-buttons-encoders.dtbo /home/we/fates/overlays/fates1.7-buttons-encoders-overlay.dts
sudo dtc -W no-unit_address_vs_reg -@ -I dts -O dtb -o /boot/overlays/fates-buttons-4encoders.dtbo /home/we/fates/overlays/fates1.7-buttons-4encoders-overlay.dts
sudo dtc -W no-unit_address_vs_reg -@ -I dts -O dtb -o /boot/overlays/fates-ssd1322.dtbo /home/we/fates/overlays/fates1.7-ssd1322-overlay.dts
```
Update system files for audio, etc.
```
sudo cp -f /home/we/fates/install/norns/files/raspi-blacklist.conf /etc/modprobe.d
sudo cp -f /home/we/fates/install/norns/files/asound.conf /etc
sudo cp -f /home/we/fates/install/norns/files/alsa.conf /usr/share/alsa
```

pi3

    sudo cp -f /home/we/fates/install/norns/files/config.txt /boot/config.txt

pi4

    sudo cp -f /home/we/fates/install/norns/files/config4.txt /boot/config.txt



## Orac

```
cd ~
git clone https://github.com/TheTechnobear/Orac.git
```