FROM ghcr.io/ublue-os/bazzite:stable

RUN rpm-ostree install gc bc dkms kernel-devel-$(uname -r) git && \
    git clone https://github.com/tomaspinho/rtl8821ce /tmp/rtl8821ce && \
    cd /tmp/rtl8821ce && \
    make && make install && \
    rm -rf /tmp/rtl8821ce && \
    touch /etc/modprobe.d/blacklist.conf && \
    echo "blacklist rtw88_8821ce" >> /etc/modprobe.d/blacklist.conf && \
    rpm-ostree cleanup -m
