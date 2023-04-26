docker stop zk-cluster
docker rm zk-cluster
docker rmi zk-cluster
docker build -t zk-cluster .
docker run -itd --name zk-cluster -p 2181-2183:2181-2183 -p 9090:9090 zk-cluster
docker ps -a | grep zk-cluster
docker exec -it zk-cluster bash
