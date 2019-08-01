cd ~
git clone https://github.com/monome/norns-image.git

sudo cp -f /home/we/fates/install/norns/files/setup.sh /home/we/norns-image
sudo cp -f /home/we/fates/install/norns/files/norns.target /home/we/norns-image/config
sudo cp -f /home/we/fates/install/norns/files/norns-matron.service-rpi3 /home/we/norns-image/config/norns-matron.service
sudo cp -f /home/we/fates/install/norns/files/norns-init.service /etc/systemd/system/
sudo cp -f /home/we/fates/install/norns/files/init-norns.sh /home/we/norns-image/scripts
#sudo cp -f /home/we/fates/install/norns/files/aliases.conf /lib/modprobe.d
sudo cp -f /home/we/fates/install/norns/files/raspi-blacklist.conf /etc/modprobe.d
sudo cp -f /home/we/fates/install/norns/files/asound.conf /etc
sudo cp -f /home/we/fates/install/norns/files/alsa.conf /usr/share/alsa

# compile the overlays (buttons and encoders + ssd1322)
sudo dtc -W no-unit_address_vs_reg -@ -I dts -O dtb -o /boot/overlays/fates-buttons-encoders.dtbo /home/we/fates/overlays/fates1.7-buttons-encoders-overlay.dts
sudo dtc -W no-unit_address_vs_reg -@ -I dts -O dtb -o /boot/overlays/fates-ssd1322.dtbo /home/we/fates/overlays/fates1.7-ssd1322-overlay.dts

cd ~
mkdir ~/.local/
mkdir ~/.local/share/
mkdir ~/.local/share/SuperCollider
mkdir ~/.local/share/SuperCollider/Extensions

cd /home/we/norns-image
./setup.sh

cd /home/we
git clone https://github.com/monome/norns.git
cd /home/we/norns
sudo cp -f /home/we/fates/install/norns/files/crone/wscript /home/we/norns/crone/wscript

# we need to run sclang
echo | sclang

./waf configure
./waf

cd /home/we/norns/sc && ./install.sh

sudo cp -f /home/we/fates/install/norns/files/matron.sh /home/we/norns/matron.sh
sudo cp -f /home/we/fates/install/norns/files/config.txt /boot/config.txt

cd ~
mkdir update
echo '190422' >> version.txt
mkdir dust
cd dust
mkdir data
mkdir audio
mkdir code
cd ~/dust/code
git clone https://github.com/monome/we.git
git clone https://github.com/tehn/awake.git
cd ~/dust/audio
sudo mv /home/we/fates/install/norns/files/common_audio.tar common_audio.tar
tar -xvf common_audio.tar
rm common_audio.tar
mkdir tape


cd ~
wget https://github.com/monome/maiden/releases/download/v0.13/maiden-v0.13.tgz
tar -xvf maiden-v0.13.tgz
rm maiden-v0.13.tgz

#sudo apt install network-manager
#sudo cp ~/norns-linux-bits/interfaces /etc/network/interfaces
#sudo mv /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant_bak.conf

sudo reboot
