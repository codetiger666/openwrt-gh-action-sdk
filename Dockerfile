ARG CONTAINER=ghcr.io/openwrt/sdk
ARG ARCH=mips_24kc
FROM $CONTAINER:$ARCH

LABEL "com.github.actions.name"="OpenWrt SDK"

ADD include/ /usr/include/

ADD entrypoint.sh /
COPY --chmod=755 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
