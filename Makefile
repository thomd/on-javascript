DESTDIR ?= /usr/local
BINDIR = ${DESTDIR}/bin

install:
	install -d ${BINDIR}
	install -m 755 bin/litnode ${BINDIR}

uninstall:
	rm -f ${BINDIR}/litnode

.PHONY: install uninstall
