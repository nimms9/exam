From centos:7

RUN yum -y update
RUN wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "https://download.oracle.com/otn/java/jdk/8u251-b08/3d5a2bb8f8d4428bbe94aed7ec7ae784/jdk-8u251-linux-x64.rpm?AuthParam=1593466414_aa7b4cd548a35e62e58e8cda4712be4d"
RUN yum -y localinstall jdk-8u251-linux-x64.rpm
RUN java -version
RUN wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.99/bin/apache-tomcat-7.0.99.tar.gz
RUN tar xzf apache-tomcat-7.0.99.tar.gz
RUN mv apache-tomcat-7.0.99 /usr/local/tomcat7
RUN cd /usr/local/tomcat7
RUN ./bin/startup.sh

COPY target/*.war /usr/local/tomcat/webapps/exam-1.0.0.war
