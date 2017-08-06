FROM nvidia/cuda:8.0-cudnn5-devel-ubuntu16.04
MAINTAINER Krishna Kalyan <krishnakalyan3@gmail.com>

EXPOSE 6006 80 8080 8088 8089

RUN apt-get update && apt-get install -y
RUN	apt-get update --fix-missing -y
RUN apt-get --assume-yes install python3-pip python-dev
RUN apt-get --assume-yes install tmux build-essential gcc g++ make binutils htop screen
RUN apt-get --assume-yes install software-properties-common unzip tree wget vim git

ENV LANG=C.UTF-8
RUN pip3 install http://download.pytorch.org/whl/cu80/torch-0.1.12.post2-cp35-cp35m-linux_x86_64.whl
ADD requirements.txt /tmp/requirements.txt
RUN pip3 install -r /tmp/requirements.txt

# docker build -t dl:python3 .

# nvidia-docker run -it --rm -v `pwd`:`pwd` floydhub/dl-docker /bin/bash
# nvidia-docker run  -d --name krishna_new -it -v `pwd`:`pwd` krishnakalyan3/dl_docker:latest /bin/bash
# from IPython.display import FileLink, FileLinks
# docker run -it 8dbd9e392a96 /bin/bash

# Stop and remove all containers and images
# docker stop $(docker ps -a -q)
# docker rm $(docker ps -a -q)
# docker rmi $(docker images -a -q)

# docker run -it -v /Users/krishna/MOOC/DL:`pwd` 46d01b0f61b7 /bin/bash

# docker run --rm --name Hadoop -h hadoop \
#-p 8088:8088 -p 8042:8042 -p 50070:50070 -p 8888:8888 -p 4040:4040 \
#-v $HOME/notebooks:/root/notebooks \
#-ti izone/hadoop:ecosystem bash

# nvidia-docker run -it --name krishna --rm -v `pwd`:`pwd` floydhub/dl-docker:gpu /bin/bash x
# nvidia-docker run -it --name krishna --rm -v `pwd`:`pwd` krishnakalyan3/dl_docker /bin/bash