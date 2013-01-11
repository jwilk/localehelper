name = localehelper
version = $(shell head -n1 changelog | cut -d ' ' -f2 | tr -d '()')

.PHONY: all
all: $(name).1

%.1: %.pod changelog
	pod2man --utf8 -c '' -r '$(name) $(version)' $(<) $(@)

.PHONY: clean
clean:
	rm -f *.1

# vim:ts=4 sw=4 noet
