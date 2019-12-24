cd ~
cd /home/we/norns
sudo cp -f /home/we/fates/install/norns/files/crone/wscript /home/we/norns/crone/wscript
sudo cp -f /home/we/fates/install/norns/files/device/device_monitor.c /home/we/norns/matron/src/device/device_monitor.c
./waf configure
./waf