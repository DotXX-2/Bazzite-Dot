FROM ghcr.io/ublue-os/bazzite:stable

RUN rpm-ostree install akmods dkms kernel-devel git && \
    git clone https://github.com/tomaspinho/rtl8821ce /tmp/rtl8821ce && \
    cp -r /tmp/rtl8821ce /usr/src/rtl8821ce-1.0 && \
    akmods --force && \
    rm -rf /tmp/rtl8821ce && \ 
    touch /etc/modprobe.d/blacklist.conf && \
    echo "blacklist rtw88_8821ce" >> /etc/modprobe.d/blacklist.conf && \
    rpm-ostree cleanup -m
