# SNESOR Setup:

###

#### /etc/firewalld/zones/public.xml

#### <?xml version="1.0" encoding="utf-8"?>
#### <zone>
####  \<short>Public\</short>
####  \<description>For use in public areas. You do not trust the other computers on networks to not harm your computer. Only selected incoming connections are accepted.</description>
####  \<service name="ssh"/>
####  \<service name="dhcpv6-client"/>
#### \<port protocol="tcp" port="8008"/>
####  \<port protocol="tcp" port="9092"/>
####  \<port protocol="tcp" port="9200"/>
####  \<port protocol="tcp" port="9300"/>
####  \<port protocol="tcp" port="5601"/>
#### \</zone>

### check logstash config
#### /usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/100-input-zeek.conf -t
