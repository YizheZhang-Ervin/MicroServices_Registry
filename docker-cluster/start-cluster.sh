cat >>/etc/profile<<EOF
export JAVA_HOME=/usr/local/java/jdk-17.0.2
export JRE_HOME=${JAVA_HOME}/jre
export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib
export PATH=${JAVA_HOME}/bin:$PATH
EOF
source /etc/profile

cd /home/apache-zookeeper-3.8.1-bin/bin
./zkServer.sh start /home/zk1/zoo-1.cfg & \
./zkServer.sh start /home/zk2/zoo-2.cfg & \
./zkServer.sh start /home/zk3/zoo-3.cfg

cd /home/zkui
java -jar zkui-2.0-SNAPSHOT-jar-with-dependencies.jar
