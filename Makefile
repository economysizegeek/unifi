
define build_unifi=
docker run --rm --volume ~/dist:/dist droboports/compiler \
    build https://github.com/economysizegeek/unifi.git 
endef

define build_busybox =
docker run --rm --volume ~/dist:/dist droboports/compiler \
  build https://github.com/economysizegeek/busybox.git 
endef
define remove_tarballs =
rm -f ~/dist/*.tgz
endef

unifi: ; $(build_unifi)




busybox: ; $(build_buysbox)


clean: ; $(remove_tarballs)

.ONESHELL:
