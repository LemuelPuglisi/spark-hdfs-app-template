from pyspark.sql import SparkSession

# Suppose you used the upload script to upload your file
# named "data.csv" to hdfs in a directory called "input"
# placed at the root of the shared file system 
hdfs_path = "hdfs://namenode:9000/input/data.csv"

# initialize a spark session 
spark = SparkSession.builder\
    .appName("example-app")\
    .getOrCreate()

# read data from hdfs 
data = spark.read.text(hdfs_path).cache()

# print the data
print(data.collect())

# stop the session 
spark.stop()
