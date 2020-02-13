Install PYSPEX
==============

PYSPEX is currently available in a special branch of the SPEX source code (pyspex), but
not necessarily installed by default. PYSPEX can be enabled by compiling the source again
while indicating the Python major version number. The version number can be set in the cmake
command prior to compilation::

    linux:~/spex> cmake . -DPYTHON=2

for python version 2 series and::

    linux:~/spex> cmake . -DPYTHON=3

for python version 3. CMake should automatically find the dependencies of PYSPEX, which are
``numpy``, ``future`` and ``matplotlib``. Make sure that these python modules are installed for
the right python version (see below in the Section "Dependencies").

The CMake installation should create a ``spexdist.sh`` and ``spexdist.csh`` script to set the
necessary environment variables. These are the ``LD_LIBRARY_PATH``, which needs to be set to
``$SPEX90/lib`` and the ``PYTHONPATH``, which is set to ``$SPEX90/python``.

Dependencies
------------

PYSPEX depends on the ``numpy``, ``future`` and ``matplotlib`` python modules. The current
numpy versions should include the f2py program that is necessary to create the Fortran to python
interface.

Please take care that both modules are often distributed in a python 2 and python 3 version.
If you compile SPEX for python 3, then also the python3 versions of the modules need to be
installed. In Linux distributions, packages often have the python version in the name. In
Debian, for example, the python 2 version of ``numpy`` is called ``python-numpy`` and the python 3
version ``python3-numpy``.

