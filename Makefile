VERSION = 0.0.1

PREFIX = /usr/local
#MANPREFIX = $(PREFIX)/share/man

options:
	@echo "xinst will be installed into: $(DESTDIR)$(PREFIX)/bin"
	@echo 'run `$$ make install`, to do so'

install:
	sed "s/version=/version=$(VERSION)/" < xinst > $(DESTDIR)$(PREFIX)/bin/xinst
	chmod 755 $(DESTDIR)$(PREFIX)/bin/xinst
	ln -sf xinst $(DESTDIR)$(PREFIX)/bin/xi
	ln -sf xinst $(DESTDIR)$(PREFIX)/bin/xu
	ln -sf xinst $(DESTDIR)$(PREFIX)/bin/xr

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/xinst 
	rm -f $(DESTDIR)$(PREFIX)/bin/xi
	rm -f $(DESTDIR)$(PREFIX)/bin/xu
	rm -f $(DESTDIR)$(PREFIX)/bin/xr

link:
	ln -rf xinst xi
	ln -rf xinst xu
	ln -rf xinst xr

clean:
	rm -f xi
	rm -f xu
	rm -f xr


.PHONY: install uninstall clean link all
