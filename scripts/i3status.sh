#!/bin/bash 

sudo apt-get install -y compton hsetroot rxvt-unicode \
                        xsel rofi fonts-noto fonts-mplus \
                        xsettingsd lxappearance scrot viewnior

# Ensure directory exists
mkdir -p $HOME/.config/i3status
cp ../files/i3status/config $HOME/.config/i3status/config

