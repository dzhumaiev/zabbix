#!/bin/bash
# Zabbix agent2 installation on CentOS 8 Stream
echo "zabbix2 7.0 installation"
sleep 3
rpm -Uvh https://repo.zabbix.com/zabbix/7.0/centos/8/x86_64/zabbix-release-7.0-5.el8.noarch.rpm
sleep 3
dnf clean all
sleep 3
dnf install zabbix-agent2 zabbix-agent2-plugin-*
sleep 3
systemctl restart zabbix-agent2
sleep 3
systemctl enable zabbix-agent2
sleep 3
echo "press q if see the status"
systemctl status zabbix-agent2
