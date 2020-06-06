SOURCE="https://github.com/LightTable/LightTable/releases/download/0.8.1/lighttable-0.8.1-linux.tar.gz"
DESTINATION="build.tar.gz"
OUTPUT="LightTable.AppImage"

all:
	echo "Building: $(OUTPUT)"
	wget --output-document=$(DESTINATION) --continue $(SOURCE)
	tar -zxvf $(DESTINATION)

	rm -rf AppDir/opt
	mkdir --parents AppDir/opt/application
	cp -r lighttable-0.8.1-linux/* AppDir/opt/application

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)
	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf lighttable-0.8.1-linux
