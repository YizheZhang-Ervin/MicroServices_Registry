# MicroServices_Registry

1. docker-cluster
    - zk集群(2181~2183)
    - zkui(9090)
    
2. registry-zk-provider
    - 服务提供方(注册到ZK)

3. registry-zk-consumer
    - 服务发现方(从ZK获取服务提供方)
    
4. registry-zk-handwriting
    - 手写zk