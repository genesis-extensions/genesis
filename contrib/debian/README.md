
Debian
====================
This directory contains files used to package genesisd/genesis-qt
for Debian-based Linux systems. If you compile genesisd/genesis-qt yourself, there are some useful files here.

## genesis: URI support ##


genesis-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install genesis-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your genesis-qt binary to `/usr/bin`
and the `../../share/pixmaps/genesis128.png` to `/usr/share/pixmaps`

genesis-qt.protocol (KDE)

