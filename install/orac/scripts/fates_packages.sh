curl https://keybase.io/artfwo/pgp_keys.asc | sudo apt-key add -
echo "deb https://package.monome.org/ stretch main" | sudo tee /etc/apt/sources.list.d/norns.list

curl https://raw.githubusercontent.com/BlokasLabs/patchbox-os-gen/a84e48872d3988e5cfcad4d7fd13c6ae1fa560f3/stage3/00-configure-apt/files/blokas.gpg.key | sudo apt-key add -
echo "deb http://blokas.io/apt/ rpi main" | sudo tee /etc/apt/sources.list.d/blokas.list

sudo apt update -y



sudo apt install --no-install-recommends jackd2 -y
sudo apt-get install libboost1.62-dev -y
sudo apt-get install libjack-jackd2-dev -y
sudo apt install libmonome-dev -y
sudo apt install supercollider-common=1:3.9.10-0norns1 supercollider-language=1:3.9.10-0norns1 supercollider-server=1:3.9.10-0norns1 supercollider-supernova=1:3.9.10-0norns1 supercollider-dev=1:3.9.10-0norns1 -y
sudo apt install libnanomsg-dev liblua5.3-dev libudev-dev libevdev-dev liblo-dev libcairo2-dev liblua5.3-dev libavahi-compat-libdnssd-dev libasound2-dev -y
sudo apt install dnsmasq -y
sudo apt install sc3-plugins ladspalist -y
sudo apt install usbmount -y
sudo apt-get install alsa-utils -y
sudo apt-get install libi2c-dev -y


## NEED patch user first before installing mec/orac
sudo adduser patch
sudo usermod -a -G patch, adm, dialout, cdrom, audio, video, plugdev, games, users, input, netdev, spi, i2c, gpio patch

sudo apt install puredata mec orac -y

sudo cp -f /home/we/fates/install/norns/files/interfaces /etc/network
sudo cp -f /home/we/fates/install/norns/files/systemd-udevd.service /lib/systemd/system/
#sudo apt install network-manager
sudo reboot
