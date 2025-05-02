#!/bin/bash

## install common for k8s

HOSTNAME=$(hostname)
IP=$(hostname -I | awk '{print $2}')
echo "START - install common - "$IP

export DEBIAN_FRONTEND=noninteractive

echo "[1]: add host name for ip"
host_exist=$(cat /etc/hosts | grep -i "$IP" | wc -l)
if [ "$host_exist" == "0" ];then
echo "$IP $HOSTNAME " >/etc/hosts
fi

echo "[2]: disable swap"
swapoff -a
#sed -i.bak -r 's/(.+ swap .+)/#\1/' /etc/fstab
sed -i.bak -r 's/\/swap/#\/swap/' /etc/fstab

echo "[3]: install utils"
apt-get update -qq >/dev/null
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg >/dev/null
echo "your-ssh-pub-key" >> /root/.ssh/authorized_keys
