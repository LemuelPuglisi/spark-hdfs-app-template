# Spark w/ HDFS app template

## 

## Set up

Clone this repository and cd into it. Then run: 

```sh
$ docker-compose up -d 
```

Wait until all the containers are up. 



## Load data into HDFS

### Manually load the data

To manually load data into HDFS, copy your local data inside the namenode: 

```shell
$ docker cp /path/to/data/file.csv namenode:/dest/dir/file.csv
```

Then bash into namenode

```bash
$ docker exec -it namenode bash
```

Make a directory into HDFS

```bash
$ hdfs dfs -mkdir /input
```

Copy the data from the namenode to the HDFS directory

```bash
$ hdfs dfs -copyFromLocal /dest/dir/file.csv /input/
```

Now you can access to this file at from other containers  using the URI "hdfs://namenode:9000/input/file.csv". 



### Automatically load the data

Still working on this section. Anyway, if you run: 

```bash
$ ./upload.sh /path/to/file.csv file.csv
```

this will upload your file.csv into a directory called "input" in HDFS. 



## Write a python app

Look at the example.app.py in /src folder. If you need some python libraries, add them into requirements.txt, they will be installed using pip. Make sure your application name is "app.py" (just for now).  

To test your application run:

```bash
$ ./exec.sh
```

