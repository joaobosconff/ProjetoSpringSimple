FROM maven:3.5-jdk-8 AS build  


#Copia o conteudo do src para a pasta /api/src
COPY src /api/src 
#Copia o pom para a raiz
COPY pom.xml /api

#Roda o comando
RUN mvn -f /api/pom.xml clean package -DskipTests

FROM java:8

#Copia da imagem anterior,da pasta target para /api/ da imagem java
COPY --from=build /api/target/**.jar /api/application.jar 

#Exporta a porta do projeto
EXPOSE 8080

#Determina o comando de executacao para a imagem nova
ENTRYPOINT ["java","-jar","/api/application.jar"]  
