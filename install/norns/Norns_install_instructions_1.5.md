
# Installing Norns on Fates
***Only for Fates v1.5 pcb or later***

## Preparing the Raspberry PI

### Download raspbian stretch lite
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
   
Or if you have a keyboard and HDMI monitor plugged into the pi, login and use `ifconfig` to get your IP address (you want the one for `wlan0`).

(Optional)
Then you can generate an SSH key (replace XX below with the IP of the RPI).  
Open a terminal and enter the following command (XX is the last two digits of the PI's IP).  
`ssh-keygen -R 192.168.1.XX`

Connect via SSH. `ssh pi@192.168.1.XX` The default password is ***raspberry***

### RPI adjustments
Enter the following commands in a terminal, edit if needed (country etc).

Note - a fair bit of this setup is to get the pi to behave exactly like a hardward norns unit (default username/password, etc.)

`sudo raspi-config nonint do_spi 0`  
`sudo raspi-config nonint do_expand_rootfs`  
`sudo raspi-config nonint do_hostname norns`  
`sudo raspi-config` (change wifi country in the "Localization" menu, this is crucial)  
`sudo su`  
`passwd pi` ***(sleep)***  
`sudo reboot`  
`ssh keygen -R norns.local`  (Optional)
`sudo passwd root` ***(sleep)***  
`sudo nano /etc/ssh/sshd_config` ***(uncomment the line for "PermitRootLogin" and change "prohibit-password" to "yes")***  
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

This builds the Raspberry Pi kernel so expect this to take an hour or more on an RPI 3B+.

Reminder: the password is now ***sleep***  

    ssh we@norns.local
	sudo apt-get update
    sudo apt-get dist-upgrade -y
    sudo apt-get install vim git bc i2c-tools -y
    
    git clone https://github.com/okyeron/fates.git
    cd /home/we/fates/install/norns/scripts && ./fates_prepare.sh


### Testing the ssd1322 OLED
Now we're going to test the OLED display. If your soldering is fine and if the kernel has been built correctly, you should see the console displayed on the OLED screen but first we need to do this :

    ssh we@norns.local
    sudo modprobe fbtft_device custom name=fb_ssd1322 width=128 height=64 speed=16000000 gpios=reset:4,dc:17
    con2fbmap 1 1
    
You can also use `lsmod` to check if the `fbtft_device` has loaded properly. Which should look something like:

	fb_ssd1322             16384  0
	fbtft_device           49152  0
	fbtft                  45056  2 fbtft_device,fb_ssd1322

`con2fbmap 1 0` will map the console back to HDMI (fb0) if you need that.
    
Note - The OLED will continue to display whatever is on it until you reboot again.

## Norns
    cd /home/we/fates/install/norns/scripts &&./fates_packages.sh

You will be disconnected and the device will reboot. When the pi has rebooted, reconnect via SSH.

    cd /home/we/fates/install/norns/scripts &&./fates_install.sh
Answer ***yes (y)*** to "enable realtime priority"

## Wifi network  

    ssh we@norns.local
    sudo apt install network-manager
    sudo cp /home/we/fates/install/norns/files/interfaces /etc/network/interfaces
    sudo mv /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant_bak.conf
    sudo reboot
 
After reboot, on the Raspberry pi, using the OLED screen navigate to SYSTEM > WIFI and add your network manually.

This is a bit of a hassle to do manually, but you only have to do it once and it should ensure your WIFI works properly from here on out.

## Audio configuration for 

    ssh we@norns.local
    amixer controls
    amixer cset numid=13 on #Output Mixer HiFi  
    amixer cset numid=4 on #line in  
    sudo alsactl store  
    amixer cset numid=3 0%

    sudo alsactl store



*These install instructions are based on the work of Tehn, Nordseele, The Technobear among others. Thank you!*
