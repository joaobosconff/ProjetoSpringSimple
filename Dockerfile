FROM maven:3.5-jdk-8 AS build  
COPY src /usr/src/api/src  
COPY pom.xml /usr/src/api  
RUN mvn -f /usr/src/api/pom.xml package -DskipTests

FROM java:8
COPY --from=build /usr/src/api/target/**.jar /usr/api/application.jar 
EXPOSE 8080
ENTRYPOINT ["java","-jar","/usr/api/application.jar"]  
