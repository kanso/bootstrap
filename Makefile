# first clone and checkout target version, e.g.
# git clone https://github.com/twitter/bootstrap.git
# git checkout v2.0.1

PACKAGE = bootstrap
BUILDDIR = dist
CHECKOUTDIR = bootstrap

all: build

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

clean: 
	rm -rf $(BUILDDIR)
