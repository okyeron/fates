# Fates - Frequently Asked Questions

### SLEEP

> when i go to SYSTEM - SLEEP. Fates does not turn off, it stays on with ‘sleep’ dimmed on screen.

This is "normal" behavior. SLEEP is actually invoking the `sudo shutdown now` command, so the pi will shut off with this command. However, power is still going to the pi (red led will be lit) and to the display. Thus the display will continue to show the last thing on screen.

When you use SLEEP - Make sure you have a solid red indicator light on the pi (no flashing green) and then disconnect from power.

An inline usb power switch (like one from [CanaKit](https://www.canakit.com/raspberry-pi-4-on-off-power-switch.html)) is very handy to switch power off after shutdown.

### Wake from SLEEP

The norns docs mention this:

> Hold K1 for three seconds. Be still, and norns will awaken.

This is a norns hardware only feature and will not work on Fates.

To turn Fates on, just plug into power (or use a switch as mentioned above)

Note - as with norns hardware - **For general shut down use the SLEEP menu function. This fully turns off the device with a proper software shutdown.**

### How do I update?

As of 12-30-2019 ***DO NOT*** run the on device SYSTEM > UPDATE from the norns menu. 

You will need to update manually. See [here for update info](https://github.com/okyeron/fates/releases)

