name = localehelper
uname = $(shell echo $(name) | tr a-z A-Z)
version = $(shell head -n1 changelog | cut -d ' ' -f2 | tr -d '()')

.PHONY: all
all: $(name).1

$(name).1: manpage.pod changelog
	perl -p -e 's/L<([a-z_-]+)[(]([0-9]+)[)]>/B<\1>(\2)/g' $(<) \
	| pod2man --utf8 -c '' -n $(uname) -r '$(name) $(version)' \
	> $(@).tmp
	mv $(@).tmp $(@)

.PHONY: test check
test check: manpage.pod
	podchecker -warnings -warnings $(<)

.PHONY: clean
clean:
	rm -f *.1 *.tmp

# vim:ts=4 sts=4 sw=4 noet
