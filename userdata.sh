#!/bin/bash
sudo apt-get update -y
sudo apt-get install xfce4 xfce4-goodies -y
sudo apt-get install xrdp -y
sudo systemctl enable xrdp
sudo ufw allow 3389/tcp
echo xfce4-session >~/.xsession
sudo systemctl restart xrdp

yum install -y https://yum.puppet.com/puppet-release-el-7.noarch.rpm