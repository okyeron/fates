curl https://keybase.io/artfwo/pgp_keys.asc | sudo apt-key add -
echo "deb https://package.monome.org/ stretch main" | sudo tee /etc/apt/sources.list.d/norns.list

sudo apt update -y
sudo apt install --no-install-recommends jackd2 -y
sudo apt-get install libboost1.62-dev -y
sudo apt-get install libjack-jackd2-dev -y
sudo apt install libmonome-dev supercollider-language supercollider-server supercollider-supernova supercollider-dev -y
sudo apt install libnanomsg-dev liblua5.3-dev libudev-dev libevdev-dev liblo-dev libcairo2-dev liblua5.3-dev libavahi-compat-libdnssd-dev libasound2-dev -y
sudo apt install dnsmasq -y
sudo apt install sc3-plugins ladspalist -y
sudo apt install usbmount -y
sudo apt-get install alsa-utils -y
sudo apt-get install libi2c-dev -y

sudo cp -f /home/we/fates/install/norns/files/interfaces /etc/network
sudo cp -f /home/we/fates/install/norns/files/systemd-udevd.service /lib/systemd/system/
#sudo apt install network-manager
sudo reboot
