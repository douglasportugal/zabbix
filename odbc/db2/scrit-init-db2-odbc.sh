# Extract 
tar -zxvf ibm_data_server_driver_for_odbc_cli.tar.gz -C /etc/zabbix/

# Enter to zabbix folder DB@ extract
cd /etc/zabbix/clidriver/cfg

# Copy db2cli.ini.sample
cp db2cli.ini.sample db2cli.ini

# Edit db2cli.ini
cat > db2cli.ini <<EOF
[ZABBIX]
Database=ZABBIX
Protocol=TCPIP
Port=50001
Hostname=192.168.0.71
UID=zabbix
PWD=zabbix
EOF

# Copy db2dsdriver.cfg.sample
cp db2dsdriver.cfg.sample db2dsdriver.cfg

# Edit db2dsdriver.cfg
cat > db2dsdriver.cfg <<EOF
<configuration>
   <dsncollection>
      <dsn alias="ZABBIX" name="ZABBIX" host="192.168.0.71" port="50001">
         <parameter name="UserID" value="zabbix"/>
         <parameter name="Password" value="zabbix"/>
      </dsn>
   </dsncollection>
</configuration>
EOF

# Edit /etc/odbcinst.ini
cat >> /etc/odbcinst.ini<<EOF
[DB2]
Description=DB2 ODBC Driver
Driver=/etc/zabbix/clidriver/lib/libdb2.so
Fileusage=1
Dontdlclose=1
EOF

# Edit /etc/odbc.ini
cat > /etc/odbc.ini<<EOF
[ZABBIX]
Driver=DB2
EOF
# Test connection

echo "Run this test: isql -v ZABBIX zabbix zabbix"

