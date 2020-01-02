cd /home/we/norns
git pull
sudo cp -f /home/we/fates/install/norns/files/crone/wscript /home/we/norns/crone/wscript
sudo cp -f /home/we/fates/install/norns/files/191230/update.sh /home/we/norns/191230/update.sh
./waf configure
cd /home/we/norns/update/191230
./update.sh