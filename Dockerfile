FROM maven:3.5-jdk-8 AS build  
COPY src /api
COPY pom.xml /api  
RUN mvn -f /api/pom.xml clean package

FROM java:8
COPY --from=build /api/src/target/**.jar /api/app.jar 
EXPOSE 8080  
ENTRYPOINT ["java","-jar", "/api/app.jar"]
