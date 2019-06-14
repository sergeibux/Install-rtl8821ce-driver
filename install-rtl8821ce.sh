#!/bin/sh

echo '> install headers for your kernel :' $(uname -r)
apt-get install linux-headers-$(uname -r) build-essential > install-rtl8821ce.log

echo '> install gcc & make & dkms-install'
apt-get install gcc dkms-install >> install-rtl8821ce.log

echo "> clone the git from Toma Pinho's Github"
git clone https://github.com/tomaspinho/rtl8821ce.git >> install-rtl8821ce.log

echo 'enter directory'
cd rtl8821ce/ >> install-rtl8821ce.log

echo '> build sources'
make >> install-rtl8821ce.log
make install >> install-rtl8821ce.log

echo '> allow execute dkms-install & dkms-remove'
chmod +x dkms-install.sh >> install-rtl8821ce.log
chmod +x dkms-remove.sh >> install-rtl8821ce.log

echo '> execute dkms-install'
dkms-install

echo '> activate the new driver'
modprobe -a 8821ce

echo '\tJob is done ;)'
echo "\tIf it doesn't work, you can take a look on the logfile : install-rtl8821ce.log and contact sertux.dev@gmail.com for more help."
echo '\tThanks to Toma Pinho for the sources' 
echo '\tNow, just reboot (\e[01;41msudo reboot\e[0;m) & \e[01;05mENJOY ;)\e[0;m'
