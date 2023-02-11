FROM tomcat:9.0.71-jdk11-temurin-focal
RUN mv /usr/local/tomcat/webapps /usr/local/tomcat/webapps_old && /usr/local/tomcat/webapps.dist /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]