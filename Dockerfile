FROM maven:3.8.7-openjdk-18-slim as maven_builder
WORKDIR /usr/local/tomcat
ADD boxfuse-sample-java-war-hello /usr/local/tomcat
RUN mvn package

FROM eclipse-temurin:17-jdk-focal
RUN mkdir -p /usr/local/tomcat
WORKDIR /usr/local/tomcat
COPY --from=maven_builder /usr/local/tomcat/target/hello-1.0.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]