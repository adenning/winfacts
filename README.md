winfacts
========

A puppet module that adds new facts for Windows nodes.

* computer_model
* monitor_description
* monitor_id
* monitor_resolution
* motherboard_manufacturer
* motherboard_product
* motherboard_serialnumber
* motherboard_version
* os_architecture
* soundcard_description
* soundcard_manufacturer
* videocard_currentrefreshrate
* videocard_description
* videocard_driver_version
* videocard_maxrefreshrate
* videocard_memory

notes
=====
In cases of multiple monitors, videocards, etc., only the first result is used at this time.

todo
====

Many if not all of these should be cached, but the :ttl option is not available for the version of Facter that ships with current Puppet. These should probably use a custom caching mechanism for now.
