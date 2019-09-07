## Fates 1.8+ BOM

Some parts are listed with a zero quantity. This are meant to be alternates (and should be marked with `ALT`). Choose what works best for you.

PJ302M jacks are available from [Thonk](https://www.thonk.co.uk/shop/3-5mm-jacks/ ), [Synthcube](https://synthcube.com/cart/3-5mm-mono-jack-pj302m-rt-angle-hex-nut) and [Modular Addict](https://modularaddict.com/pj302m-jacks) among other sources. Or you can get the alternate CUI MJ-3536 jack listed below from Mouser.

Raspberry Pi 3B+ or 4B can be purchased from a number of sources such as [PiShop.us](https://www.pishop.us/product/raspberry-pi-4-model-b-1gb/), [Adafruit](https://www.adafruit.com/product/3775?src=raspberrypi), [CanaKit](https://www.canakit.com/raspberry-pi-3-model-b-plus.html?cid=usd&src=raspberrypi&src=raspberrypi), [Element14](http://www.newark.com/49AC7637?src=raspberrypi), etc.

ENC4 is optional and is not functional for norns right now. If you want to use Orac later, get 4 encoders.

| Mouser  | QTY | Part | Value | Package |
|-----|:--:|-----|-----|-----|
|603-AC0805FR-07100RL|2|R5 R16|100R|0805|
|603-RC0805FR-07220RL|4|R9 R10 R11 R12|220R|0805|
|603-RC0805FR-072K2L|2|R7 R8|2.2K|0805|
|603-RC0805FR-075K1L|2|R20 R21|5.1K|0805|
|279-CRGCQ0805F5K6|4|R4 R20 R22 R26|5.6K|0805|
|603-RC0805FR-0710KL|3|R1 R2 R3|10k|0805|
|RC0805FR-0747KL|4|R6 R18 R32 R33|47K|0805|
|603-CC805JRNPO9BN180|2|C10 C11|18p|0805|
|710-885012207082|2|C8 C9|220p|0805|
|80-C0805C104J5RACLR|7|C1 C2 C3 C4 C5 C6 C7|100n|0805|
|710-860020672005|4|C12 C13 C14 C15|1uF Electrolytic|11mm|
|667-ECE-A1VKS100|3|C19 C20 C21|10uF Electrolytic|11mm|
|667-ECA-0JM221B|2|C17 C18|220uF Electrolytic|11mm|                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
|ADP150AUJZ-3.3-R7|1|ADP150-3.3|ADP150AUJZ-3.3-R7||
|238-WM8731SEDS/RV|1|U1|WM8731SEDS/V|SSOP28||
|815-ABLS2-12.2-D4Y-T|1|Y1|12.288MHz|HC49UP||
|652-PEC11R-4015F-N24|3|ENC1 ENC2 ENC3 (ENC4)|15mm Flatted shaft||
|652-PEC11R-4015K-N24|0|ALT ENC1 ENC2 ENC3 (ENC4)|15mm Knurled shaft||
|652-PEC11R-4020F-N24|0|ALT ENC1 ENC2 ENC3 (ENC4)|20mm Flatted shaft||
|NHD-2.7-12864WDW3|1|SSD1322|NHD-2.7-12864WDW3|
|490-SJ1-3523N|1|CUI_SJ1-3523N|STEREOJACK Headphone||
||4|Z5 Z6 Z7 Z8|PJ302M2 1/8in mono jack|PJ302M|
|490-MJ-3536|0| ALT |alternate 1/8in jack - CUI MJ-3536||
|517-929984-01-20-RK|1||1x20 low profile female header for disp||
|855-M20-9992045|1||1x20 male pin header for disp (gold)||
|855-M20-9992046|0 ALT ||1x40 male pin header for disp (tin)||
|485-2222|1||2x20 GPIO female header for RasPi|Adafruit Part # 2222|
|649-10027011-106HLF|1||UART 6 pin header||
|806-KUSBX-SLCS1N14-B|1||USB C jack|** See note|
|5GTH920|3|S1 S2 S3|5G MEC switch - Clicky||
|5GTH920Q|0|S1 S2 S3 ALT|5G MEC switch - Quiet||
|642-1US09|3| |5G MEC switch caps black||
|642-1US03|0| ALT |5G MEC switch caps gray||
|642-1DS09|0| ALT |5G MEC switch caps black - rounded||
||1| |RPI3 b+||
||0| |RPI4 b||

\** The USB-C jack can be considered optional. You can power everything directly from the Raspberry Pi's own power input OR the Fates USB-C jack (DO NOT TRY TO POWER BOTH!)

**[A mouser cart](https://www.mouser.com/ProjectManager/ProjectDetail.aspx?AccessID=bdba42bdf9 )** is setup with these parts. **Audio jacks are NOT INCLUDED in this cart** (see note above). If you want them from Mouser order 4 of 490-MJ-3536

Spacers/screws are also not included in this cart. There is a [separate cart for spacers](https://www.mouser.com/ProjectManager/ProjectDetail.aspx?AccessID=367d290c06) if you need them.

You might need to adjust order quantities, get knurled encoders, or get clicky buttons instead of quiet. So be sure to check part numbers and availability before ordering. NOTE - some parts may be out of stock. See the alternates listed above for other choices.

Spacers/screws - I use 2.5mm size screws and spacers. 3mm should work as well.

I'm still getting this sorted out but here's my spacer list. This may also be to taste if you solder the display header closer to the main board.

|   | qty | height |  | location  |
|-----|--|-----|-----|-----|
|[761-M2106-2545-AL](http://www.mouser.com/Search/ProductDetail.aspx?R=761-M2106-2545-AL)|2-4*|11mm|M-F|Right side pi|
|[855-R25-3000302](http://www.mouser.com/Search/ProductDetail.aspx?R=855-R25-3000302)|2-4*|3mm|M-F|Right side pi bottom|
|[761-M1257-2545-AL](http://www.mouser.com/Search/ProductDetail.aspx?R=761-M1257-2545-AL)|5|10mm|M-M|top corners|
|[761-M2111-2545-AL](http://www.mouser.com/Search/ProductDetail.aspx?R=761-M2111-2545-AL)|4|16mm|M-F|left/back side|
|[761-M1252-2545-AL](http://www.mouser.com/Search/ProductDetail.aspx?R=761-M1252-2545-AL) / [M1253-2545-AL](http://www.mouser.com/Search/ProductDetail.aspx?R=M1253-2545-AL)|2-3*|5mm or 6mm|M-M|under oled display corners|
||11||5-6mm long|2.5mm rack screws|

\* You don't really need standoff/spacers on the left side of the pi since the gpio header supports it there.

### encoder knobs:

 https://store.djtechtools.com/products/chroma-caps-knobs-and-faders  
 https://synthcube.com/cart/synth-diy/parts/knobs/rogan-series-p-knobs  
 https://modularaddict.com/parts/knobs/pt2d-knob  
 https://modularaddict.com/parts/knobs/albs-midibox-knobs  
 https://modularaddict.com/parts/knobs/reanp670d-knobs  