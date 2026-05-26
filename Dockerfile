FROM tomcat:10.1

COPY target/StudentManagementMVC.war /usr/local/tomcat/webapps/

EXPOSE 8080