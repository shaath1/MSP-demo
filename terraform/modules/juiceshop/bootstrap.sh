#!/bin/bash

sleep 30

snap install docker
systemctl enable snap.docker.dockerd
systemctl start snap.docker.dockerd

sleep 30

docker run -d -p 80:80 --net host \
    --restart always \
    --name juiceshop \
    bkimminich/juice-shop
