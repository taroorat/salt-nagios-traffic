net-snmp-install:
  file.recurse:
    - name: /usr/local/net-snmp
    - source: salt://install/files/net-snmp
    - file_mode: 644
    - dir_mode: 755
    - user: root
    - group: root
    - makedirs: True

changeBinLimit:
  file.recurse:
    - name: /usr/local/net-snmp/bin
    - source: salt://install/files/net-snmp/bin
    - file_mode: 755
    - dir_mode: 755
    - user: root
    - group: root 

changeSbinLimit:
  file.recurse:
    - name: /usr/local/net-snmp/sbin
    - source: salt://install/files/net-snmp/sbin
    - file_mode: 755
    - dir_mode: 755
    - user: root
    - group: root 

check_traffic_install:
  file.managed:
    - name: /usr/local/nagios/libexec/check_traffic.sh
    - source: salt://install/files/check_traffic.sh
    - mode: 755
    - user: nagios
    - group: nagios

/var/tmp/check_traffic_127.0.0.1_2__itnms.hist_dat_64:
  file.managed:
    - user: nagios
    - group: nagios

/usr/local/nagios/etc/nrpe.cfg:
  file.append:
    - text:
      - 'command[check_traffic]=/usr/local/nagios/libexec/check_traffic.sh -V 2c -C public -H 127.0.0.1 -I 2 -w 100000,100000 -c 150000,150000 -K -b'
  
