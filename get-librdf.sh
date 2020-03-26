#!/usr/bin/env bash
wget http://download.librdf.org/source/redland-1.0.17.tar.gz || exit
tar -xvf redland-1.0.17.tar.gz|| exit
cd redland-1.0.17 || exit
./autogen.sh || exit
make|| exit
sudo make install|| exit


