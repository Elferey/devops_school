FROM ubuntu:18.04
RUN apt update
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install tomcat9 -y
RUN apt install git -y
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN cd boxfuse-sample-java-war-hello && mvn package
RUN cd boxfuse-sample-java-war-hello/target
RUN cp -r boxfuse-sample-java-war-hello/hello-1.0.war /var/lib/tomcat9/webapps/
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]