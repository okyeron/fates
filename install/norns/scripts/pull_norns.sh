cd ~
cd /home/we/norns
git pull
sudo cp -f /home/we/fates/install/norns/files/crone/wscript /home/we/update/191230/norns/crone/wscript
./waf configure
./waf