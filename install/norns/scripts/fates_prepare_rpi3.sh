cd /home/we

git clone https://github.com/okyeron/norns-linux-bits.git
git clone --depth 1 --branch rpi-4.14.y-rt https://github.com/raspberrypi/linux

cd ~/linux
git checkout 22bb67b8e2e809d0bb6d435c1d20b409861794d2
cp ~/norns-linux-bits/drivers-staging-fbtft/* /home/we/linux/drivers/staging/fbtft/
cp ~/norns-linux-bits/arch-arm-configs/bcm2709_defconfig /home/we/linux/arch/arm/configs/bcm2709_defconfig
cp ~/norns-linux-bits/arch-arm-configs/bcm2711_defconfig /home/we/linux/arch/arm/configs/bcm2711_defconfig
cp ~/norns-linux-bits/.config /home/we/linux/.config

cd ~/linux
export KERNEL=kernel7
make mrproper
make bcm2709_defconfig
make modules_prepare

make -j4 zImage modules dtbs
sudo make modules_install
sudo cp arch/arm/boot/dts/*.dtb /boot/
sudo cp arch/arm/boot/dts/overlays/*.dtb* /boot/overlays/
sudo cp arch/arm/boot/dts/overlays/README /boot/overlays/
sudo cp arch/arm/boot/zImage /boot/$KERNEL.img

sudo reboot
