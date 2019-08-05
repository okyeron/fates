cd /home/we

git clone https://github.com/okyeron/norns-linux-bits.git
git clone --depth=1 https://github.com/raspberrypi/linux

cd ~/linux

cp /usr/src/linux-headers-$(uname -r)/Module.symvers .
cp /usr/src/linux-headers-$(uname -r)/.config .

cp ~/norns-linux-bits/drivers-staging-fbtft/* /home/we/linux/drivers/staging/fbtft/
cp ~/norns-linux-bits/arch-arm-configs/bcm2709_defconfig /home/we/linux/arch/arm/configs/bcm2709_defconfig
cp ~/norns-linux-bits/arch-arm-configs/bcm2711_defconfig /home/we/linux/arch/arm/configs/bcm2711_defconfig
cp ~/norns-linux-bits/.config /home/we/linux/.config

cd ~/linux
KERNEL=kernel7l
make bcm2711_defconfig

make modules_prepare
make menuconfig
##        Device Drivers  ---> Staging Drivers ---> Support for small TFT LCD display modules  --->
##        <M>   SSD1322 driver

make prepare

## compile the drivers    
make -C ~/linux SUBDIRS=drivers/staging/fbtft modules

## move the drivers    
sudo cp -v ~/linux/drivers/staging/fbtft/*.ko /lib/modules/$(uname -r)/kernel/drivers/staging/fbtft/

rm ~/.config

sudo reboot
