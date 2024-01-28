#!/bin/bash

cd /home/ 								&& \
rm -rf /root/rpmbuild/{SOURCES,BUILD,BUILDROOT,RPMS,SRPMS}/*			&& \
tar -cavf /root/rpmbuild/SOURCES/libvirt-9.9.0.tar.xz $(find libvirt-9.9.0 -mindepth 1 -not -path 'libvirt-9.9.0/.git*')	&& \
cd /home/libvirt-9.9.0								&& \
cp -ra symlinks /root/rpmbuild/SOURCES/						&& \
cp -ra libvirt.spec /root/rpmbuild/SPECS/					&& \
rpmbuild -ba /root/rpmbuild/SPECS/libvirt.spec 2>&1 | tee /root/rpmbuild/libvirt_build.log

