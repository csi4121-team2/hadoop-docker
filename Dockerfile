FROM ubuntu:22.04

RUN apt update -y && apt install -y openjdk-8-jdk ssh vim
RUN adduser --disabled-password --gecos "" hadoop

ARG HOME_DIR=/home/hadoop
WORKDIR ${HOME_DIR}
USER hadoop

RUN ssh-keygen -t rsa -N "" -f ${HOME_DIR}/.ssh/id_rsa
RUN cat ${HOME_DIR}/.ssh/id_rsa.pub >> ${HOME_DIR}/.ssh/authorized_keys
RUN chmod 640 $HOME_DIR/.ssh/authorized_keys

RUN wget https://dlcdn.apache.org/hadoop/common/hadoop-3.3.6/hadoop-3.3.6.tar.gz
RUN tar -xvzf hadoop-3.3.6.tar.gz
RUN rm hadoop-3.3.6.tar.gz
RUN mv hadoop-3.3.6 hadoop

ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
ENV HADOOP_HOME=/home/hadoop/hadoop
ENV HADOOP_INSTALL=$HADOOP_HOME
ENV HADOOP_MAPRED_HOME=$HADOOP_HOME
ENV HADOOP_COMMON_HOME=$HADOOP_HOME
ENV HADOOP_HDFS_HOME=$HADOOP_HOME
ENV HADOOP_YARN_HOME=$HADOOP_HOME
ENV HADOOP_COMMON_LIB_NATIVE_DIR=$HADOOP_HOME/lib/native
ENV PATH=$PATH:$HADOOP_HOME/sbin:$HADOOP_HOME/bin
ENV HADOOP_OPTS="-Djava.library.path=$HADOOP_HOME/lib/native"

RUN mkdir $HOME_DIR/configs
COPY configs/.bashrc $HOME_DIR/configs/.bashrc
COPY scripts/setup.sh $HOME_DIR/setup.sh
RUN cat $HOME_DIR/configs/.bashrc >> $HOME_DIR/.bashrc

RUN echo "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh
COPY configs/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
COPY configs/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
COPY configs/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml

RUN hdfs namenode -format

USER root

ENTRYPOINT [ "./setup.sh" ]
