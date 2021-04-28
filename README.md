
xinst
-----

Provides an fzf menu to easily search for and install/remove packages, also. It does so through a multicall script (similarly to the busybox binary).

Usage
-----

To install a package, run xi and search from the pool of available packages and select some.
To remove, run xr and search from the pool of installed packages and select some.
To update the system xu.


Installing
----------

Simply running `# make install` will install xinst into /usr/local/bin. Instalation prefix can be tweaked by passing a `$PREFIX` variable to `make install`.

