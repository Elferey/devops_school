FROM alpine/git AS git
RUN cd /tmp && git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git

FROM maven:3.8.3-jdk-8-slim
ENV CATALINA_HOME="/usr/local/tomcat"
WORKDIR $CATALINA_HOME
COPY --from=git  /tmp/boxfuse-sample-java-war-hello $CATALINA_HOME
RUN cd $CATALINA_HOME && mvn package