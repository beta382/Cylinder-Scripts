.RECIPEPREFIX := >

CONTROL = control
SCRIPTS_FLDR = scripts

all:
> echo "You probably wanted \`make package\`"

package: clean
> mkdir -p tmp/DEBIAN; \
> mkdir -p tmp/Library/Cylinder/Beta382; \
> cp $(CONTROL) tmp/DEBIAN; \
> cp -r $(SCRIPTS_FLDR)/* $(PKG_FULLNAME)/Library/Cylinder/Beta382; \

clean:
> -rm -rf tmp

