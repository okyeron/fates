#init gpio

# turn analog gain stages to unity
# note this gain stage is only applicable to round 1 prototypes
# this will throw an error on others.
# Channel 0 0000 0000
#sudo i2cset -y 1 0x28 0x00
# Channel 1 0100 0000
#sudo i2cset -y 1 0x28 0x40

# input gain stage. the default is mute so we skip this. we let matron turn it on.
# but the values below are sane defaults otherwise (unity gain)
#sudo i2cset -y 1 0x29 0x00
#sudo i2cset -y 1 0x29 0x40

# unmute soundcard output
#amixer set Master 100% on

# enable headphone driver (let matron handle this)
#sudo i2cset -y 1 0x60 1 192    # enable HP outputs
#sudo i2cset -y 1 0x60 2 32     # unmute, set vol to -10db
#sudo i2cset -y 1 0x60 2 52     # unmute, set vol to 0.1db

# start norns
su we -c "cd /home/we/norns; ./start.sh;"

# start maiden
su we -c "cd /home/we/maiden; ./start.sh;"

# clean up stale wifi status from shutdown
echo stopped > $HOME/status.wifi
