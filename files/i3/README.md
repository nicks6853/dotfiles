# i3/i3-gaps setup

Copy the config file into ~/.config/i3/ or run the script in ../../scripts/

Follow the following instructions to install i3 and i3-gaps

## Install i3
1 - Run: sudo apt-get install -y i3
2 - Log out and log back in to i3
 
## Installing i3-gaps

1 - Install the following dependencies

sudo apt-get install -y libxcb1-dev libxcb-keysyms1-dev \
                        libpango1.0-dev libxcb-util0-dev \
                        libxcb-icccm4-dev libyajl-dev \
                        libstartup-notification0-dev libxcb-randr0-dev \
                        libev-dev libxcb-cursor-dev libxcb-xinerama0-dev \
                        libxcb-xkb-dev libxkbcommon-dev \
                        libxkbcommon-x11-dev autoconf libxcb-xrm0 \
                        libxcb-xrm-dev automake libsnack2-dev \
                        libxcb-shape0-dev autoconf libev-dev \
                        build-essential git

2 - Clone the repository
cd ~/Downloads
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps

3 - Compile and install
autoreconf --force --install # This may give you some weird error about gnu-make, just ignore it
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make && sudo make install

4 - Reload the config using <mod>+<shift>+<R>

Change the gaps by using <mod>+<shift>+<G>, then <o> or <i> to change inner or outer gaps. Press <shift>+<+> or <shift>+<-> to set the gaps to your liking
