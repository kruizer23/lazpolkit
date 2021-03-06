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
# Perform the uninstall.
#
rm -f $DESTDIR/usr/bin/lazpolkit
rm -f $DESTDIR/usr/bin/lazpolkit-pkexec
rm -f $DESTDIR/usr/share/lazpolkit/lazpolkit.ico
rm -f $DESTDIR/usr/share/polkit-1/actions/org.lazpolkit.root.policy
rm -f $DESTDIR/usr/share/applications/lazpolkit.desktop
rm -f $DESTDIR/usr/share/applications/lazpolkit-pkexec.desktop
rmdir $DESTDIR/usr/share/lazpolkit

