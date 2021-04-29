#/bin/bash

# on $1 there is the source file path 
# on $2 there is the destination file path on hdfs

# take the source file name 
sfn="$(basename -- $1)"

# take the destination directory
# dd="$(dirname -- $2)"
dd=$2

# copy the file to namenode using path ($1) 
docker cp $1 namenode:/

# create the directory into HDFS
docker exec namenode hdfs dfs -mkdir $dd

# upload the file into the HDFS directory
docker exec namenode hdfs dfs -copyFromLocal $sfn $dd/