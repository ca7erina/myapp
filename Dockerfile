# Set the base image
FROM centos:7

# Dockerfile author / maintainer
MAINTAINER Name <xiaoxue_chen@trimble.com>

# install wget
RUN yum install -y wget

# install java
RUN yum -y update
RUN yum -y install java-1.8.0-openjdk-devel
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0

# get maven
RUN wget --no-verbose -O /tmp/apache-maven-3.3.9.tar.gz http://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
# verify checksum
RUN echo "516923b3955b6035ba6b0a5b031fbd8b /tmp/apache-maven-3.3.9.tar.gz" | md5sum -c
# install maven
RUN tar xzf /tmp/apache-maven-3.3.9.tar.gz -C /opt/ \
&& ln -s /opt/apache-maven-3.3.9 /opt/maven \
&& ln -s /opt/maven/bin/mvn /usr/local/bin \
&& rm -f /tmp/apache-maven-3.3.9.tar.gz
ENV MAVEN_HOME /opt/maven

# Add the service itself
ADD target/myapp-0.0.1-SNAPSHOT.jar /usr/share/myapp/myapp-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-cp", "/usr/share/myapp/myapp-0.0.1-SNAPSHOT.jar","myapp.Printer"]
