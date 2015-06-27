include $(TOPDIR)/rules.mk
PKG_NAME:=pyspidev
PKG_VERSION:=3.0
PKG_RELEASE:=1
PKG_SOURCE:=spidev-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://pypi.python.org/packages/source/s/spidev/
PKG_MD5SUM:=06a4f20ad3fb108b719bf4fcc5126607
PKG_BUILD_DIR:=$(BUILD_DIR)/spidev-$(PKG_VERSION)
PKG_BUILD_DEPENDS:=python
include $(INCLUDE_DIR)/package.mk
$(call include_mk, python-package.mk)
define Package/pyspidev
  SUBMENU:=Python
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=pyspidev
  URL:=http://pypi.python.org/pypi/spidev/
  DEPENDS:=+python +libstdcpp
endef

define Package/pyspidev/description
  Python bindings for Linux SPI access through spidev
endef

define Build/Compile
	$(call Build/Compile/PyMod,, install  --prefix="$(PKG_INSTALL_DIR)/usr")
endef

define Package/pyspidev/install
	$(INSTALL_DIR) $(1)$(PYTHON_PKG_DIR)
	$(CP) \
		$(PKG_INSTALL_DIR)$(PYTHON_PKG_DIR)/* \
		$(1)$(PYTHON_PKG_DIR)
endef

$(eval $(call BuildPackage,pyspidev))
