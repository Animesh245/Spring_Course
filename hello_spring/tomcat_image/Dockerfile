FROM jdk:17

RUN apt-get update
RUN apt-get install -y curl
RUN curl https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.64/bin/apache-tomcat-9.0.64.tar.gz --output 'apache-tomcat-9.0.64.tar.gz'

RUN tar -zxvf apache-tomcat-9.0.64.tar.gz
RUN rm apache-tomcat-9.0.64.tar.gz
RUN apt-get purge -y curl
RUN apt-get autoremove -y
RUN apt-get clean

CMD ["./apache-tomcat-9.0.64/bin/catalina.sh", "run"]
