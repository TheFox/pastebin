
GEM_NAME = thefox-pastebin

include Makefile.common

.PHONY: test
test:
	RUBYOPT=-w $(BUNDLER) exec ./bin/pastebin --version
