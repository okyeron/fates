# Fates - Troubleshooting

### Etcher doesn't work for me

You can also try [ApplePiBaker](https://www.tweaking4all.com/hardware/raspberry-pi/applepi-baker-v2/) if you're on MacOS. Otherwise you may be looking at various arcane `dd` commands.

### Power
- Be sure you are using a good power supply. The Pi 3b+ needs a 5V 2.5A power supply. The Pi 4 requires a 5V 3A power supply. Buy one of the official Raspberry Pi power supplies if you're not sure.

- Be sure you're using a good quality USB-C cable (and it's not just a "charging" cable)

- DO NOT TRY TO POWER FATES FROM YOUR LAPTOP USB-C Ports. Use a dedicated 3A power supply.  

- [Check your input voltages](hardware/Build.md#tip---test-voltage)

- `SUPERCOLLIDER FAIL` error on boot: This happens because the Jack Audio system is not starting properly. A number of things can cause this. There is a information and support thread on the "lines" forum [here](https://llllllll.co/t/fates-a-diy-norns-dac-board-for-raspberry-pi/22999?u=okyeron)

### Audio tests

SSH to the pi/fates to conduct these tests. Have your audio outputs and inputs connected to speakers/mixer and a sound source.  

A low level test…  
Firstst stop jack, so we can test the DAC directly with ALSA

`sudo systemctl stop norns-jack.service`  

Now use `aplay` to play a wave file.

`aplay ~/dust/audio/common/waves/01.wav`
this should play a simple clean bell tone

An alternate test is speaker-test  
`speaker-test -t wav -c 2 -l 3 -D hw:0,0`

This will play a female voice saying "front right" and "front left" in each channel 3 times. 

Record 15 seconds of audio from the inputs and save to a .wav file 
`arecord -f dat -vv -V stereo -d 15 ~/audio-test.wav`

Play back the same audio file  
`aplay -vv -V stereo ~/audio-test.wav`

`sudo reboot` to get things back to normal. 


###[Raspberry Pi LED status messages](https://elinux.org/R-Pi_Troubleshooting#Red_power_LED_is_on.2C_green_LED_does_not_flash.2C_nothing_on_display)

### FAQ

See [Frequently Asked Questions](FAQ.md) for other general info