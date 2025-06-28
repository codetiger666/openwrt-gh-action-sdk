# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NAME:=rust
PKG_VERSION:=1.28.2
PKG_RELEASE:=1

PKG_MAINTAINER:=codetiger
PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

PKG_HOST_ONLY:=1

include $(INCLUDE_DIR)/host-build.mk

define Host/Prepare
	# nothing to prepare
endef

define Host/Compile
	curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain $(PKG_VERSION) --no-modify-path
endef

define Host/Install
	mkdir -p $(STAGING_DIR)/host/bin && cp -ra $(HOME)/.cargo/bin/* $(STAGING_DIR)/host/bin/
endef

$(eval $(call HostBuild))
