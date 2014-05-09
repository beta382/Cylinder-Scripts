CONTROL = control
SCRIPTS_FLDR = scripts
PACKAGE = tmp.deb

PKG_ID = ` dpkg-deb -f tmp.deb Package `
PKG_VERSION = ` dpkg-deb -f tmp.deb Version `
PKG_ARCH = ` dpkg-deb -f tmp.deb Architecture `
PKG_FULLNAME = $(PKG_ID)_$(PKG_VERSION)_$(PKG_ARCH).deb

all:
	@echo "You probably wanted \`make package\`"

package: $(PACKAGE)

submission: $(PACKAGE)
	@mv tmp.deb $(PKG_FULLNAME)

$(PACKAGE):
	@mkdir -p tmp/DEBIAN
	@mkdir -p tmp/Library/Cylinder/Beta382
	@cp $(CONTROL) tmp/DEBIAN
	@cp -r $(SCRIPTS_FLDR)/* tmp/Library/Cylinder/Beta382
	@-dpkg-deb --build tmp
	@-rm -rf tmp

install: $(PACKAGE)
	dpkg -i $(PACKAGE)
	$(MAKE) clean

clean:
	@-rm -rf tmp
	@-rm -f *.deb

