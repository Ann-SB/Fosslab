#!/bin/bash

x=$(logname)
echo "Current user : $x"
echo

echo "Current shell : $SHELL"
echo

echo "Home directory : $HOME"
echo

echo "OS type : $(arch)"
echo

echo "Path setting : $PATH"
echo

echo "Current working directory : $(pwd)"
echo

echo "Users : $(users)"
echo

echo
echo "********************SYSTEM CONFIGURATIONS*******************"
echo

echo "$(lsb_release -a)"
echo

echo "Available shells : "
cat /etc/shells
echo

echo "Mouse settings : "
echo "$(xinput --list --short)"
echo

echo "CPU Information : "
echo "$(lscpu)"
echo

echo "Memory Information : "
echo "$(free -m)"
echo

echo "Hard disk Information : "
echo "$(sudo dmidecode -t memory)"
echo

echo "File system : "
echo "$(sudo fdisk -l)"
echo
