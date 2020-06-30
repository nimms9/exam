FROM centos:7

RUN yum -y update
RUN yum install -y wget
RUN yum install -y java-1.8.0-openjdk
CMD java -version

RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.99/bin/apache-tomcat-7.0.99.tar.gz
RUN tar xzf apache-tomcat-7.0.99.tar.gz
RUN mv apache-tomcat-7.0.99 /usr/local/tomcat7
WORKDIR /usr/local/tomcat7
CMD ./bin/startup.sh

COPY target/*.war /usr/local/tomcat7/webapps/exam-1.0.0.war
#RUN yum install -y firewalld
#CMD systemctl start firewalld
#CMD systemctl enable firewalld
#CMD systemctl status firewalld
EXPOSE 8080
#CMD firewall-cmd --permanent --zone=public --add-port=8080/tcp
#CMD firewall-cmd --zone=public --permanent --add-service=http
#CMD firewall-cmd --reload
CMD ["/usr/local/tomcat7/bin/catalina.sh", "run"]

