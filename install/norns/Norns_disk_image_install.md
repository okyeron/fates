# Installing from disk image
***For Fates v1.8 pcb or later***


### Download Fates disk image (for pi3 or pi4) 

For Raspberry Pi 3b+
[img file](https://archive.org/download/fates-pi3b-20191004/fates-pi3b-20191004.img)  (2.2GB)
[torrent link](https://archive.org/download/fates-pi3b-20191004/fates-pi3b-20191004_archive.torrent)

For Raspberry Pi 4b
[img file](https://archive.org/download/fates-pi4b-20191004/fates-pi4b-20191004.img) (2.2GB)
[torrent link](https://archive.org/download/fates-pi4b-20191004/fates-pi4b-20191004_archive.torrent)

Note:
the images above include norns version 190930 (norns 2.2.0)


### Flash disk image to the sdcard
Use balenaEtcher - https://www.balena.io/etcher/ 

When etcher is finished it will unmount your SD card. 

Remove the SD card and insert into your pi/fates and power it up.


## Wifi   

Use the norns menu to navigate to `SYSTEM > WIFI` and add your WiFi network manually.

Use the `ADD` option to choose your network and enter your password, etc.


## Set your timezone, wifi-country and expand filesystem

    sudo raspi-config
    
first go to `Localization Options` menu item and select `Change Timezone`  
then repeat with `Change WiFi Country`  

*** this next bit is super important ***

Then go to `Advanced Options` and select the first option to `Expand Filesystem`  
	
`Finish` and reboot (if not prompted).  

After these changes, Norns may start up with `NONE` listed at the top of the screen. This is normal. Just go to SELECT > AWAKE to start the Awake script.


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

There are 2 extra scripts installed at in the `~/` home directory - `norns-restart.sh` and `norns-stopall.sh`. These can be used to restart all of the norns software components or stop all those processes (matron, crone/supercollider, JACK, and maiden).


*These install instructions are based on the work of Tehn, Nordseele, Thetechnobear among others. Thank you!*
