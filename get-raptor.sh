wget http://download.librdf.org/source/raptor2-2.0.15.tar.gz || exit
tar -xvf raptor2-2.0.15.tar.gz || exit
cd raptor2-2.0.15 || exit
./autogen.sh --prefix="$(pwd)/install" || exit
make || exit
sudo make install || exit
