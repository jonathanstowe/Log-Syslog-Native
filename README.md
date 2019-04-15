# Log::Syslog::Native

Provide access to the Native syslog facility on Unix-like systems for Perl 6

[![Build Status](https://travis-ci.org/jonathanstowe/Log-Syslog-Native.svg?branch=master)](https://travis-ci.org/jonathanstowe/Log-Syslog-Native)

## Synopsis

```perl6
use Log::Syslog::Native;

my $logger = Log::Syslog::Native.new(facility => Log::Syslog::Native::Mail);

$logger.warning("Couldn't activate wormhole interface");
```

## Description

This provides a simple, perhaps naive,interface to the POSIX syslog facility
found on most Unix-like systems.

It should be enough to get you started with simple logging to your system's
log files, though exactly what files those might be and how they are logged
is a function of the system configuration and the exact logging software
that is being used.

This does not provide logging to a remote syslog server, nor does it provide
syslog style logging to platforms that do not provide a ''syslog()'' function
in their standard runtime library.

## Installation

Currently there is no dedicated test to determine whether your platform is
supported, the unit tests will simply fail horribly.

Assuming you have a working Rakudo Perl6 installation you should be able to
install this with *zef* :

    # From the source directory
   
    zef install .

    # Remove installation

    zef install Log::Syslog::Native

Other install mechanisms may be become available in the future.

## Support

Suggestions/patches are welcomed via github at:

https://github.com/jonathanstowe/Log-Syslog-Native/issues

I'm not able to test on a wide variety of platforms so any help there would be 
appreciated.

Things that I know don't work as of the current release are:

    * The built in sprintf is emulated because no varargs in NativeCall yet 

Help with these is explicitly invited.

## Licence

This is free software.

Please see the [LICENCE](LICENCE) file in the distribution.

© Jonathan Stowe 2015, 2016, 2017, 2019
