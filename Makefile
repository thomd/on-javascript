DESTDIR ?= /usr/local
BINDIR = ${DESTDIR}/bin

install:
	install -d ${BINDIR}
	install -m 755 bin/litjs ${BINDIR}

uninstall:
	rm -f ${BINDIR}/litjs

.PHONY: install uninstall
