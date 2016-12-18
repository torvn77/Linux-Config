#!/usr/bin/env bash
# /root/Scripts/import-key.sh

# linuxcnc.org key
apt-key adv --keyserver hkp://keys.gnupg.net --recv-key 3CB9FD148F374FEF
# buildbot.linuxcnc.org key
apt-key adv --keyserver hkp://keys.gnupg.net --recv-key EF1B07FEE0EE663E

# Tox key
#wget -qO - https://pkg.tox.chat/debian/pkg.gpg.key | apt-key add -
#wget -qO - http://download.opensuse.org/repositories/home:antonbatenev:tox/Debian_Stretch/Release.key | apt-key add -
#wget -qO - http://download.opensuse.org/repositories/home:antonbatenev:tox/Debian_8.0/Release.key | apt-key add -

# "Launchpad PPA for FreeCAD maintainers"
# https://launchpad.net/~freecad-maintainers/+archive/ubuntu/freecad-daily
apt-key adv --keyserver hkp://keys.gnupg.net --recv-key 005EAE8119BB5BCA
                                                        

apt-get install apt-transport-https
apt-get update
