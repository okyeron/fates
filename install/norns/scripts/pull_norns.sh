cd ~
cd /home/we/norns
git pull
sudo cp -f /home/we/fates/install/norns/files/crone/wscript /home/we/norns/crone/wscript
./waf configure
./waf
sed -i '1s/.*/191230/' /home/we/version.txt