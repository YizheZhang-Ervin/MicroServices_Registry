# MicroServices_Registry

一、Features
1. 注册中心API
  - 服务注册
  - 服务注销
  - 心跳检查
    - 长连接 + 临时节点
  - 服务查询
  - 服务变更查询
2. 服务高可用
3. 存储格式和位置
4. 服务健康检查
5. 服务状态变更通知
  - watch 发布订阅
    - 注册watcher(读操作)
    - 类型: 数据监视点(getData、exists)和子节点监视点(getChildren)
6. 白名单机制

二、ZK知识点
1. 核心概念：文件系统 + 监听
2. 节点类型：持久化节点，临时节点，持久化顺序节点，临时顺序节点
3. 用途：分布式配置中心、分布式锁、分布式注册中心
4. 注册中心角色
  - Server: 启动时向registry注册服务，定期心跳
  - Client: 启动向registry订阅服务，缓存服务节点列表，与server建立连接(负载均衡调用)
  - Registry: 存server注册信息，server节点变更，registry同步变更，client感知后刷新缓存服务节点列表
5. 选举
  - zxid代表数据新旧，越大越新，优先大的
  - zxid一致，选sid大的
  - 过半原则，过半数票节点为主节点

三、使用zk
```
./zkServer.sh start ../conf/zoo.cfg
./zkCli.sh
ls /xxpath
create /xxpath xxdata
get /xxpath watch
get /xxpath
set /xxpath xxdata
delete /xxpath

启动ZK服务: bin/zkServer.sh start
查看ZK服务状态: bin/zkServer.sh status
停止ZK服务: bin/zkServer.sh stop
重启ZK服务: bin/zkServer.sh restart
连接服务器: zkCli.sh -server 127.0.0.1:2181
```

