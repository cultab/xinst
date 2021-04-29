
xinst
-----

Provides an fzf menu to easily search for and install/remove packages, also. It does so through a multicall script (similarly to the busybox binary).

Usage
-----

To install a package, run xi, search from the pool of available packages and select some.
To remove, run xr, search from the pool of installed packages and select some.
To update the system run xu (all packages).

See #Configuring on how to change the names of these functions.


Installing
----------

Simply running `# make install` will install xinst into /usr/local/bin. Instalation prefix can be tweaked by passing a `$PREFIX` variable to `make install`.


Configuring
-----------

By default the 3 functions are named xi, xu and xr, to install, remove and update respectively.
They can be changed by editing the makefile's 3 variables, \$(IN), \$(UP) and \$(REM).

Note: it's not a good idea to change those variables before first uninstalling xinst, because the uninstall rule uses them.
First `make uninstall` and only then change them.

