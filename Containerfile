FROM ghcr.io/ublue-os/bazzite:stable

RUN curl -Lo /etc/yum.repos.d/rtl8821ce.repo \
    https://copr.fedorainfracloud.org/coprs/thopiekar/rtl8821ce/repo/fedora-$(rpm -E %fedora)/thopiekar-rtl8821ce-fedora-$(rpm -E %fedora).repo && \
    rpm-ostree install akmod-rtl8821ce && \
    rpm-ostree cleanup -m
