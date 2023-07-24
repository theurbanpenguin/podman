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

podman container ls -a --format "{{.Names}}"
podman container start $(podman container ls -a --format "{{.Names}}")
podman container logs $(podman container ls -a --format "{{.Names}}")
podman container prune -f