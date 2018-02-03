# https://stackoverflow.com/a/18137056
proj_dir:=$(realpath $(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
plugin_dir:=$(proj_dir)/plugin
build_dir:=$(proj_dir)/plugin/build

ROOT_INSTALL:=$(HOME)/.local
PKG_CONFIG_PATH:=$(ROOT_INSTALL)/lib/pkgconfig
export PKG_CONFIG_PATH

all: $(build_dir)
	$(MAKE) -C $(build_dir)

install: $(build_dir)
	$(MAKE) -C $(build_dir) install

$(build_dir):
	autoreconf -i $(plugin_dir)
	mkdir -p $(build_dir)
	cd $(build_dir) && $(plugin_dir)/configure --prefix=$(ROOT_INSTALL)

uninstall: $(build_dir)
	$(MAKE) -C $(build_dir) uninstall

clean:
	git clean -dxf

run:
	rofi -plugin-path $(ROOT_INSTALL)/lib/rofi -show myplugin -modi myplugin
