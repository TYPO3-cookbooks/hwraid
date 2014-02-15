Description
===========

Monitoring tools for hardware RAID controllers, based on http://hwraid.le-vert.net/


Requirements
============

A hardware RAID controller


Usage
=====

Autodetect
----------

Unless disabled (attribute `node[:hwraid][:use_autodetect]`), this cookbook automatically detects the used RAID controllers
and includes the accordant recipe(s).

In case you want to manually specify, which RAID tools to add, simply include one of the following recipes.

Adaptec AAC-RAID (hwraid::adaptec-aac-raid)
-------------------------------------------

* Include the `hwraid::adaptec-aac-raid` recipe in your run list to installs the `arcconf` package from the _hwraid_ repo.
* See http://hwraid.le-vert.net/wiki/Adaptec for usage of AAC-RAID tools (`arcconf GETCONFIG 1` as a starting point)

LSI MegaRAID (hwraid::lsi-megaraid)
-----------------------------------

* Include the `hwraid::lsi-megaraid` recipe in your run list to install the packages `megacli` and `megactl` from the _hwraid_ repo.

HP SmartArray (hwraid::hp-smartarray)
-----------------------------------

* Include the `hwraid::hp-smartarray` recipe in your run list to install the packages `cciss-vol-status` and `hpacucli` from the _hwraid_ repo.