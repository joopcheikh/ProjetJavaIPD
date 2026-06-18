# Utilise l'image Tomcat 9 officielle
FROM tomcat:9-jdk11

# Copie le WAR compilé vers le répertoire de déploiement
COPY target/GestionEquipement-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose le port 8080
EXPOSE 8080

# Démarrage de Tomcat
CMD ["catalina.sh", "run"]
