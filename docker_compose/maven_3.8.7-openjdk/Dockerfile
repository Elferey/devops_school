FROM alpine/git AS git
RUN cd /tmp && git clone https://github.com/darkleon/HelloWorld.git

FROM maven:3.8.7-openjdk-18-slim
ENV CATALINA_HOME="/usr/local/tomcat"
WORKDIR $CATALINA_HOME
COPY --from=git  /tmp/HelloWorld $CATALINA_HOME
RUN cd $CATALINA_HOME && mvn package