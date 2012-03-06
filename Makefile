PACKAGE = kanso-bootstrap
BUILDDIR = dist
CHECKOUTDIR = bootstrap

all: init build

build:	
	mkdir -p $(BUILDDIR)/bootstrap/{less,img,js,docs}
	cp kanso.json README.md $(BUILDDIR)
	cp -rp $(CHECKOUTDIR)/less/* $(BUILDDIR)/bootstrap/less
	cp -rp $(CHECKOUTDIR)/img/* $(BUILDDIR)/bootstrap/img
	cp -rp $(CHECKOUTDIR)/js/*.js $(BUILDDIR)/bootstrap/js
	cp -rp $(CHECKOUTDIR)/docs/* $(BUILDDIR)/bootstrap/docs
	cp $(CHECKOUTDIR)/LICENSE \
	   $(CHECKOUTDIR)/README.md \
	   $(BUILDDIR)/bootstrap/

init: 
	git submodule init
	git submodule update

deploy:
	kanso publish dist

redeploy:
	kanso publish -f dist

clean: 
	rm -rf $(BUILDDIR)
