sudo apt install -y swig python-dev
sudo cp ./api/thostmduserapi.so /usr/lib/libthostmduserapi.so
sudo cp ./api/thosttraderapi.so /usr/lib/libthosttraderapi.so

swig -c++ -python -threads PyCTP.i
python setup.py build_ext
sudo python setup.py install
