#!/bin/bash
#Install Podman and Podman compose RHEL 9
sudo yum install -y  https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
sudo yum install -y podman podman-compose
podman -v
# Podman is now installed
read -p "This is first section, do you want to continue y/n: "
if [ "$REPLY" == "n" ]; then exit 1; fi

ls -la ~
podman image ls
podman container ls
podman container ls -a
podman container run -it hello
podman image ls
podman container ls
podman continer ls -a
ls -la ~
tree ~/.local
cat /etc/containers/registries.conf
grep "hello" /etc/containers/registries.conf.d/000-shortnames.conf
podmam image search fedora
podman image search ubuntu
podman image pull docker.io/library/fedora
podman image pull docker.io/library/ubuntu
podman image ls
podman image inspect fedora
podman image inspect fedora --format "{{json .Config}}"
podman image inspect fedora --format "{{json .Config.Cmd}}"
read -p "This is 2nd section, do you want to continue y/n: "
if [ "$REPLY" == "n" ]; then exit 1; fi

sudo yum install -y skopeo
skopeo inspect docker://docker.io/library/ubuntu:latest
skopeo inspect  --format "{{.RepoTags}}" docker://docker.io/library/ubuntu:latest
skopeo inspect  --format "{{.RepoTags}}" docker://docker.io/library/ubuntu:latest | tr ' ' '\n'
podman image pull docker.io/ubuntu:focal
podman image pull docker.io/fedora:38
podman image ls
podman container run --rm -dit --name ubuntu --hostname ubuntu ubuntu:focal
podman container ls
podman container stop ubuntu

read -p "This is 3rd section, do you want to continue y/n: "
if [ "$REPLY" == "n" ]; then exit 1; fi
