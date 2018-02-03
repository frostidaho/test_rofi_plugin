ROOT_INSTALL:=$(HOME)/.local/
PKG_CONFIG_PATH:=$(ROOT_INSTALL)lib/pkgconfig
# PKG_CONFIG_PATH=$(HOME)/.local/lib/pkgconfig
export PKG_CONFIG_PATH

build:
	@echo ROOT_INSTALL=$(ROOT_INSTALL)
	@echo PKG_CONFIG_PATH=$(PKG_CONFIG_PATH)
	autoreconf -i plugin/
	mkdir -p plugin/build
	cd plugin/build && ../configure --prefix=$(ROOT_INSTALL)

clean:
	git clean -dxf

