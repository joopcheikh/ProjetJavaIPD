# Utilise l'image Tomcat 9 officielle
# Build stage: compile le projet Maven et produit le WAR
FROM maven:3.8.8-openjdk-11 AS build
WORKDIR /app

# Copier uniquement les fichiers nécessaires au build puis builder
COPY pom.xml ./
COPY src ./src
RUN mvn -B package -DskipTests

# Runtime stage: Tomcat avec le WAR produit
FROM tomcat:9-jdk11
COPY --from=build /app/target/GestionEquipement-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
