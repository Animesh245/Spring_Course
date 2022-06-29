
FROM tomcat:9

RUN rm -rf /usr/local/tomcat/webapps/*

COPY ./target/Form_CRUD_Database-1.0.0-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

CMD ["catalina.sh", "run"]