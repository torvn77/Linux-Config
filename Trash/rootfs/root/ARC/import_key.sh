#!/usr/bin/env bash
#

wget -qO - https://pkg.tox.chat/debian/pkg.gpg.key | apt-key add -

wget -qO - http://download.opensuse.org/repositories/home:antonbatenev:tox/Debian_Stretch/Release.key | apt-key add -
wget -qO - http://download.opensuse.org/repositories/home:antonbatenev:tox/Debian_8.0/Release.key | apt-key add -


apt-get install apt-transport-https
apt-get update


