FROM ubuntu:18.04 AS git
RUN apt update && apt install git -y
RUN cd /tmp && git clone https://github.com/Elferey/devops_school.git

FROM maven:3.6.0-jdk-11-slim
WORKDIR /tmp
COPY --from=git  /tmp/devops_school/docker_compose/boxfuse-sample-java-war-hello /tmp
RUN mvn package
