PACKAGE = kanso-bootstrap
BUILDDIR = dist
CHECKOUTDIR = bootstrap

all: init build

build:	
	mkdir -p $(BUILDDIR)/bootstrap/{less,js,ico}
	rm -rf $(CHECKOUTDIR)/dist/*
	git submodule update --remote
	cd $(CHECKOUTDIR); npm install; npm install grunt-cli; node_modules/grunt-cli/bin/grunt dist
	cp kanso.json README.md $(BUILDDIR)
	cp -rp $(CHECKOUTDIR)/less/* $(BUILDDIR)/bootstrap/less
	cp -rp $(CHECKOUTDIR)/js/*.js $(BUILDDIR)/bootstrap/js
	cp -rp $(CHECKOUTDIR)/dist/js/*.js $(BUILDDIR)/bootstrap/js
	cp $(CHECKOUTDIR)/LICENSE \
	   $(CHECKOUTDIR)/README.md \
	   $(BUILDDIR)/bootstrap/

init: 
	git submodule init
	git submodule update --remote

deploy:
	kanso publish $(BUILDDIR)

redeploy:
	kanso publish -f $(BUILDDIR)

clean: 
	rm -rf $(BUILDDIR)
