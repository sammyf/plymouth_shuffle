== Plymouth Shuffe ==

Changes the plymouth boot screen to a random theme from `/usr/share/plymouth/themes` after each successfull boot.

Execute `sudo ./install.sh` to install and enable the shuffler.

Use  `systemctl disable plymouth_shuffle.service` to disable the service.

Make sure 'splash' is added to your boot parameter. E.g. :

`linux	/boot/vmlinuz-linux root=UUID=aaaaaa-aaaaa-1234-aaaa-aaaaaaaaaaaa rw  loglevel=3 quiet splash`


