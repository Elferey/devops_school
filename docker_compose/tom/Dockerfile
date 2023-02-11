FROM tomcat:9.0.71-jdk11-temurin-focal
RUN mv webapps webapps_old && webapps.dist webapps
CMD ["catalina.sh", "run"]