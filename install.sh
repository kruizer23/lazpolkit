#!/bin/sh

#
# Parses command line options. Currently supported options are:
#
# DESTDIR		Installation destination base directory
# 
DESTDIR=""
for arg; do
  case $arg in
    DESTDIR=*) DESTDIR=${arg#DESTDIR=};;
  esac;
done

#
# Perform the install.
#
mkdir -p $DESTDIR/usr/bin
cp src/lazpolkit $DESTDIR/usr/bin/
cp src/lazpolkit-pkexec $DESTDIR/usr/bin/
mkdir -p $DESTDIR/usr/share/lazpolkit
cp src/lazpolkit.ico $DESTDIR/usr/share/lazpolkit/
mkdir -p $DESTDIR/usr/share/polkit-1/actions/
cp src/org.lazpolkit.root.policy $DESTDIR/usr/share/polkit-1/actions/
mkdir -p $DESTDIR/usr/share/applications
cp src/lazpolkit.desktop $DESTDIR/usr/share/applications/
cp src/lazpolkit-pkexec.desktop $DESTDIR/usr/share/applications/

