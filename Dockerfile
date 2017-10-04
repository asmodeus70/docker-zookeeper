FROM centos:7

MAINTAINER Name neil@radleydevops.com

RUN yum update -y && yum clean all && yum -y install iproute cppunit python-setuptools git ant java-1.8.0-openjdk.x86_64
RUN rm -rf /var/cache/yum
RUN mkdir /zookeeper
WORKDIR /zookeeper
RUN git clone https://github.com/apache/zookeeper.git .
#RUN git checkout release-3.5.1-rc2
RUN git checkout release-3.4.10
RUN ant jar
RUN cp /zookeeper/conf/zoo_sample.cfg /zookeeper/conf/zoo.cfg
RUN echo "standaloneEnabled=false" >> /zookeeper/conf/zoo.cfg
RUN echo "dynamicConfigFile=/zookeeper/conf/zoo.cfg.dynamic" >> /zookeeper/conf/zoo.cfg
COPY zk-init.sh /usr/bin/
RUN chmod +x /usr/bin/zk-init.sh
#ENTRYPOINT ["/bin/bash"]
ENTRYPOINT ["/usr/bin/zk-init.sh"]
