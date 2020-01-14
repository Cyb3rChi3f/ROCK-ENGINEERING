# SNESOR Setup:

###

#### /etc/firewalld/zones/public.xml
```.xml
<?xml version="1.0" encoding="utf-8"?>
<service>
 <short>rocknsm</short>
 <description>Service Ports for ROCKNSM</description>
  <port protocol="tcp" port="9092"/>
  <port protocol="tcp" port="9200"/>
  <port protocol="tcp" port="9300"/>
  <port protocol="tcp" port="5601"/>
</service>
 ```

### check logstash config
#### /usr/share/logstash/bin/logstash -f /etc/logstash/conf.d/100-input-zeek.conf -t


### add file to /etc/logstash/conf.d/500-filter-zeek.conf
```.yml
filter {
  if [@metadata][stage] == "zeek-raw" {
    mutate {
      add_field => {"processed_time" => "@timestamp"}
      }
    date{
      match => ["ts", "ISO8601"]
      }
    mutate {
      add_field => {"orig_host" => "%{id.orig_h}"}
      add_field => {"resp_host" => "%{id.resp_h}"}
      add_field => {"src_ip" => "%{id.orig_h}"}
      add_field => {"dst_ip" => "%{id.resp_h}"}
      add_field => { "related_ips" => [] }
      }
    mutate {
      merge => { "related_ips" => "id.orig_h" }
      }
    mutate {
      merge => { "related_ips" => "id.resp_h" }
    }
  }
}
```
### add file to \/etc/logstash/conf.d/999-output-zeek.conf
```.yml
 output {
 if [@metadata][stage] == "zeek-raw" {
 elasticsearch {
    hosts => ["172.16.50.100:9200"]
    index => "zeek-%{+YYYY.MM.dd}"
    }
  }
 }
 ```
### add file to /etc/logstash/conf.d/100-input-zeek.conf
```.yml
input {
    add_field => {"[@metadata][stage]" => "zeek-raw" }
    topics => ["zeek-raw"]
    bootstrap_servers => "172.16.50.100:9092"
    # Set consumer threads to one per kafka partition to scale up

    #consumer_threads => 4
    group_id => "bro_logstash"
    codec => json
    auto_offset_reset => "earliest"
 }
}
```
