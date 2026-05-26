FROM tomcat:9.0
COPY target/StudentManagementMVC.war /usr/local/tomcat/webapps/

EXPOSE 8080