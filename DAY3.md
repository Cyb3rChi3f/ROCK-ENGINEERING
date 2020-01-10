# ROCKNSM setup
---
## `Install Stenographer`
#### sudo yum install Stenographer

### `Gen Cert file`
#### sudo stenokeys.sh stenographer stenographer
### Update Config file
#### sudo vi /etc/stenographer/config
##### {
#####  "Threads": [
#####    { "PacketsDirectory": "/data/steno/thread0/packets/"   <--Update to correct Directory
#####    , "IndexDirectory": "/data/steno/thread0/index/"       <--Update to correct Directory
#####    , "MaxDirectoryFiles": 30000
#####    , "DiskFreePercentage": 10
#####    }
#####  ]
#####  , "StenotypePath": "/usr/bin/stenotype"   <--Update to correct location (search with: which stenographer)
#####  , "Interface": "enp0s31f6"    <--Update to promisc interface
#####  , "Port": 1234     <--Change port if using Docket
#####  , "Host": "127.0.0.1"
#####  , "Flags": []
#####  , "CertPath": "/etc/stenographer/certs"
##### }

#### sudo systemctl start stenographer
#### sudo systemctl status stenographer
---
### `ethtool`
#### *(change offloading interface settings)*
#### ethtool -K eth1 tso off gro off lro off gso off rx off tx off sg off rxvlan off txvlan off
#### ethtool -N et1 rx-flow-hash udp4 sdfn
#### ethtool -N eth1 rx-flow-hash udp6 sdfn
#### ethtool -C eth1 adaptive-rx off
#### ethtool -C eth1 rx-usecs 1000
#### ethtool -G eth1 rx 4096
---
### `offloading Script:`
#### #!/bin/bash

#### for var in $@
#### do
#### echo "turning off offloading on $var"
#### ethtool -K eth1 tso off gro off lro off gso off rx off tx off sg off rxvlan off txvlan off
#### ethtool -N et1 rx-flow-hash udp4 sdfn
#### ethtool -N eth1 rx-flow-hash udp6 sdfn
#### ethtool -C eth1 adaptive-rx off
#### ethtool -C eth1 rx-usecs 1000
#### ethtool -G eth1 rx 4096
#### done
#### exit

### `Install Suricata`
#### sudo yum install Suricata
#### edit /etc/suricata/suricata.YAML
#### 53 # The default logging directory.  Any log or output file will be
####     54 # placed here if its not specified with a full path name. This can be
####     55 # overridden with the -l command line parameter.
####     56 default-log-dir: /data/suricata/ <--edit log directory line
#### # Configure the type of alert (and other) logging you would like.
#### 73 outputs:
####     74   # a line based alerts log similar to Snort's fast.log
####     75   - fast:
####     76       enabled: no <-- edit this line to no
#### 402   # Stats.log contains data from various counters of the Suricata engine.
####   403   - stats:
####   404       enabled: no <--edit this line to no

#### local rules
#### Place local rules in this directory
####  /usr/share/suricata/rules/
#### suricata-update

### Update suricata options file

#### /etc/sysconfig/suricata
#### OPTIONS="--af-packet=enp2s0 --user suricata "

#### vi /etc/sysconfig/my-overrides.yaml  _<---"add custom changes here and reference in main config file"_

### Command to find out what processors you can pin:
#### sudo cat /proc/cpuinfo | egrep -e 'processor|physical id|core id' | xargs -l3
#### _NEVER ASSIGN CORE "0" TO ANYTHING_
### Curl Suricata rules
#### curl -L -O http://192.168.2.11:8009/suricata-5.0/emerging.rules.tar.gz
#### tar -xzf emerging.rules.tar.gz
#### suricata-update

### Change suricata folder ownership
#### chown -R suricata /data/suricata/
#### systemctl start suricata
#### systemctl status suricata


#### systemctl --type=service --state=active

#### systemctl list-units --type=service --state=running
#### OR
#### systemctl --type=service --state=running

#### systemctl list-units --type=service --state=failed
#### systemctl list-units --type=service --state=exited

#### vi ~/.bashrc
#### alias running_services='systemctl list-units  --type=service  --state=running'
##
