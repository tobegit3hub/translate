# translate makefile

binary = translate
binary_alias = t
prefix = /usr/local/
install_path = $(prefix)bin/
#document_path
#manpage_path

all:
	echo "translate doesn't need to built. Run `make install` to install it."

install:
	install ./src/translate.rb $(install_path)$(binary)
	install ./src/translate.rb $(install_path)$(binary_alias)

uninstall:
	rm -f $(install_path)$(binary)
	rm -f $(install_path)$(binary_alias)
