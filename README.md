# unifi
# Currently builds version 5.3.11

This is a set of scripts to package dropbear from scratch into a DroboApp, i.e., download sources, unpackage, compile, install, and package in a TGZ file. The `master` branch contains the Drobo5N version, the `drobofs` branch contains the DroboFS version.

## I just want to install the DroboApp, what do I do?

Check the [releases](https://github.com/droboports/unifi/releases) page. If there are no releases available, then you have to compile.

## Inform Url

because of how the ports default - your url for inform (Needed for Security Gateways) is:

http://DROBO_IP:8883/inform

The Url for the portal is:

https://DROBO_IP:8043

## What if I need a non-standard IP on my Security Gateway?

The security gateway defaults to 192.168.1.1 . If that works for you - great. I use a different range.  It sounds like the proper way to do this is to set the network up in that range and then change it after adoption.

I tried something a little bit different. I ssh into the gateway - ubnt/ubnt is the default credentials.  

I added a virtual ip that is on the right network - but not the actual gateway address (I'm using the 192.168.10.x range with my controller at .245)- 

ifconfig eth1:0 192.168.10.2
set-inform http://192.168.10.245:8883/inform

Once it gets adopted it resets and changes eth1 to the correct gateway address.


## How to compile


This is going to follow the path of using Docker  - if you want to use a VM - First make sure that you have a [working cross-compiling VM](https://github.com/droboports/droboports.github.io/wiki/Setting-up-a-VM).

### If you don't have make installed
Test using busybox:

```
docker pull droboports/compiler
mkdir -p ~/dist
chmod a+rw ~/dist
docker run --rm --volume ~/dist:/dist droboports/compiler build https://github.com/economysizegeek/busybox.git 

```
```
docker pull droboports/compiler
mkdir -p ~/dist
chmod a+rw ~/dist
docker run --rm --volume ~/dist:/dist droboports/compiler build https://github.com/economysizegeek/unifi.git 

```

###If you do have make (Which you should!)

To test busybox

```
make fetch_docker
make dist
make busybox
```

To build unifi
```
make
```

Each invocation creates a log file with all the generated output.

* `./build.sh distclean` removes everything, including downloaded files.
* `./build.sh clean` removes everything but downloaded files.
* `./build.sh package` repackages the DroboApp, without recompiling.


## Upgrading

* rebuild the new version
* Stop the service on the drobo
* backup the unifi/data directory
* remove the old unif directory on the drobo
* copy the unifi.tgz to the DroboApps directory adn reboot the drobo
* Stop the service
* copy over the data directory
* start the service

## Upgrading firmware

I've had problems getting it to upgrade via this web interace -so instead I ssh to the AP/Gateway and issue 
* upgrade [url to firmware]

## Sources

* mongodb: http://facat.github.io/cross-compile-mongodb-for-arm.html
* unifi: https://www.ubnt.com/download/

<sub>**Disclaimer**</sub>

<sub><sub>Drobo, DroboShare, Drobo FS, Drobo 5N, DRI and all related trademarks are the property of [Data Robotics, Inc](http://www.drobo.com/). This site is not affiliated, endorsed or supported by DRI in any way. The use of information and software provided on this website may be used at your own risk. The information and software available on this website are provided as-is without any warranty or guarantee. By visiting this website you agree that: (1) We take no liability under any circumstance or legal theory for any DroboApp, software, error, omissions, loss of data or damage of any kind related to your use or exposure to any information provided on this site; (2) All software are made “AS AVAILABLE” and “AS IS” without any warranty or guarantee. All express and implied warranties are disclaimed. Some states do not allow limitations of incidental or consequential damages or on how long an implied warranty lasts, so the above may not apply to you.</sub></sub>
