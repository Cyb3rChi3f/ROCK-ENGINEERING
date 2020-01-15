## Create a Service port group for ROCKNSM

### Create xml file for config:
#### sudo vi /root/rocknsm.xml
#### _Insert protocol and port information:_
```.yml
<?xml version="1.0" encoding="utf-8"?>
 \<service>
 \<short>rocknsm</short>
 \<description>Common Ports for ROCKNSM</description>
  \<port protocol="tcp" port="9092"/>
  \<port protocol="tcp" port="9200"/>
  \<port protocol="tcp" port="9300"/>
  \<port protocol="tcp" port="5601"/>
  \<port protocol="tcp" port="5800"/>
 \</service>
 ```

 #### Add custom service to firewall-cmd
  ```.sh
 sudo firewall-cmd --permanent --new-service-from-file=/root/rocknsm.xml --name=rocknsm
 ```
 #### Add service to public zone
  ```.sh
 sudo firewall-cmd --zone=public --add-service=rocknsm --permanent
```
 #### reload firewall for changes to take effect
  ```.sh
 sudo firewall-cmd --reload
```
