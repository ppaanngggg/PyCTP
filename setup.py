from distutils.core import Extension, setup

pyctp_module = Extension(
    '_PyCTP',
    sources=['./PyCTP_wrap.cxx'],
    libraries=['thostmduserapi', 'thosttraderapi']
)

setup(
    name='PyCTP',
    version='0.2',
    author='hantian.pang',
    ext_modules=[pyctp_module],
    py_modules=['PyCTP'],
)
