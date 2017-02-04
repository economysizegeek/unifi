UNIFI_VERSION=$(shell grep UNIFI_VERSION= app.sh |sed 's/UNIFI_VERSION=//'|sed 's/"//g')
.PHONY: clean build dist unifi busybox fetch_docker

build: announce fetch_docker dist unifi

announce:
	@echo "Building Unifi Controllor ${UNIFI_VERSION}"

fetch_docker: 
				docker pull droboports/compiler

dist: 
				mkdir -p ~/dist 
				chmod a+rw ~/dist

unifi: 
				rm -f ~/dist/unifi.tgz
				rm -f ~/dist/unifi.${UNIFI_VERSION}.tgz
				docker run --rm --volume ~/dist:/dist droboports/compiler  build https://github.com/economysizegeek/unifi.git 
				mv ~/dist/unifi.tgz ~/dist/unifi.${UNIFI_VERSION}.tgz

busybox: 
				rm -f ~/dist/busybox.tgz
				docker run --rm --volume ~/dist:/dist droboports/compiler  build https://github.com/economysizegeek/busybox.git 


clean: 
				./build.sh clean
				rm -f ~/dist/unifi.${UNIFI_VERSION}.tgz

distclean: 
				rm -f ~/dist/*.tgz
				./build.sh distclean


package:
				./build.sh package

