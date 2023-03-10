#!/bin/bash

# install qsstv tool and all of its modules
sudo apt install qsstv
pactl load-module module-null-sink sink_name=virtual-cable
#This command will print it's pactl module id in the
#terminal if it was created succesfully. Provided there were no errors reported, 
#you can ignore the number printed out by pactl. Although Pulseaudio can best be 
#tweaked from command line, I find the pavucontrol GUI very handy and a real time saver. Run it as:
pavucontrol
