
GEM_NAME = thefox-pastebin

include Makefile.common

.PHONY: dev
dev:
	RUBYOPT=-w $(BUNDLER) exec ./bin/pastebin --help

.PHONY: test
test:
	RUBYOPT=-w $(BUNDLER) exec ./bin/pastebin --version
