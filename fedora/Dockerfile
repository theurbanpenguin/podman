FROM docker.io/library/fedora:38
RUN dnf install -y systemd openssh-clients openssh-server python3 vim ansible && dnf clean all
RUN systemctl enable sshd
RUN useradd -m tux -G wheel && echo 'tux:[Password1]' | chpasswd
COPY --chmod=600 tux /etc/sudoers.d/tux
EXPOSE 22
CMD ["/usr/sbin/init"]