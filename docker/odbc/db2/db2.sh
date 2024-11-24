# Only example for DB2 ODBC

# # Extract 
# tar -zxvf ibm_data_server_driver_for_odbc_cli.tar.gz -C /etc/zabbix/

# # Remove tar.gz
# rm -f ibm_data_server_driver_for_odbc_cli.tar.gz

# Enter to zabbix folder DB@ extract
# cd /etc/zabbix/clidriver/cfg

# # Copy db2cli.ini.sample
# cp db2cli.ini.sample db2cli.ini

# # Edit db2cli.ini
# cat > db2cli.ini <<EOF
# [ZABBIX]
# Database=ZABBIX
# Protocol=TCPIP
# Port=50001
# Hostname=192.168.0.71
# UID=zabbix
# PWD=zabbix
# EOF

# # Copy db2dsdriver.cfg.sample
# cp db2dsdriver.cfg.sample db2dsdriver.cfg

# # Edit db2dsdriver.cfg
# cat > db2dsdriver.cfg <<EOF
# <configuration>
#    <dsncollection>
#       <dsn alias="ZABBIX" name="ZABBIX" host="192.168.0.71" port="50001">
#          <parameter name="UserID" value="zabbix"/>
#          <parameter name="Password" value="zabbix"/>
#       </dsn>
#    </dsncollection>
# </configuration>
# EOF