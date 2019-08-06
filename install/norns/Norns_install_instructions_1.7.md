
# Installing Norns on Fates
***Only for Fates v1.7 pcb or later***

## Preparing the Raspberry PI

### Download Raspbian Buster Lite (for pi3 or pi4) 

https://www.raspberrypi.org/downloads/raspbian/  

### Flash raspbian lite to the sdcard
Use balenaEtcher - https://www.balena.io/etcher/ for this.

When etcher is finished it will unmount your SD card. Remove the SD card and re-insert/mount it in your computer for the next steps.

### SSH configuration

 Create a **wpa-supplicant.conf** file for your network and copy the file to the root of the ***boot*** volume

    country=US #(your country)
    update_config=1
    ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
    network={
      scan_ssid=1
      ssid="Name of your router"
      psk="Your key"
      key_mgmt=WPA-PSK
    }

Open a terminal and type paste the following commands, one line at a time:

    cd /Volumes && ls
    cd boot && touch ssh

Move the **wpa-supplicant.conf** file you've created to the root of the SD card and then unmount the sd card.

### Put the SD card in the Raspberry Pi and boot

Find the IP of your Raspberry Pi using a software like [Lanscan](https://itunes.apple.com/us/app/lanscan/id472226235) (on MacoS)
   
Or if you have a keyboard and HDMI monitor plugged into the pi, login and use `ifconfig` to get your IP address `inet` (you want the one listed under `wlan0`).

(Optional)
Then you can generate an SSH key (replace XX below with the IP of the RPI).  
Open a terminal and enter the following command (XX is the last two digits of the PI's IP).  
`ssh-keygen -R 192.168.1.XX`

Connect via SSH. `ssh pi@192.168.1.XX` The default password is ***raspberry***

### RPI adjustments
Enter the following commands in a terminal, edit if needed (country etc).

Note - a fair bit of this setup is to get the pi to behave exactly like a hardward norns unit (default username/password, etc.)

`sudo raspi-config nonint do_spi 0`  
`sudo raspi-config nonint do_i2c 0`  
`sudo raspi-config nonint do_expand_rootfs`  
`sudo raspi-config nonint do_hostname norns`  
`sudo raspi-config`  
    (change locale, timezone, and wifi country in the "Localization" menu)  
    (change password here as well to  ***(sleep)***  )

`sudo reboot`  

Note: if the following `@norns.local` addressing does not work for you, BonJour/ZeroConf may not be working on your system (it's not a default install on Windows). Use the IP address instead.

`ssh pi@norns.local`  
`sudo passwd root` ***(sleep)***  
`sudo nano /etc/ssh/sshd_config`  
 ***(uncomment the line for "PermitRootLogin" and change "prohibit-password" to "yes")***  
`sudo reboot`  

`ssh root@norns.local`  
`usermod -l we -d /home/we -m pi`  
`groupmod --new-name we pi`  
`exit`  
`ssh we@norns.local`  

`sudo passwd -l root` ***(sleep)***  
`sudo nano /etc/sudoers.d/010_pi-nopasswd` ***(change pi to we)***  
`sudo reboot`  

## Linux & Kernel

### Run updates install git, build dependencies, and compile the linux kernel

This installs some required packages and builds the Raspberry Pi kernel modules. 

Reminder: the password is now ***sleep***  

    ssh we@norns.local
	
	sudo apt update -y      
    sudo apt-get dist-upgrade -y
	sudo apt-get install git bc vim bison flex libssl-dev i2c-tools libncurses5-dev -y
	sudo apt-get install raspberrypi-kernel-headers
 	
Then reboot, reconnect and continue...  
    
    cd ~
    git clone https://github.com/okyeron/fates.git


on pi3/Buster 

    cd /home/we/fates/install/norns/scripts && ./fates_prepare_rpi3buster.sh

on pi4

    cd /home/we/fates/install/norns/scripts && ./fates_prepare_rpi4.sh

Answer `m` when prompted for new modules - specifically the SSD1322 module.

Or...  
if the install process shows the `menuconfig` interface:  
Navigate to enable the ssd1322 driver, check to be sure it's enabled with `<M>`
```
##        Device Drivers  ---> Staging Drivers ---> Support for small TFT LCD display modules  --->
##        <M>   SSD1322 driver
```    


### Testing the ssd1322 OLED
Now we're going to test the OLED display. If your soldering is fine and if the kernel has been built correctly, you should see the console displayed on the OLED screen but first we need to do this :

    ssh we@norns.local
    sudo modprobe fbtft_device custom name=fb_ssd1322 width=128 height=64 speed=16000000 gpios=reset:4,dc:17 rotate=180
    con2fbmap 1 1
    
You can also use `lsmod` to check if the `fbtft_device` has loaded properly. Which should look something like:

	fb_ssd1322             16384  0
	fbtft_device           49152  0
	fbtft                  45056  2 fbtft_device,fb_ssd1322

`con2fbmap 1 0` will map the console back to HDMI (fb0) if you need that.
    
Note - The OLED will continue to display whatever is on it until you reboot again.

## Norns

    cd /home/we/fates/install/norns/scripts &&./fates_packages.sh

Answer ***yes (y)*** to "enable realtime priority"

You will be disconnected and the device will reboot. When the pi has rebooted, reconnect via SSH.


pi3/Buster

    cd /home/we/fates/install/norns/scripts &&./fates_install_pi3buster.sh

pi4/Buster

    cd /home/we/fates/install/norns/scripts &&./fates_install_pi4.sh

## Wifi network  

Reconnect via SSH

    cd /home/we/fates/install/norns/scripts &&./fates_networkmanager.sh

Answer yes (Y) to install prompts.
 
After reboot, on the Raspberry pi, using the OLED screen navigate to SYSTEM > WIFI and add your network manually.

This is a bit of a hassle to do manually, but you only have to do it once and it should ensure your WIFI works properly from here on out.

## Audio configuration 

    ssh we@norns.local
    
    amixer controls
	amixer cset numid=1 123 #Master Playback Volume
    amixer cset numid=3 29  #Capture Volume
    amixer cset numid=4 on  #Line Capture Switch 
    amixer cset numid=7 0   #Sidetone Playback Volume
    amixer cset numid=13 on #Output Mixer HiFi  
    sudo alsactl store

you can also view these settings with

	alsamixer


## Norns documentation

https://monome.org/docs/norns/

Be sure to check out the section on the [web-based editor maiden](https://monome.org/docs/norns/#maiden). 

Maiden is extremely useful to get debug information if something is going wrong with the norns software. Its interface is arranged into a left sidebar FILE navigator and a right split editor, where the top is the EDITOR and the bottom is the REPL (read-eval-print-loop).


## Norns scripts  

You can find scripts/patches for norns on the [lines forum](https://llllllll.co/c/library)

Scripts are installed at `~/dust/code` The easiest way to install is by using `git clone` from the linux command line as most of the scripts are hosted on github.

for example

```
cd ~/dust/code
git clone https://github.com/justmat/foulplay.git
```
will install the Foulplay script by @justmat


## Norns extras

There are 2 extra scripts installed at in the `~/norns` directory - `restart.sh` and `stopall.sh`. These can be used to restart all of the norns software components or stop all those processes (matron, crone/supercollider, JACK, and maiden).


*These install instructions are based on the work of Tehn, Nordseele, Thetechnobear among others. Thank you!*
