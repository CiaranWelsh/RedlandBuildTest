wget http://download.librdf.org/source/rasqal-0.9.33.tar.gz || exit
tar -xvf rasqal-0.9.33.tar.gz || exit
cd rasqal-0.9.33 || exit
./autogen.sh --prefix="$(pwd)/install"|| exit
make || exit
sudo make install|| exit


