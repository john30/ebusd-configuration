ebusd-configuration
===================

This repository serves vendor specific configuration files for ebusd:

> https://github.com/john30/ebusd


**WARNING**: There is absolutely no warranty at all for using any of the files
provided here and you should definitely know what you're doing.

**Otherwise: keep your hands off!!!**


Installation
------------

The right files for an existing environment need to be picked from the
directory corresponding to the used ebusd version (currently ebusd-1.1.x for
the ebusd master branch).

For all environments, the best way to find the necessary files is to start a
scan on the eBUS (see ebusd documentation).

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

The author can be contacted at ebusd@johnm.de .
