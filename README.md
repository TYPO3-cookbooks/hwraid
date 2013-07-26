Description
===========

Monitoring tools for hardware RAID controllers, based on http://hwraid.le-vert.net/


Requirements
============

A hardware RAID controller


Usage
=====

Adaptec AAC-RAID (hwraid::adaptec-aac-raid)
-------------------------------------------

* Include the `hwraid::adaptec-aac-raid` recipe in your run list to installs the `arcconf` package from the _hwraid_ repo.
* See http://hwraid.le-vert.net/wiki/Adaptec for usage of AAC-RAID tools (`arcconf GETCONFIG 1` as a starting point)

LSI MegaRAID (hwraid::lsi-megaraid)
-----------------------------------

* Include the `hwraid::lsi-megaraid` recipe in your run list to install the packages `megacli` and `megactl` from the _hwraid_ repo.