# Fates - Troubleshooting

### Power
- Be sure you are using a good power supply. The Pi 3b+ needs a 5V 2.5A power supply. The Pi 4 requires a 5V 3A power supply. Buy one of the official Raspberry Pi power supplies if you're not sure.

- DO NOT TRY TO POWER FATES FROM YOUR LAPTOP USB-C Ports. Use a dedicated 3A power supply.  

- [Check your input voltages](hardware/Build.md#tip---test-voltage)

- `SUPERCOLLIDER FAIL` error on boot: This happens because the Jack Audio system is not starting properly. A number of things can cause this. There is a information and support thread on the "lines" forum [here](https://llllllll.co/t/fates-a-diy-norns-dac-board-for-raspberry-pi/22999?u=okyeron)

### Audio tests

SSH to the pi to conduct these tests. Have your audio outputs and inputs connected to speakers/mixer and a sound source.  

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

### SLEEP

> when i go to SYSTEM - SLEEP. Fates didn’t go off, it stays on with ‘sleep’ dimmed on screen.

This is "normal" behavior. SLEEP is actually invoking the `sudo shutdown now` command, so the pi will shut off with this command. However, power is still going to the pi (red led will be lit) and to the display. Thus the display will continue to show the last thing on screen.

When you use SLEEP - Make sure you have a solid red indicator light on the pi (no flashing green) and then disconnect from power.

An inline usb power switch (like one from [CanaKit](https://www.canakit.com/raspberry-pi-4-on-off-power-switch.html)) is very handy to switch power off after shutdown.