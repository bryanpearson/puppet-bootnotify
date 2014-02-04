puppet-bootnotify
==================

A Puppet module for managing the installation and configuration of the boot-notify service.

## Reasoning

Based on Bitly's [10 Things We Forgot to Monitor](http://word.bitly.com/post/74839060954/ten-things-to-monitor), this simple module installs a small service that emails a given email address upon boot.

I'll let Bitly explain it better than I could: 

"Unexpected reboots are part of life. Do you know when they happen on your hosts? Most people don’t. We use a simple init script that triggers an ops email on system boot. This is valuable to communicate provisioning of new servers, and helps capture state change even if services handle the failure gracefully without alerting."

## Usage

This module exposes a few simple configurable options, for example 
the SMTP server address and to/from addresses. For the simple installation :

    class { 'bootnotify':
      from_address      => "noreply@example.com",
      to_address        => "youraddress@example.com",
      smtp_server       => "smtp.example.com",
      python_file_dir   => "/usr/local/bin",
    }

## Considerations

This module has been tested on Debian 6 & 7. *Should* work on Ubuntu also.