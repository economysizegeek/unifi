
define build_unifi=
endef

define build_busybox =
endef
.PHONY: clean build dist unifi busybox fetch_docker

build: fetch_docker dist unifi

fetch_docker: 
				docker pull droboports/compiler

dist: 
				mkdir -p ~/dist 
				chmod a+rw ~/dist

unifi: 
				rm -f ~/dist/unifi.tgz
				docker run --rm --volume ~/dist:/dist droboports/compiler  build https://github.com/economysizegeek/unifi.git 

busybox: 
				rm -f ~/dist/busybox.tgz
				docker run --rm --volume ~/dist:/dist droboports/compiler  build https://github.com/economysizegeek/busybox.git 


clean: 
				./build.sh clean
distclean: 
				rm -f ~/dist/*.tgz
				./build.sh distclean


package:
				./build.sh package

