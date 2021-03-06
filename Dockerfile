FROM centos:7.5.1804
MAINTAINER ccondit@randomcoder.com

RUN \	
	yum clean metadata && \
	yum -y install epel-release && \
	yum clean metadata && \
	yum -y install make which tar rpm-build yum-utils python-argparse python-yaml java-1.8.0-openjdk-devel gcc gcc-c++ createrepo jq glibc-static krb5-workstation openssh-clients && \
	yum clean all

ENV MAVEN_VERSION=3.6.3
ENV JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
ENV MAVEN_HOME=/opt/apache-maven-${MAVEN_VERSION}

RUN \
	mkdir -p /download && \
	curl -o /download/apache-maven-${MAVEN_VERSION}-bin.tar.gz http://apache.cs.utah.edu/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
	mkdir -p /opt && \
	cd /opt && \
	tar -zxf /download/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
	ln -sf "${MAVEN_HOME}/bin/mvn" /usr/bin/mvn

