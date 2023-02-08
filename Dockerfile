FROM ubuntu:18.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y
WORKDIR .
ADD ./boxfuse-sample-java-war-hello .
RUN cd ./boxfuse-sample-java-war-hello && mvn package
COPY ./boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
#RUN cp -r boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD ["bash"]