#!/bin/bash
btrfs filesystem defragment -c -r /home
btrfs filesystem defragment -c -r /home/user
exit
btrfs filesystem defragment -c -r /bin
#btrfs filesystem defragment -c -r /boot
#btrfs filesystem defragment -c -r /dev
btrfs filesystem defragment -c -r /etc
btrfs filesystem defragment -c -r /lib
btrfs filesystem defragment -c -r /lib64
#btrfs filesystem defragment -c -r /media
btrfs filesystem defragment -c -r /opt
#btrfs filesystem defragment -c -r /proc
btrfs filesystem defragment -c -r /root
#btrfs filesystem defragment -c -r /run
btrfs filesystem defragment -c -r /sbin
btrfs filesystem defragment -c -r /srv
#btrfs filesystem defragment -c -r /sys
#btrfs filesystem defragment -c -r /tmp
btrfs filesystem defragment -c -r /var
btrfs filesystem defragment -c -r /usr
btrfs filesystem defragment -c -r /usr/bin
btrfs filesystem defragment -c -r /usr/games
btrfs filesystem defragment -c -r /usr/include
btrfs filesystem defragment -c -r /usr/lib
btrfs filesystem defragment -c -r /usr/local
btrfs filesystem defragment -c -r /usr/sbin
btrfs filesystem defragment -c -r /usr/share
btrfs filesystem defragment -c -r /usr/src
btrfs filesystem defragment   -r /var/backups
btrfs filesystem defragment -c -r /var/cache
btrfs filesystem defragment -c -r /var/lib
btrfs filesystem defragment -c -r /var/local
btrfs filesystem defragment -c -r /var/log
btrfs filesystem defragment -c -r /var/mail
btrfs filesystem defragment -c -r /var/opt
btrfs filesystem defragment -c -r /var/spool
btrfs filesystem defragment -c -r /var/tmp

