# **Engineering Notes**
---
#### `SWITCH LOGIN:`
```.sh
username: perched
!
password: perched1234!@#$
```
---
### EXT IP: 10.0.50.1/24
### INT IP: 172.16.50.1/24

### SENSOR IP:  172.16.50.100
---
### `DHCP SETUP:`
```.sh
ip dhcp excluded-address 10.0.50.0 10.0.50.1
!
ip dhcp pool 50
!
network 10.0.50.0 255.255.255.252
!
default-router 10.0.50.1
!
dns-server 192.168.2.1
```
---
### `VLAN SETUP:`
```.sh
VLAN 150
name TEAM50
interface vlan150
description TEAM50
ip address 10.0.50.1 255.255.255.252
```
---
### `CentOS SETUP:`

#### ip addr:
```.sh
ip a show dev enp0s31f6
ip -4 addr
ip a add x.x.x.x/24 dev xx
ip a del x.x.x.x/24 dev xx
```
#### ip link:
```.sh
ip link show dev xx
ip -s link
ip link set dev xxx up
ip link set dev xxx down
ip link set enpxxxx promisc on
```
#### ip router
```.sh
ip neigh
ip neigh show dev enp0s3
```
---
### `Disable IPv6:`
##### sudo vi /etc/sysctl.conf
```.sh
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
```
```.sh
sudo sysctl -p
sudo systemctl restart network
```
---
### `FIREWALLD:`
#### add open port:
```.sh
sudo firewall-cmd --zone=public --add-port=####/tcp --permanent

sudo firewall-cmd --reload
```
#### remove open port:
```.yml
sudo firewall-cmd --zone=public --remove-port=####/tcp --permanent
sudo firewall-cmd --reload
```
#### Commit Changes:
```.sh
sudo firewall-cmd --runtime-to-permanent
```
#### Socket status:
```.sh
ss -lnt  #<---(replacing netstat)
```
