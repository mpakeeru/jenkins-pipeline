FROM docker.io/tomcat:latest
ADD target/SimpleTomcatWebApp.war /usr/local/local/webapps/
EXPOSE 8080
CMD ["catalina.sh","run"]
