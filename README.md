# ebusd-configuration

This repository serves vendor specific configuration files for [ebusd](https://github.com/john30/ebusd).


**WARNING**: There is absolutely no warranty at all for using any of the files
provided here and you should definitely know what you're doing.

If you mess up these files or even just a single line in one of them, you might force your heating to weird behaviour or at the worst even damage it.

**If you don't know what you're doing: better keep your hands off!!!**


## Usage with ebusd

Since [ebusd version 3.2](https://github.com/john30/ebusd/tree/v3.2), the default for the location of the configuration files (see ["--configpath" option](https://github.com/john30/ebusd/wiki/2.-Run#message-configuration-options)) is the web service at https://cfg.ebusd.eu/ .

**Note**: For the time being, only the files linked to by the [`latest`](https://github.com/john30/ebusd-configuration/blob/master/latest) folder are served. The other folders are kept for historic reasons.

The current version being released to the web service is published on the [web service entry page](https://cfg.ebusd.eu/) itself and usually follows the latest entry of the [ChangeLog](https://github.com/john30/ebusd-configuration/blob/master/ChangeLog.md).


### Using a clone

In case a different branch or version is supposed to be used, simply clone this repository (or the fork) and point ebusd to the ebusd-2.1.x/de or ebusd-2.1.x/en folder of the cloned directory using the ["--configpath" option](https://github.com/john30/ebusd/wiki/2.-Run#message-configuration-options).


## Scan mechanism
As a central heating system usually consist of several components, there is a dedicated file for each of those and maybe even for different hardware/software versions of it.

This is reflected by the file name as well as conditional messages within a file.

For each seen device on the bus, ebusd will pick the best suiting file from the manufacturer subdirectory after reading the device's identification.
See also the [ebusd scan documentation](https://github.com/john30/ebusd/wiki/3.-Commands#scan) for details.

The CSV file is then picked like this:
* manufacturer subdirectory
* target address: two hex digits prefix of the CSV file name
* ID part: converted to lower case, trimmed (leading/trailing spaces removed as well as up to two trailing "0" digits), remaining spaces replaced by underscore
* optional component type suffix, see below
* optional software and/or hardware version suffix (e.g. ".HWvvvv" or ".SWvvvv").
* extension: `.csv`

So, e.g. for the scan result  
`08;Vaillant;EHP00;0327;7201`  
which is
* target address: 0x08
* manufacturer 0xB5: Vaillant
* device id: "EHP00"
* software version: "03.27"
* hardware version "72.01"

ebusd will load the file `vaillant/08.ehp.csv` from either [ebusd-2.1.x/de](https://github.com/john30/ebusd-configuration/blob/master/ebusd-2.1.x/de/vaillant/08.ehp.csv) or [ebusd-2.1.x/en](https://github.com/john30/ebusd-configuration/blob/master/ebusd-2.1.x/en/vaillant/08.ehp.csv) being used as configuration directory.

Some devices share the same prefix (e.g. "ehp.*"). This is due to the fact
that the same physical unit can contain several logical circuits.


## Component type names

In the configuration files, some of the following component type names (`circuits`) are used frequently:

* `bc`: burner circuit
* `hc`: heating circuit
* `mc`: mixer circuit
* `hwc`: hot water circuit
* `cc`: circulation circuit
* `sc`: solar circuit

These are sometimes also used as suffix in filenames (e.g. `23.ehp.cc.csv`) in order to note the component type as replacement for the device identifier not revealing the type in the first place.

For a single heating installation, a component type may be present in several instances (e.g. two mixers). In case these share the exact same message definitions (besides a different target address), this is reflected here as symbolic link to the `main` definition file.

Mixers and room controllers usually are available for more than one heating
circuit. If so, these files are available multiple times with the heating
circuit number appended, e.g. "mc2.4.csv" for heating circuit 4. For the
primary heating circuit the number is not appended, though.


## Working on the definitions
For many years, the CSV file based definitions served a good purpose. However, these are rather hard to read and understand and as such, there is a new approach of working with message defintions.

Please refer to the [guidelines for details](guidelines.md).


## Contact

The author can be contacted at ebusd@ebusd.eu .
