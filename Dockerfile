ARG CONTAINER=ghcr.io/openwrt/sdk
ARG ARCH=mips_24kc
FROM $CONTAINER:$ARCH

LABEL "com.github.actions.name"="OpenWrt SDK"

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

ADD include/ /usr/include/
ADD lib/ /usr/lib/
ADD packages /

ADD entrypoint.sh /
COPY --chmod=755 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
