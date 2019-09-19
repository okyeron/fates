#!/bin/sh
echo Adding Monome apt repository...
curl https://keybase.io/artfwo/pgp_keys.asc | sudo apt-key add -
echo "deb https://package.monome.org/ stretch main" | sudo tee /etc/apt/sources.list.d/norns.list

echo Importing Blokas GPG public key...
wget -q -O - https://blokas.io/gpg.public.key | sudo apt-key add -
echo Adding Blokas apt repository...
sudo wget -q -O /etc/apt/sources.list.d/blokas.list https://blokas.io/blokas.list

echo Importing GPG public key for serialosc...
gpg --keyserver keyserver.ubuntu.com --recv DD9300F1
gpg --export --armor DD9300F1 | sudo apt-key add -
echo "deb http://ppa.launchpad.net/artfwo/monome/ubuntu bionic main" | sudo tee /etc/apt/sources.list.d/monome.list

echo Updating package list...
sudo apt-get update

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
sudo apt-get install amidiauto -y
sudo apt install serialosc -y


sudo cp -f /home/we/fates/install/norns/files/interfaces /etc/network
sudo cp -f /home/we/fates/install/norns/files/systemd-udevd.service /lib/systemd/system/
#sudo apt install network-manager
sudo reboot
