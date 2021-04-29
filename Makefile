VERSION = 0.1.0

PREFIX = /usr/local
#MANPREFIX = $(PREFIX)/share/man

# function names
IN  := xi
UP  := xu
REM := xr

options:
	@echo "xinst will be installed into: $(DESTDIR)$(PREFIX)/bin"
	@echo 'run `$$ make install`, to do so'
	@echo
	@echo 'functions will be named:'
	@echo "$(IN) for installing"
	@echo "$(UP) for updating"
	@echo "$(REM) for removing"

install:
	sed "s/version=/version=$(VERSION)/; s/in=/in=$(IN)/;  s/up=/up=$(UP)/; s/rem=/rem=$(REM)/" < xinst > $(DESTDIR)$(PREFIX)/bin/xinst
	chmod 755 $(DESTDIR)$(PREFIX)/bin/xinst
	ln -sf xinst $(DESTDIR)$(PREFIX)/bin/$(IN)
	ln -sf xinst $(DESTDIR)$(PREFIX)/bin/$(UP)
	ln -sf xinst $(DESTDIR)$(PREFIX)/bin/$(REM)

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/xinst
	rm -f $(DESTDIR)$(PREFIX)/bin/$(IN)
	rm -f $(DESTDIR)$(PREFIX)/bin/$(UP)
	rm -f $(DESTDIR)$(PREFIX)/bin/$(REM)

link:
	ln -rf xinst $(IN)
	ln -rf xinst $(UP)
	ln -rf xinst $(REM)

clean:
	rm -f $(IN)
	rm -f $(UP)
	rm -f $(REM)


.PHONY: install uninstall clean link all
