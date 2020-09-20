ebusd-configuration
===================

This repository serves vendor specific configuration files for ebusd:

> https://github.com/john30/ebusd


**WARNING**: There is absolutely no warranty at all for using any of the files
provided here and you should definitely know what you're doing.

**Otherwise: keep your hands off!!!**


Usage with ebusd version 3.2 or higher
--------------------------------------

If you're using [ebusd in version 3.2](https://github.com/john30/ebusd/tree/v3.2) or higher, you can simply use the default option for the location of the configuration files that are served by ebusd.eu (see ["--configpath" option](https://github.com/john30/ebusd/wiki/2.-Run#message-configuration-options)).  

**Note**: Only the files linked to by the [`latest`](https://github.com/john30/ebusd-configuration/blob/master/latest) folder are served there for the time being.  

Due to this new feature, no more packaged releases of this repository will be generated in future. If you intend to work on the configuration yourself, simply checkout this repository and point ebusd to your local folder with the latest version.

The current status of and latest changes to the files on ebusd.eu (as linked to by the [`latest`](https://github.com/john30/ebusd-configuration/blob/master/latest) folder) are stated in the [ChangeLog](https://github.com/john30/ebusd-configuration/blob/master/ChangeLog.md).


Installation on up-to-date ebusd (2.0 or higher)
------------------------------------------------

If you're on a Debian system, simply pick the [latest configuration release](https://github.com/john30/ebusd-configuration/releases) and install it in your preferred language, or follow the hint below in order to get the most up-to-date files by checking out this repository.  
For other OS's, the latest release also contains a tgz for easy copying to your /etc/ebusd directory.

**Important hint:**
In order to get the most up-to-date configuration files, simply checkout this repository and link the ebusd-2.1.x/de or ebusd-2.1.x/en folder to /etc/ebusd. On the command line you'd have to execute the following steps:

```
git clone https://github.com/john30/ebusd-configuration.git
if [ -d /etc/ebusd ]; then sudo mv /etc/ebusd /etc/ebusd.old; fi
sudo ln -s $PWD/ebusd-configuration/ebusd-2.1.x/de /etc/ebusd
```

Starting with ebusd 2.0, the daemon is able to pick the right configuration files for your devices when started with the [--scanconfig](https://github.com/john30/ebusd/wiki/2.-Run#message-configuration-options) parameter and when using CSV files from either the [ebusd-2.1.x/de](https://github.com/john30/ebusd-configuration/tree/master/ebusd-2.1.x/de) or the [ebusd-2.1.x/en](https://github.com/john30/ebusd-configuration/tree/master/ebusd-2.1.x/en) directory.

For each seen device on the bus, ebusd will pick the best suiting file from the manufacturer subdirectory after reading the device's identification.

The CSV file is picked from the manufacturer directory by using the slave address (the two hex digits prefix of the CSV file name), the identification part converted to lower case and with spaces removed (and also trailing "0" removed up to two times, the next part of the CSV file name between dots), and optionally by software and/or hardware version number (when the CSV file name contains a ".HWvvvv" or ".SWvvvv" part).

So, e.g. for the scan result  
`08;Vaillant;EHP00;0327;7201`  
which is slave address 0x08, manufacturer 0xB5 (=Vaillant), identification "EHP00", software version "03.27" and hardware version "72.01", ebusd will load the file [vaillant/08.ehp.csv](https://github.com/john30/ebusd-configuration/blob/master/ebusd-2.1.x/de/vaillant/08.ehp.csv) (from either [ebusd-2.1.x/de](https://github.com/john30/ebusd-configuration/tree/master/ebusd-2.1.x/de) or [ebusd-2.1.x/en](https://github.com/john30/ebusd-configuration/tree/master/ebusd-2.1.x/en) used as configuration directory).


Installation on older ebusd (until 1.3)
------------------------------------------------

The right files for an existing environment need to be picked from the
directory corresponding to the used ebusd version (currently [ebusd-1.x.x](https://github.com/john30/ebusd-configuration/tree/master/ebusd-1.x.x) for
the ebusd master branch).

For all environments, the best way to find the necessary files is to start a
scan on the eBUS, see [ebusd scan documentation](https://github.com/john30/ebusd/wiki/3.-Commands#scan).

Depending on the scan result, pick the files suitable for your environment
from the names given by the third column of the scan result, e.g.:

> 08;Vaillant;BAI00;0703;7401  
> 15;Vaillant;UI   ;0501;6201  

For this scan result, pick the following files from the vendor directory
(second column) with your language preference:

> vaillant_de/bai.csv  
> vaillant_de/ui.csv  

In order to use these files, the "_templates.csv" file is required as well
(if available in the vendor directory). 

**Please note:** due to a corrected data type in the [_templates.csv](https://github.com/john30/ebusd-configuration/blob/master/ebusd-1.x.x/vaillant_de/_templates.csv) for [vaillant_de](https://github.com/john30/ebusd-configuration/tree/master/ebusd-1.x.x/vaillant_de), at least [ebusd 1.3.0](https://github.com/john30/ebusd/tree/v1.3.0) is required to use these files.

Some devices share the same prefix (e.g. "ehp.*"). This is due to the fact
that the same physical unit can contain several circuits. Here is a list of
suffixes used and the corresponding circuits:

* ".bc": burner circuit
* ".hc": heating circuit
* ".mc": mixer circuit
* ".hwc": hot water circuit
* ".cc": circulation circuit
* ".sc": solar circuit

Mixers and room controllers  usually are available for more than one heating
circuit. If so, these files are available multiple times with the heating
circuit number appended, e.g. "mc2.4.csv" for heating circuit 4. For the
primary heating circuit the number is not appended, though.

For some devices, there are several variants of the same circuit. For
example, the mixer might be available as fix value or real mixer circuit.
Variants for the same device are indicated by a suffix starting with an
underscore "_" and only one variant can be picked from those.


Contact
-------

The author can be contacted at ebusd@ebusd.eu .
