VERSION = 0.3.0

PREFIX := /usr/local
#MANPREFIX = $(PREFIX)/share/man

# function names
IN  := xf
UP  := xu
REM := xr

options:
	@echo "xinst will be installed into: $(DESTDIR)$(PREFIX)/bin"
	@echo 'run `# make install`, to do so'
	@echo
	@echo 'functions will be named:'
	@echo "$(IN) for installing"
	@echo "$(UP) for updating"
	@echo "$(REM) for removing"

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	rm -f $(DESTDIR)$(PREFIX)/bin/xinst
	sed "s/version=dummy/version=$(VERSION)/; s/in=xi/in=$(IN)/;  s/up=xu/up=$(UP)/; s/rem=xr/rem=$(REM)/" < xinst > $(DESTDIR)$(PREFIX)/bin/xinst
	chmod 755 $(DESTDIR)$(PREFIX)/bin/xinst
	ln -sf xinst $(DESTDIR)$(PREFIX)/bin/$(IN)
	ln -sf xinst $(DESTDIR)$(PREFIX)/bin/$(UP)
	ln -sf xinst $(DESTDIR)$(PREFIX)/bin/$(REM)

	install xinst_parse_xbps $(DESTDIR)$(PREFIX)/bin/xinst_parse_xbps
	install xinst_parse_apt $(DESTDIR)$(PREFIX)/bin/xinst_parse_apt
	install xinst_display $(DESTDIR)$(PREFIX)/bin/xinst_display

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/xinst
	rm -f $(DESTDIR)$(PREFIX)/bin/$(IN)
	rm -f $(DESTDIR)$(PREFIX)/bin/$(UP)
	rm -f $(DESTDIR)$(PREFIX)/bin/$(REM)

	rm -f $(DESTDIR)$(PREFIX)/bin/xinst_parse_xbps
	rm -f $(DESTDIR)$(PREFIX)/bin/xinst_parse_apt
	rm -f $(DESTDIR)$(PREFIX)/bin/xinst_display

link:
	ln -rf xinst $(IN)
	ln -rf xinst $(UP)
	ln -rf xinst $(REM)

clean:
	rm -f $(IN)
	rm -f $(UP)
	rm -f $(REM)


.PHONY: install uninstall clean link all
