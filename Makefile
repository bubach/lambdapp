DESTDIR :=
PREFIX := /usr/local
BINDIR := $(PREFIX)/bin

CC ?= clang
CFLAGS = -std=c11 -D_XOPEN_SOURCE=700 -Wall -Wno-sign-compare -Wextra -pedantic -O2
LDFLAGS =
SOURCES = $(shell echo *.c)
OBJECTS = $(SOURCES:.c=.o)
LAMBDAPP = lambdapp

all: $(LAMBDAPP)

$(LAMBDAPP): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

.c.o:
	$(CC) -c $(CFLAGS) $< -o $@

install:
	install -m755 $(LAMBDAPP) $(DESTDIR)$(BINDIR)/$(LAMBDAPP)

uninstall:
	rm -f $(DESTDIR)$(BINDIR)/$(LAMBDAPP)

clean:
	rm -f $(OBJECTS)
	rm -f $(LAMBDAPP)