FROM ubuntu:latest
RUN apt-get update && \
    apt-get install -y sudo systemd systemd-sysv && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir -p /etc/systemd/system/container-getty@1.service.d && \
    echo "[Service]\nExecStart=\nExecStart=-/sbin/agetty --noclear -o '-p -- \\u' --keep-baud console 115200,38400,9600 vt220" > /etc/systemd/system/container-getty@1.service.d/override.conf
COPY script.sh /usr/local/bin/user_management.sh
RUN chmod +x /usr/local/bin/user_management.sh
COPY user_management.service /etc/systemd/system/user_management.service
RUN systemctl enable user_management.service
RUN systemctl mask dev-hugepages.mount sys-fs-fuse-connections.mount systemd-remount-fs.service
WORKDIR /root
VOLUME ["/sys/fs/cgroup"]
CMD ["/lib/systemd/systemd"]

