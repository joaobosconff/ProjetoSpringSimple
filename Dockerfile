
FROM maven:3.5-jdk-8 AS build  
COPY pom.xml /api  

#executa o comando
RUN mvn -f /api/pom.xml clean package

FROM java:8
COPY --from=build /usr/src/api/target/**.jar /usr/api/app.jar

#Porta que o projeto usa,para ser exportado
EXPOSE 8080

#comando executado quando dá o comando run no container com a imagem
ENTRYPOINT ["java","-jar", "/usr/api/app.jar"]
