# Copyright © 2018-2021 Jakub Wilk <jwilk@jwilk.net>
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the “Software”), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

PERL = perl

PREFIX = /usr/local
DESTDIR =

bindir = $(PREFIX)/bin
mandir = $(PREFIX)/share/man

.PHONY: all
all: ;

.PHONY: install
install: localehelper
	install -d $(DESTDIR)$(bindir)
	perl -MConfig -p -e '$$. == 1 and s/#!.*/$$Config{startperl}/' \
		$(<) > $(<).tmp
	install $(<).tmp $(DESTDIR)$(bindir)/$(<)
	rm $(<).tmp
ifeq "$(wildcard doc/localehelper.1)" ""
	# run "$(MAKE) -C doc" to build the manpage
else
	install -d $(DESTDIR)$(mandir)/man1/
	install -m644 doc/$(<).1 $(DESTDIR)$(mandir)/man1/$(<).1
endif

.PHONY: test
test:
	prove --verbose

.PHONY: test-installed
test-installed: $(or $(shell command -v localehelper;),$(bindir)/localehelper)
	LOCALEHELPER_TEST_TARGET=localehelper prove --verbose

.PHONY: clean
clean:
	rm -f *.tmp

.error = GNU make is required

# vim:ts=4 sts=4 sw=4 noet
