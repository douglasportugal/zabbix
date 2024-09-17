cd /tmp \
&& curl https://packages.microsoft.com/config/rhel/8/prod.repo | tee /etc/yum.repos.d/mssql-release.repo \
&& ACCEPT_EULA=Y microdnf install -y msodbcsql18 \
&& microdnf -y install openssl libaio unixODBC-devel \ 
&& rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2111000/oracle-instantclient-basic-21.11.0.0.0-1.el8.x86_64.rpm \
&& rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2111000/oracle-instantclient-sqlplus-21.11.0.0.0-1.el8.x86_64.rpm \
&& rpm -Uvh https://download.oracle.com/otn_software/linux/instantclient/2111000/oracle-instantclient-odbc-21.11.0.0.0-1.el8.x86_64.rpm \
&& bash db2.sh \
&& rm -rf /tmp \
&& microdnf -y clean all \
&& rm -rf /var/cache/yum /var/lib/yum/yumdb/* /usr/lib/udev/hwdb.d/* \
&& rm -rf /var/cache/dnf /etc/udev/hwdb.bin /root/.pki