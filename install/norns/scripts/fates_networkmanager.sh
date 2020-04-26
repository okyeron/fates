cd /home/we
sudo apt install network-manager -y
sudo cp /home/we/fates/install/norns/files/interfaces /etc/network/interfaces
sudo cp /home/we/norns-image/config/network-manager/100-disable-wifi-mac-randomization.conf /etc/NetworkManager/conf.d/
sudo cp /home/we/norns-image/config/network-manager/101-logging.conf /etc/NetworkManager/conf.d/
sudo cp /home/we/norns-image/config/network-manager/200-disable-nmcli-auth.conf /etc/NetworkManager/conf.d/
sudo systemctl disable pppd-dns.service
sudo apt-get -y remove modemmanager

sudo mv /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant_bak.conf

sudo reboot