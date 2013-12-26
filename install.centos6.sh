#!/bin/bash -x

#
# xaviertidus/SquidInst
#
# Installs Squid in a very basic way on CentOS 6
#
# @package SquidInst 1.0
# @since SquidInst 1.0
# @author Xavier Hutchinson
#
(

clear
echo "############################################"
echo "Squid Install Script - for CentOS6"
echo "Created 2013/12/26 by Xavier Hutchinson"
echo "Shameless plug: http://xaviertidus.com "
echo "############################################"
echo "Ensuring were going to be eating the freshest yummy packages..."
yum update -y
echo "Installing Squid package"
yum install squid -y
echo "Running post install configuration"
#Backup squid.conf and write our version
mv /etc/squid/squid.conf /etc/squid/squid.conf.original
cp /opt/squidinst/etc/squid/squid.conf /etc/squid/squid.conf

#Write our rule files
cp /opt/squidinst/etc/squid/clients.blocked.squid /etc/squid/clients.blocked.squid
cp /opt/squidinst/etc/squid/clients.administrators.squid /etc/squid/clients.administrators.squid
cp /opt/squidinst/etc/squid/ipaddresses.blocked.squid /etc/squid/ipaddresses.blocked.squid
cp /opt/squidinst/etc/squid/keywords.blocked.squid /etc/squid/keywords.blocked.squid
cp /opt/squidinst/etc/squid/sites.blocked.squid /etc/squid/sites.blocked.squid

echo "Installation of Squid is Complete!"
echo "Your original /etc/squid/squid.conf file has been backed up with a .original extension."
echo " "
echo "Need help or want to see where you can go from here? Visit http://www.xaviertidus.com for more tutorials and quick scripts!"
echo " "
echo "This installer added a few empty config files to help you get kick started with rules for your squid server! Check out:  for detailed information about how to use these files."

) 2>&1 | tee /var/log/SquidInst-CentOS6-installer.log