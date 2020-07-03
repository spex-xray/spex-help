.. _sec:installpyspex:

Install the SPEX Python interface
---------------------------------

.. highlight:: none

The SPEX python interface depends on a quite specific python environment. Using `conda
<https://docs.conda.io/en/latest/miniconda.html>`_, you can create this environment pretty
quickly. Please make sure you have (mini)conda installed and initialized on your machine before you continue.

Binary installation
^^^^^^^^^^^^^^^^^^^

The easiest option to install the Python interface for SPEX is by downloading the SPEX binary
version for your platform. See and follow the instruction in :ref:`sec:install`.

Once the standard SPEX environment is set up using the ``spexdist.sh`` or ``spexdist.csh`` files,
it is time to build the conda environment. This can be done using the ``spex.yml`` file provided in the SPEX directory.
Please enter the following command::

    (base) unix:~/SPEX> conda env create -f $SPEX90/python/spex.yml

This creates the ``spex`` conda environment for you. This step should only be done once. If successful, you can
from now on activate the environment with the command::

    (base) unix:~/SPEX> conda activate spex

And from now on, you can use the python interface in SPEX::

    (spex) unix:~/SPEX> python
    Python 3.5.6 |Anaconda, Inc.| (default, Aug 26 2018, 21:41:56)
    [GCC 7.3.0] on linux
    Type "help", "copyright", "credits" or "license" for more information.
    >>> from pyspex.spex import Session
    >>> s=Session()
     Welcome user to SPEX version 3.06.00

     NEW in this version of SPEX:
    12-12-2018 Plasma codes run in double precision now
    05-06-2019 Update of cooling processes
    18-12-2019 Included new atomic data (Fe-L, Gu et al. 2019)
    05-02-2020 Included Python interfaces for SPEX
    24-03-2020 Included new molecular dust data


     Currently using SPEXACT version 2.07.00. Type `help var calc` for details.
    >>>

If you need other python packages for your project, you can install them through conda in
your new ``spex`` environment.

Compile Python interface for SPEX
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you do not want to use conda, you can also compile the Python interfaces for SPEX. This can be done
either through a compile script called ``compile.py`` or manually with CMake by adding the option ``-DPYTHON=2`` or
``-DPYTHON=3`` depending on the python version. The use of Python 3 is strongly recommended. See :ref:`sec:compile`
for details.