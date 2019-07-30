#!/bin/bash
#Portable DEB build script; V4L_Frontend binary needs to be in working directory
version=1.12
revision=0
debname="viper4linux-gui_"$version-$revision
mkdir $debname
mkdir $debname"/DEBIAN"
mkdir -p $debname"/usr/local/bin"
mkdir -p $debname"/usr/share/applications"
mkdir -p $debname"/usr/share/pixmaps"
cp "V4L_Frontend" $debname"/usr/local/bin/viper-gui"

wget -O viper-gui.png "https://raw.githubusercontent.com/ThePBone/Viper4Linux-GUI/master/viper.png" -q --show-progress
mv viper-gui.png $debname"/usr/share/pixmaps"

cat <<EOT >> $debname"/usr/share/applications/viper-gui.desktop"
[Desktop Entry]
Name=Viper4Linux
GenericName=Equalizer
Comment=Official UI for Viper4Linux
Keywords=equalizer
Categories=AudioVideo;Audio;
Exec=viper-gui
Icon=/usr/share/pixmaps/viper-gui.png
StartupNotify=false
Terminal=false
Type=Application
EOT

cat <<EOT >> $debname"/DEBIAN/control"
Package: viper4linux-gui
Version: $version-$revision
Section: sound
Priority: optional
Architecture: amd64
Depends: libqt5core5a (>= 5.9.5), libqt5widgets5 (>= 5.9.5), libqt5gui5 (>= 5.9.5), libqt5core5a (>= 5.9.5), libqt5xml5 (>= 5.9.5), libgl1-mesa-dev,git
Maintainer: ThePBone <thebone.main@gmail.com>
Description: Official Graphical User Interface for Viper4Linux
Homepage: https://github.com/ThePBone/Viper4Linux-GUI
EOT

dpkg-deb --build $debname