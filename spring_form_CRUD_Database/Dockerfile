
FROM tomcat:9

RUN rm -rf ./apache-tomcat-9.0.62/webapps/*

COPY ./target/Form_CRUD_Database-1.0.0-SNAPSHOT.war ./apache-tomcat-9.0.62/webapps/ROOT.war

CMD ["/apache-tomcat-9.0.62/bin/catalina.sh", "run"]