## Fates 1.8+ Build

This is an intermediate to advanced build. If you've not soldered a TSSOP chip before (the DAC), this build may be challenging. Seek assistance if possible.

Everything is marked on the pcb, but if you need help, please see below for parts placement  


### DAC

Solder the DAC first. Use flux. Google some videos if you're not sure how best to solder it.
<img src="buildpix/dac.png" alt="dac" width="720" height="480" />


### Voltage regulator
Do the little voltage regulator next and then check your work on all those tiny pins with a loupe/magnifier.

<img src="buildpix/vreg.png" alt="vreg" width="720" height="480" />



### 100n capacitors  
<img src="buildpix/100n.png" alt="100n capacitors" width="720" height="480" />

### 220p capacitors  
<img src="buildpix/220p.png" alt="220p capacitors" width="720" height="480" />

### 18p capacitors  
<img src="buildpix/18p.png" alt="100n capacitors" width="720" height="480" />

### 100R resistors  
<img src="buildpix/100R.png" alt="100R resistors" width="720" height="480" />

### 220R resistors  
<img src="buildpix/220R.png" alt="220R resistors" width="720" height="480" />

### 2.2K resistors  
<img src="buildpix/2k2.png" alt="2k2 resistors" width="720" height="480" />

### 5.1K resistors  
<img src="buildpix/5k1.png" alt="5k1 resistors" width="720" height="480" />

### 5.6K resistors  
<img src="buildpix/5k6.png" alt="5k6 resistors" width="720" height="480" />

### 10K resistors  
<img src="buildpix/10k.png" alt="10k resistors" width="720" height="480" />

### 47K resistors  
<img src="buildpix/47k.png" alt="47k resistors" width="720" height="480" />


### Crystal
Save the crystal for last of the smd stuff since it's big and gets in the way of soldering the smaller parts.
<img src="buildpix/crystal.png" alt="crystal" width="720" height="480" />


## USB-C Jack 

The pins here are quite small and close together. Use flux!

Be aware of the routing on the USB Jack pins. Some pins are tied together, so don't be alarmed if your soldering looks bridged on the diagonals.  

<img src="buildpix/fates_usbjack.png" alt="USB Jack" width="275" height="473" />
<img src="buildpix/fates_usb_soldered.jpg" alt="USB Soldering" width="275" height="473" />


## TIP - Test voltage

Once the USB-C jack is attached, check USB-C power input voltage levels. I suggest doing this __before__ you attach the pi. There's a 5v/GND header pin holes right near the voltage regulator which is great for testing voltage (+5v).


## Thru-hole capacitors

These all attach from the bottom. Values are marked on the board. 

## Switches (buttons)

Pin 1 is marked on the bottom of the switches. Pin 1 on the pcb is the lower right corner - there's a very small dot there.

<img src="buildpix/buttons.png" alt="buttonss" width="720" height="480" />

## Audio jacks

Audio jacks mount __from the bottom__

NOTE - if you use the CUI MJ-3536 jacks from Mouser, you may need to trim or file the pins to fit in the pcb. The CUI jack pins are just a tiny bit wider than the PJ302M jacks.

## Headers

The 2x20 (for the pi) goes in from the bottom.

The 1x20 (for the display) goes in from the top.

## Display header pins

NOTE - Don't solder the display directly to the Fates pcb. Use the low profile header listed in the BOM. You won't want to desolder 20 pins to remove it if something goes wrong with the display.

I use the following method for the display pins - insert the long end of the header pins from the top of the display and then solder them in place from the bottom. Then clip the short header pins from the top.

This ends up with about 6mm between the main board and the display carrier board. You could trim the pins if you want the display to sit lower. My case designs include a 6mm standoff for this mounting technique.

![<display_pins>](<buildpix/display_pins.jpg> "display pins")
![<display_pins2>](<buildpix/display_pins2.jpg> "display pins")

## Encoders

Do these last. Don't worry about mounting nuts/washers

