# Fates DAC board for raspberry pi version 1.5

# Overlays and GPIO assignments

## Keys GPIO (v1.5)

- K1 : GPIO 24
- K2 : GPIO 25
- K3: GPIO 23


## Encoders GPIO  (v1.5)

- E1A : GPIO 5  
  E1B : GPIO 6  

- E2A : GPIO 13  
  E2B : GPIO 12  

- E3A : GPIO 27  
  E3B : GPIO 22

- E4A : GPIO 26  ( Not Functional Yet )
  E4B : GPIO 16  ( Not Functional Yet )

## OLED display  (v1.5)

- RES : GPIO 4
- DC : GPIO 17


## for reference (this is handled by install script)
```
# compile the overlays (buttons and encoders + ssd1322)
sudo dtc -W no-unit_address_vs_reg -@ -I dts -O dtb -o /boot/overlays/fates-buttons-encoders.dtbo /home/we/fates/overlays/fates1.5-buttons-encoders-overlay.dts
sudo dtc -W no-unit_address_vs_reg -@ -I dts -O dtb -o /boot/overlays/fates-ssd1322.dtbo /home/we/fates/overlays/fates1.5-ssd1322-overlay.dts
```
