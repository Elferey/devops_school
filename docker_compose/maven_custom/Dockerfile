FROM ubuntu:18.04 AS git
RUN apt update && apt install git -y
RUN mkdir /usr/local/tomcat && cd /usr/local/tomcat && git clone https://github.com/Elferey/devops_school.git
CMD ["/bash"]

FROM maven:3.6.0-jdk-11-slim
RUN mkdir /usr/local/tomcat
WORKDIR /usr/local/tomcat
COPY --from=git  /usr/local/tomcat/devops_school/docker_compose/boxfuse-sample-java-war-hello /usr/local/tomcat
RUN mvn package
