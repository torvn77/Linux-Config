#!/usr/bin/env bash
#

command='subvolume create'
rootfs_patch=/mnt/
btrfs $command $rootfs_path/bin
chmod -c 755  $rootfs_path/bin

btrfs $command $rootfs_path/etc
chmod -c 755  $rootfs_path/etc

btrfs $command $rootfs_path/home
chmod -c 755  $rootfs_path/home

btrfs $command $rootfs_path/lib
chmod -c 755  $rootfs_path/lib

btrfs $command $rootfs_path/lib64
chmod -c 755  $rootfs_path/lib64

btrfs $command $rootfs_path/media
chmod -c 755  $rootfs_path/media

btrfs $command $rootfs_path/opt
chmod -c 755  $rootfs_path/opt

btrfs $command $rootfs_path/root
chmod -c 700 $rootfs_path/root

btrfs $command $rootfs_path/sbin
chmod -c 755  $rootfs_path/sbin

btrfs $command $rootfs_path/srv
chmod -c 755  $rootfs_path/srv

btrfs $command $rootfs_path/tmp
chmod -c 1777 $rootfs_path/tmp

#
btrfs $command $rootfs_path/usr
chmod -c 755  $rootfs_path/usr

btrfs $command $rootfs_path/usr/bin
chmod -c 755  $rootfs_path/usr/bin

btrfs $command $rootfs_path/usr/games
chmod -c 755  $rootfs_path/usr/games

btrfs $command $rootfs_path/usr/include
chmod -c 755  $rootfs_path/usr/include

btrfs $command $rootfs_path/usr/lib
chmod -c 755  $rootfs_path/usr/lib

btrfs $command $rootfs_path/usr/local
chown root:staff $rootfs_path/usr/local
chmod -c 2775 $rootfs_path/usr/local

btrfs $command $rootfs_path/usr/sbin
chmod -c 755  $rootfs_path/usr/sbin

btrfs $command $rootfs_path/usr/share
chmod -c 755  $rootfs_path/usr/share

btrfs $command $rootfs_path/usr/src
chmod -c 755  $rootfs_path/usr/src

#
btrfs $command $rootfs_path/var
chmod -c 755  $rootfs_path/var

btrfs $command $rootfs_path/var/backups
chmod -c 755  $rootfs_path/var/backups

btrfs $command $rootfs_path/var/cache
chmod -c 755  $rootfs_path/var/cache

btrfs $command $rootfs_path/var/lib
chmod -c 755  $rootfs_path/var/lib

btrfs $command $rootfs_path/var/local
chmod -c 2775 $rootfs_path/var/local
chown root:staff $rootfs_path/var/local

btrfs $command $rootfs_path/var/log
chmod -c 755  $rootfs_path/var/log

btrfs $command $rootfs_path/var/mail
chmod -c 2775  $rootfs_path/var/mail
chown root:mail $rootfs_path/var/mail

btrfs $command $rootfs_path/var/opt
chmod -c 755  $rootfs_path/var/opt

btrfs $command $rootfs_path/var/spool
chmod -c 755  $rootfs_path/var/spool

btrfs $command $rootfs_path/var/tmp
chmod -c 1777 $rootfs_path/tmp
