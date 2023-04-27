# Docker ZK Cluster with ZKUI

# 容器使用
```
# 打包 (镜像启动三个zk+zkui)
## 打包文件Dockerfile，脚本start-cluster.sh
## apache-zookeeper-3.8.1-bin.tar.gz，jdkName=openjdk-17.0.2_linux-x64_bin.tar.gz，zkui-2.0-SNAPSHOT-jar-with-dependencies.jar
sh buildAndRunImg.sh

# 调试
docker run -it --name zk-cluster zk-cluster /bin/bash

# 进容器
docker exec -it zk-cluster bash

# 容器内安装调试 (ps,netstat命令)
dnf install -y procps net-tools

# 登录
ip:9090 账号admin，密码manager
```

# ZKUI使用
```
# 容器启动
docker run -d --name zkui -p 9090:9090 -e ZKUI_ZK_SERVER=127.0.0.1:2181,127.0.0.1:2182,127.0.0.1:2183 qnib/zkui

# 直接启动jar
java -jar zkui-2.0-SNAPSHOT-jar-with-dependencies.jar

# 改配置文件config.cfg，放到jar同级目录并修改
zkServer=多个集群ip地址

# zkServer.sh加一行
ZOOMAIN="-Dzookeeper.4lw.commands.whitelist=* ${ZOOMAIN}"

# 解决页面error
./bin/zkCli.sh -server
create /appconfig ""
create /appconfig/hosts ""
```

# ZK集群使用
```
zk1/{myid,zoo-1.cfg}
zk2/{myid,zoo-1.cfg}
zk3/{myid,zoo-1.cfg}

- 其中myid唯一标识，各不一样
- cfg修改
  - 改dataDir
  - 加server.1=xxIp:dataPort1:selectPort1
  - 加server.2=xxIp:dataPort2:selectPort2
  - 加server.3=xxIp:dataPort3:selectPort3
- 启动
  - ./zkServer.sh start ../conf/zoo-1.cfg
  - ./zkServer.sh start ../conf/zoo-2.cfg
  - ./zkServer.sh start ../conf/zoo-3.cfg
- client
  - ./zkCli.sh -server xxIp:dataPort
```