#!/bin/bash
# Packages & Packages.gz
dpkg-scanpackages --multiversion . > Packages
gzip -k -f Packages

export EMAIL="huggepugge1@gmail.com"

# Release, Release.gpg & InRelease
apt-ftparchive release . > Release
gpg --default-key "${EMAIL}" -abs -o - Release > Release.gpg
gpg --default-key "${EMAIL}" --clearsign -o - Release > InRelease

# Commit & push
git add -A
git commit -m update
git push
