sudo apt install -y swig python3-dev
sudo cp ./api/thostmduserapi.so /usr/lib/libthostmduserapi.so
sudo cp ./api/thosttraderapi.so /usr/lib/libthosttraderapi.so

swig -c++ -python -py3 -threads PyCTP.i
python3.6 setup.py build_ext
sudo python3.6 setup.py install
