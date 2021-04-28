#/bin/bash
docker cp $1 namenode:/
docker exec namenode hdfs dfs -mkdir /input
docker exec namenode hdfs dfs -copyFromLocal $2 /input/