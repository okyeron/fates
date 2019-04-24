# Fates DAC board for raspberry pi

# Orac setup

if using the ssd1322 oled display:

run `fates_prepare.sh` to compile linux

run the following
```
sudo cp -f /home/we/fates/install/norns/files/raspi-blacklist.conf /etc/modprobe.d
sudo cp -f /home/we/fates/install/norns/files/asound.conf /etc
sudo cp -f /home/we/fates/install/norns/files/alsa.conf /usr/share/alsa

# ??
sudo cp -f /home/we/fates/install/norns/files/config.txt /boot


# compile the overlays (buttons and encoders + ssd1322)
sudo dtc -W no-unit_address_vs_reg -@ -I dts -O dtb -o /boot/overlays/fates-buttons-encoders.dtbo /home/we/fates/overlays/fates1.4-buttons-encoders-overlay.dts
sudo dtc -W no-unit_address_vs_reg -@ -I dts -O dtb -o /boot/overlays/fates-ssd1322.dtbo /home/we/fates/overlays/fates1.4-ssd1322-overlay.dts
```

get patchboxOS source?

get orac source?
```
cd ~
git clone https://github.com/TheTechnobear/Orac.git
```