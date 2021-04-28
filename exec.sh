#bin/bash

docker rm my-spark-app

docker build --rm -t bde/spark-app .

docker run --name my-spark-app \
    -e ENABLE_INIT_DAEMON=false \
    --link spark-master:spark-master \
    --net sparklab_dockerspark_default \
    -it bde/spark-app