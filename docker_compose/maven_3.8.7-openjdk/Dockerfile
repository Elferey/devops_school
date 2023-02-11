FROM alpine/git AS git
RUN cd /tmp && git clone https://github.com/Elferey/devops_school.git

FROM maven:3.6.0-jdk-11-slim
ENV CATALINA_HOME="/usr/local/tomcat"
WORKDIR $CATALINA_HOME
COPY --from=git  /tmp/devops_school/docker_compose/boxfuse-sample-java-war-hello $CATALINA_HOME
RUN cd boxfuse-sample-java-war-hello && mvn package