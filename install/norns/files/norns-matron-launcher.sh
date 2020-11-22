#!/bin/bash
framebuffer="/dev/fb0"
if [ -e /dev/fb1 ] ; then
  framebuffer="/dev/fb1"
fi
/home/we/norns/build/ws-wrapper/ws-wrapper ws://*:5555 /home/we/norns/build/matron/matron -f${framebuffer}


