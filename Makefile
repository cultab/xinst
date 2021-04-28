VERSION = 0.0.1

PREFIX = /usr/local
#MANPREFIX = $(PREFIX)/share/man

all: link

link: clean
	ln -s xinst xi
	ln -s xinst xu
	ln -s xinst xr

install: link
	sed "s/version=/version=$(VERSION)/" < xinst > $(DESTDIR)$(PREFIX)/bin/xinst
	chmod 755 $(DESTDIR)$(PREFIX)/bin/xinst
	cp xi $(DESTDIR)$(PREFIX)/bin
	cp xu $(DESTDIR)$(PREFIX)/bin
	cp xr $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/xinst 
	rm -f $(DESTDIR)$(PREFIX)/bin/xi
	rm -f $(DESTDIR)$(PREFIX)/bin/xu
	rm -f $(DESTDIR)$(PREFIX)/bin/xr

clean:
	rm -f xi
	rm -f xu
	rm -f xr


.PHONY: install uninstall clean link all
