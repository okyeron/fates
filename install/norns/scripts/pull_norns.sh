cd ~
cd /home/we/norns
git pull
sudo cp -f /home/we/fates/install/norns/files/crone/wscript /home/we/norns/crone/wscript
./waf configure
./waf
echo '191230' >> version.txt