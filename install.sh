#!/bin/bash
if [ `whoami` != root ]; then
    sudo echo -e "\033[1;31mRun this script with root privileges!\033[00m"
	exit -1
fi

echo -e "\033[1;32m Copying the shuffle script and settings template to /usr/bin \033[00m"
cp plymouth_shuffle /usr/bin
cp plymouthd.defaults.main /usr/share/plymouth/
chown root:root /usr/bin/plymouth_shuffle
chown root:root /usr/share/plymouth/plymouthd.defaults.main
chmod +x /usr/bin/plymouth_shuffle
echo -e "\033[1;32m Installing systemd unit \033[00m"
cp plymouth_shuffle.service /etc/systemd/system/
chown root:root /etc/systemd/system/plymouth_shuffle.service
echo -e "\033[1;32m Enabling unit \033[00m"
systemctl enable plymouth_shuffle.service
echo
echo -e "\033[1;32m ---------------- \033[00m"
echo -e "\033[1;32m Use  \033[1;35m'systemctl disable plymouth_shuffle.service'\033[1;32m to disable the service.\033[00m"
echo -e "\033[1;32m Make sure 'splash' is added to your boot parameter.\033[00m"
echo -e "\033[1;32m E.g. :\033[00m"
echo -e "\033[1;35m linux	/boot/vmlinuz-linux root=UUID=aaaaaa-aaaaa-1234-aaaa-aaaaaaaaaaaa rw  loglevel=3 quiet splash\033[00m"
echo
echo -e "\033[1;32m Done\033[00m"

