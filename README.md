xinst
-----

Provides an fzf menu to easily search for and install/remove packages, also update.
It does so through a multicall script (similarly to the busybox binary).

Usage
-----

To search for a package to install, run xf, choose one (or more) and press Enter.
To search for a package to remove, run xr, choose one (or more) and press Enter.
To update run xu (all packages).

See [Configuring](#configuring) on how to change the names of these functions.


Installing
----------

Simply running `# make install` will install xinst into /usr/local/bin. Installation prefix can be tweaked by passing a `$PREFIX` variable to `make install`.


Configuring
-----------

By default the 3 functions are named xi, xu and xr, to install, remove and update respectively.
They can be changed by editing the makefile's 3 variables, $(IN), $(UP) and $(REM).

Note: it's not a good idea to change those variables before first uninstalling xinst, because the uninstall rule uses them.
First `make uninstall` and only then change them.

TODO
----

## Maybe support multiple package managers at the same time?

xbps <pkg> <version>
flatpak <pkg> <version>
other_pkg_mngr <pkg> <version>

### How?

sort by first word
switch on first word of selection
sort into queues
install with one call to each pkg manager
[maybe it's time to move to a more robust lang?]

## Better preview

[*] xbps
[ ] apt

## More package managers

* flatpak
* pacman (arch)
* apk    (alpine)
* ????   (openSUSE)
