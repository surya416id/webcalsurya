FROM maven:3-openjdk-8 as build
WORKDIR /app
COPY . /app
RUN mvn package

FROM tomcat:9.0
COPY --from=build target/suryapp-1.2.war /usr/local/tomcat/webapps/suryapp-1.2.war
