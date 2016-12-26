from distutils.core import Extension, setup

example_module = Extension(
    '_PyCTP',
    sources=['./PyCTP_wrap.cxx'],
    libraries=['thostmduserapi', 'thosttraderapi']
)

setup(name='PyCTP',
      ext_modules=[example_module],
      py_modules=['PyCTP'])
