Foi utilizado o código https://github.com/zabbix/zabbix-docker e adaptado para meu homelab e necessidades.

Versão 7.0.4 Alpine com posgresql com imagem customizada do zabbix-proxy que se encontra https://hub.docker.com/u/douglasportugal

Está em docker-swarm com ponto de montagem NFS

# Precisa criar manualmente os diretório no seu host NFS

server-data/usr/lib/zabbix/alertscripts/
server-data/usr/lib/zabbix/externalscripts/
server-data/var/lib/zabbix/dbscripts/
server-data/var/lib/zabbix/export/
server-data/var/lib/zabbix/modules/
server-data/var/lib/zabbix/enc/
server-data/var/lib/zabbix/ssh_keys/
server-data/var/lib/zabbix/mibs/
proxy-data/usr/lib/zabbix/externalscripts/
proxy-data/var/lib/zabbix/modules/
proxy-data/var/lib/zabbix/enc/
proxy-data/var/lib/zabbix/ssh_keys/
proxy-data/var/lib/zabbix/mibs/
web-data/etc/ssl/nginx/
web-data/usr/share/zabbix/modules/
agent2-data/etc/zabbix/zabbix_agentd.d/
agent2-data/var/lib/zabbix/modules/
agent2-data/var/lib/zabbix/enc/
agent2-data/var/lib/zabbix/ssh_keys/
postgres-data/
