ADD file:e4d600fc4c9c293efe360be7b30ee96579925d1b4634c94332e2ec73f7d8eca1 in / 
CMD ["/bin/sh"]
ARG MAJOR_VERSION
ARG ZBX_VERSION
ARG ZBX_SOURCES=https://git.zabbix.com/scm/zbx/zabbix.git
ENV TERM=xterm ZBX_VERSION=6.2.7 ZBX_SOURCES=https://git.zabbix.com/scm/zbx/zabbix.git
LABEL org.opencontainers.image.authors=Alexey Pustovalov <alexey.pustovalov@zabbix.com> org.opencontainers.image.description=Zabbix web-interface based on Nginx web server with MySQL database support org.opencontainers.image.documentation=https://www.zabbix.com/documentation/6.2/manual/installation/containers org.opencontainers.image.licenses=GPL v2.0 org.opencontainers.image.source=https://git.zabbix.com/scm/zbx/zabbix.git org.opencontainers.image.title=Zabbix web-interface (Nginx, MySQL) org.opencontainers.image.url=https://zabbix.com/ org.opencontainers.image.vendor=Zabbix LLC org.opencontainers.image.version=6.2.7
STOPSIGNAL SIGTERM
COPY /tmp/zabbix-6.2.7/ui /usr/share/zabbix # buildkit
COPY conf/etc/ /etc/ # buildkit
RUN |3 MAJOR_VERSION=6.2 ZBX_VERSION=6.2.7 ZBX_SOURCES=https://git.zabbix.com/scm/zbx/zabbix.git /bin/sh -c set -eux &&     INSTALL_PKGS="bash             curl             mariadb-client             mariadb-connector-c             nginx             php81-bcmath             php81-ctype             php81-fpm             php81-gd             php81-gettext             php81-json             php81-ldap             php81-mbstring             php81-mysqli             php81-session             php81-simplexml             php81-sockets             php81-fileinfo             php81-xmlreader             php81-xmlwriter             php81-openssl             supervisor" &&     apk add             --no-cache             --clean-protected         ${INSTALL_PKGS} &&     apk add             --clean-protected             --no-cache             --no-scripts         apache2-ssl &&     addgroup             --system             --gid 1995         zabbix &&     adduser             --system             --gecos "Zabbix monitoring system"             --disabled-password             --uid 1997             --ingroup zabbix             --shell /sbin/nologin             --home /var/lib/zabbix/         zabbix &&     adduser zabbix root &&     mkdir -p /etc/zabbix &&     mkdir -p /etc/zabbix/web &&     mkdir -p /etc/zabbix/web/certs &&     mkdir -p /var/lib/php/session &&     rm -rf /etc/php81/php-fpm.d/www.conf &&     rm -f /etc/nginx/http.d/*.conf &&     ln -sf /dev/fd/2 /var/lib/nginx/logs/error.log &&     cd /usr/share/zabbix/ &&     rm -f conf/zabbix.conf.php conf/maintenance.inc.php conf/zabbix.conf.php.example &&     rm -rf tests &&     rm -f locale/add_new_language.sh locale/update_po.sh locale/make_mo.sh &&     find /usr/share/zabbix/locale -name '*.po' | xargs rm -f &&     find /usr/share/zabbix/locale -name '*.sh' | xargs rm -f &&     ln -s "/etc/zabbix/web/zabbix.conf.php" "/usr/share/zabbix/conf/zabbix.conf.php" &&     ln -s "/etc/zabbix/web/maintenance.inc.php" "/usr/share/zabbix/conf/maintenance.inc.php" &&     chown --quiet -R zabbix:root /etc/zabbix/ /usr/share/zabbix/include/defines.inc.php /usr/share/zabbix/modules/ &&     chgrp -R 0 /etc/zabbix/ /usr/share/zabbix/include/defines.inc.php /usr/share/zabbix/modules/ &&     chmod -R g=u /etc/zabbix/ /usr/share/zabbix/include/defines.inc.php /usr/share/zabbix/modules/ &&     chown --quiet -R zabbix:root /etc/nginx/ /etc/php81/php-fpm.d/ /etc/php81/php-fpm.conf &&     chgrp -R 0 /etc/nginx/ /etc/php81/php-fpm.d/ /etc/php81/php-fpm.conf &&     chmod -R g=u /etc/nginx/ /etc/php81/php-fpm.d/ /etc/php81/php-fpm.conf &&     chown --quiet -R zabbix:root /var/lib/php/session/ /var/lib/nginx/ &&     chgrp -R 0 /var/lib/php/session/ /var/lib/nginx/ &&     chmod -R g=u /var/lib/php/session/ /var/lib/nginx/ &&     rm -rf /var/cache/apk/* # buildkit
EXPOSE map[8080/tcp:{} 8443/tcp:{}]
WORKDIR /usr/share/zabbix
COPY docker-entrypoint.sh /usr/bin/ # buildkit
USER 1997
ENTRYPOINT ["docker-entrypoint.sh"]