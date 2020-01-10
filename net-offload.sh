#!/bin/bash
for var in $@
do
echo "turning off offloading on $var"
ethtool -K enp0s31f6 tso off gro off lro off gso off rx off tx off sg off rxvlan off txvlan off
ethtool -N enp0s31f6 rx-flow-hash udp4 sdfn
ethtool -N enp0s31f6 rx-flow-hash udp6 sdfn
ethtool -C enp0s31f6 adaptive-rx off
ethtool -C enp0s31f6 rx-usecs 1000
ethtool -G enp0s31f6 rx 4096
done
exit
