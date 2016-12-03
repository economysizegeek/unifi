# unifi

This is a set of scripts to package dropbear from scratch into a DroboApp, i.e., download sources, unpackage, compile, install, and package in a TGZ file. The `master` branch contains the Drobo5N version, the `drobofs` branch contains the DroboFS version.

## I just want to install the DroboApp, what do I do?

Check the [releases](https://github.com/droboports/unifi/releases) page. If there are no releases available, then you have to compile.

## How to compile


This is going to follow the path of using Docker  - if you want to use a VM - First make sure that you have a [working cross-compiling VM](https://github.com/droboports/droboports.github.io/wiki/Setting-up-a-VM).

Test using busybox:

```
docker pull droboports/compiler
mkdir -p ~/dist
chmod a+rw dist
docker run --rm --volume ~dist:/dist droboports/compiler build https://github.com/economysizegeek/busybox.git 

```
```
docker pull droboports/compiler
mkdir -p ~/dist
chmod a+rw dist
docker run --rm --volume ~dist:/dist droboports/compiler build https://github.com/economysizegeek/unifi.git 

```

Each invocation creates a log file with all the generated output.

* `./build.sh distclean` removes everything, including downloaded files.
* `./build.sh clean` removes everything but downloaded files.
* `./build.sh package` repackages the DroboApp, without recompiling.

## Sources

* mongodb: http://facat.github.io/cross-compile-mongodb-for-arm.html
* unifi: https://www.ubnt.com/download/

<sub>**Disclaimer**</sub>

<sub><sub>Drobo, DroboShare, Drobo FS, Drobo 5N, DRI and all related trademarks are the property of [Data Robotics, Inc](http://www.drobo.com/). This site is not affiliated, endorsed or supported by DRI in any way. The use of information and software provided on this website may be used at your own risk. The information and software available on this website are provided as-is without any warranty or guarantee. By visiting this website you agree that: (1) We take no liability under any circumstance or legal theory for any DroboApp, software, error, omissions, loss of data or damage of any kind related to your use or exposure to any information provided on this site; (2) All software are made “AS AVAILABLE” and “AS IS” without any warranty or guarantee. All express and implied warranties are disclaimed. Some states do not allow limitations of incidental or consequential damages or on how long an implied warranty lasts, so the above may not apply to you.</sub></sub>
