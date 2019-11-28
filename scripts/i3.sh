#!/bin/bash

# Copying config over
mkdir -p $HOME/.config/i3 # Ensure directory exists
cp ../files/i3/config $HOME/.config/i3/config
cp ../files/i3/wallpaper.jpg $HOME/Pictures/wallpaper.jpg

# Install the dependencies to build i3-gaps from source
sudo apt-get install -y i3 libxcb1-dev libxcb-keysyms1-dev \
                        libpango1.0-dev libxcb-util0-dev \
                        libxcb-icccm4-dev libyajl-dev \
                        libstartup-notification0-dev libxcb-randr0-dev \
                        libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
                        libxcb-xkb-dev libxkbcommon-dev \
                        libxkbcommon-x11-dev autoconf libxcb-xrm0 \
                        libxcb-xrm-dev automake libsnack2-dev \
                        libxcb-shape0-dev autoconf libev-dev \
                        build-essential git

# Clone the i3-gaps repository
git clone https://www.github.com/Airblader/i3 $HOME/Downloads/i3-gaps

cd $HOME/Downloads/i3-gaps

# Reconfigure to be able to build on Debian based OS
autoreconf --force --install

# Create build directory
rm -rf ./build
mkdir -p ./build && cd ./build

# Configure before building from source
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers

# Build using Make
make && sudo make install

# Copying config over
cd "$(dirname)"
mkdir -p $HOME/.config/i3 # Ensure directory exists
cp ../files/i3/config $HOME/.config/i3/config
cp ../files/i3/wallpaper.jpg $HOME/Pictures/wallpaper.jpg

echo "i3 Configured"

