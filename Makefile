
RM = rm -rf
VENDOR = vendor
BUNDLER = bundle


.PHONY: all
all: install

.PHONY: install
install: $(VENDOR)

.PHONY: update
update:
	$(BUNDLER) update

.PHONY: clean
clean:
	$(RM) $(VENDOR)
	$(RM) .bundle
	$(RM) Gemfile.lock

$(VENDOR):
	$(BUNDLER) install --path vendor/bundle
