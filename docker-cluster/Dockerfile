FROM almalinux

ARG zkName=apache-zookeeper-3.8.1-bin.tar.gz
ARG jdkName=openjdk-17.0.2_linux-x64_bin.tar.gz
ARG zkuiName=zkui-2.0-SNAPSHOT-jar-with-dependencies.jar

COPY $jdkName /home
COPY $zkName /home
COPY $zkuiName /home/zkui/
COPY config.cfg /home/zkui/
COPY zk1 /home/zk1
COPY zk2 /home/zk2
COPY zk3 /home/zk3
COPY start-cluster.sh /home

WORKDIR /home
RUN mkdir /usr/local/java; \
    tar -zxf $zkName; \
    tar -zxf $jdkName -C /usr/local/java; \
    ln -s /usr/local/java/jdk-17.0.2/bin/java /usr/bin/java

EXPOSE 2181 2182 2183
ENTRYPOINT ["sh","start-cluster.sh"]
#CMD "sleep 36000"
