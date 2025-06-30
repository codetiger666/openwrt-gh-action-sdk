# SPDX-License-Identifier: GPL-2.0-only

include $(TOPDIR)/rules.mk

PKG_NAME:=rust
PKG_VERSION:=1.87.0
PKG_RELEASE:=1

PKG_MAINTAINER:=codetiger
PKG_LICENSE:=Apache-2.0 MIT
PKG_LICENSE_FILES:=LICENSE-APACHE LICENSE-MIT

PKG_HOST_ONLY:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include ./rust-values.mk

define Package/rust
  SECTION:=lang
  CATEGORY:=Languages
  SUBMENU:=Rust
  TITLE:=Rust Programming Language Compiler
  URL:=https://www.rust-lang.org/
endef

define Package/rust/description
  Rust is a multi-paradigm, general-purpose programming language designed for performance
  and safety, especially safe concurrency. Rust is syntactically similar to C++, but can
  guarantee memory safety by using a borrow checker to validate references.
endef

define Host/Prepare
	# nothing to prepare
endef

define Host/Compile
	curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain $(PKG_VERSION) --no-modify-path
endef

define Host/Install
	mkdir -p $(STAGING_DIR)/host/bin && cp -ra $(HOME)/.cargo/bin/* $(STAGING_DIR)/host/bin/
	rustup target add $(ARCH)-unknown-linux-musl
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,rust))
