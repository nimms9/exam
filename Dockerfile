From centos:7

RUN yum -y update
RUN yum install -y wget
RUN yum install java-11-openjdk-devel
RUN java -version
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.99/bin/apache-tomcat-7.0.99.tar.gz
RUN tar xzf apache-tomcat-7.0.99.tar.gz
RUN mv apache-tomcat-7.0.99 /usr/local/tomcat7
RUN cd /usr/local/tomcat7
RUN ./bin/startup.sh

COPY target/*.war /usr/local/tomcat/webapps/exam-1.0.0.war
