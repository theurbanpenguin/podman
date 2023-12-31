#!/bin/bash
#Install Podman and Podman compose RHEL 9
sudo yum install -y  https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
sudo yum install -y podman podman-compose
read -p "This is the end of the first section, do you want to continue y/n: "
if [ "$REPLY" == "n" ]; then exit 1; fi

podman container run -it hello
podman image pull docker.io/library/fedora
podman image pull docker.io/library/ubuntu
read -p "This is the end of the 2nd section, do you want to continue y/n: "
if [ "$REPLY" == "n" ]; then exit 1; fi

sudo yum install -y skopeo
skopeo inspect docker://docker.io/library/ubuntu:latest
skopeo inspect  --format "{{.RepoTags}}" docker://docker.io/library/ubuntu:latest | tr ' ' '\n'
podman image pull docker.io/ubuntu:focal
podman image pull docker.io/fedora:38
podman container prune -f

read -p "This is the end of the 3rd section, do you want to continue y/n: "
if [ "$REPLY" == "n" ]; then exit 1; fi

sudo yum install -y w3m
podman image pull docker.io/ubuntu/apache2
chcon -Rt container_file_t /home/tux/podman/www
podman container run -d --name www -e TZ='Europe/London' -p 8080:80 -v /home/tux/podman/www:/var/www/html apache2:latest
podman container rm -f www

read -p "This is the end of the 5th section, do you want to continue y/n: "
if [ "$REPLY" == "n" ]; then exit 1; fi

sudo setsebool -P container_manage_cgroup true
