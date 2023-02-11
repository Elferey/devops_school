FROM maven:3.8.7-openjdk-18-slim as maven_builder
ENV CATALINA_HOME="/usr/local/tomcat"
WORKDIR $CATALINA_HOME
ADD ./boxfuse-sample-java-war-hello $CATALINA_HOME
RUN mvn package