FROM alpine/git AS git
RUN mkdir /usr/local/tomcat && cd /usr/local/tomcat && git clone https://github.com/Elferey/devops_school.git

FROM maven:3.6.0-jdk-11-slim
RUN mkdir /usr/local/tomcat
WORKDIR /usr/local/tomcat
COPY --from=git  /usr/local/tomcat/devops_school/docker_compose/boxfuse-sample-java-war-hello /usr/local/tomcat
RUN cd /usr/local/tomcat/boxfuse-sample-java-war-hello && mvn package
ENTRYPOINT ["git"]
CMD ["--help"]