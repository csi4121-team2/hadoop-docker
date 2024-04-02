#!/bin/bash
docker rm -f hadoop_single_node
docker rmi -f hadoop
docker build -t hadoop .
docker run -dit --name hadoop_single_node -p 9870:9870 hadoop
