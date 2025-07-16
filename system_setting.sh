#!/bin/bash

apt update

#limits.conf
cat <<EOF >> /etc/security/limits.conf
root soft nofile 65535
root hard nofile 65535
* soft nofile 65535
* hard nofile 65535

EOF

# sysctl.conf
cat <<EOF >> /etc/sysctl.conf
vm.swappiness = 0
kernel.sysrq = 1

net.ipv4.neigh.default.gc_stale_time = 120

# see details in https://help.aliyun.com/knowledge_detail/39428.html
net.ipv4.conf.all.rp_filter = 0
net.ipv4.conf.default.rp_filter = 0
net.ipv4.conf.default.arp_announce = 2
net.ipv4.conf.lo.arp_announce = 2
net.ipv4.conf.all.arp_announce = 2

# see details in https://help.aliyun.com/knowledge_detail/41334.html
net.ipv4.tcp_max_tw_buckets = 5000
net.ipv4.tcp_syncookies = 1
net.ipv4.tcp_max_syn_backlog = 1024
net.ipv4.tcp_synack_retries = 2
net.ipv4.tcp_slow_start_after_idle = 0
EOF

# 停用並禁用防火牆
systemctl stop ufw
systemctl disable ufw

# 停用並禁用apparmor
systemctl stop apparmor
systemctl disable apparmor

# 停用並禁用自動更新服務	  
systemctl stop unattended-upgrades
systemctl disable unattended-upgrades

# install
apt install net-tools

