
# Installing Norns on Fates
***Fates v1.3 pcb only.***

## Preparing the Raspberry PI

### Download raspbian stretch lite
https://www.raspberrypi.org/downloads/raspbian/  

### Flash raspbian lite to the sdcard
Use balenaEtcher - https://www.balena.io/etcher/ for this.

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

Find the IP of your Raspberry Pi using a software like [Lanscan](https://itunes.apple.com/us/app/lanscan/id472226235) (on MacoS) and then 
   generate a key (replace XX with the IP of the RPI).  
Open a terminal and enter the following command (XX is the last two digits of the PI's IP).  
`ssh-keygen -R 192.168.1.XX`

Connect via SSH. `ssh pi@192.168.1.XX` The password is ***raspberry***

### RPI adjustments
Enter the following commands in a terminal, edit if needed (country etc).

`sudo raspi-config nonint do_hostname norns`  
`sudo raspi-config nonint do_spi 0`  
`sudo raspi-config nonint do_expand_rootfs`  
`sudo raspi-config` (change wifi country in the "Localization" menu, this is crucial)  
`sudo su`  
`passwd pi` ***(sleep)***  
`sudo reboot`  
`ssh keygen -R norns.local`  
`sudo passwd root` ***(sleep)***  
`sudo nano /etc/ssh/sshd_config` ***("PermitRootLogin" needs to be set to "yes" and uncomment the line)***  
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

### Run updates install git, build dependencies, etc
Reminder: the password is ***sleep***  

    ssh we@norns.local
	sudo apt-get update
    sudo apt-get dist-upgrade -y
    sudo apt-get install vim git bc i2c-tools -y
    
    git clone https://github.com/okyeron/fates.git
    cd /home/we/fates/install/norns/scripts && ./fates_prepare.sh


### Testing the ssd1322
Now we're going to test the display. If your soldering is fine and if the kernel has been built correctly, you should see the console displayed on the OLED screen but first we need to do this :

    sudo modprobe fbtft_device custom name=fb_ssd1322 width=128 height=64 speed=16000000 gpios=reset:4,dc:17
    con2fbmap 1 1

## Norns
    cd /home/we/fates/install/norns/scripts &&./fates_packages.sh

You will be disconnected and the device will reboot. Reconnect in a new window.  

    cd /home/we/fates/install/norns/scripts &&./fates_install_1.3.sh
Answer ***yes (y)*** to "enable realtime priority"

## Wifi network  
*Do this manually, too risky to put it in the script.*

    ssh we@norns.local
    sudo apt install network-manager
    sudo cp /home/we/fates/install/norns/files/interfaces /etc/network/interfaces
    sudo mv /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant_bak.conf

And reboot (with command line if possible).  
On the Raspberry pi, navigate to System -> Wifi and add your network manually.

## Audio configuration
*(this part needs to be tested once again)*

    ssh we@norns.local
    amixer controls
    amixer cset numid=13 on #Output Mixer HiFi  
    amixer cset numid=4 on #line in  
    sudo alsactl store  
    amixer cset numid=3 0%

    sudo reboot


*N.B: These install instructions are based on the work of Tehn, Nordseele, The Technobear among others. Thank you!*
