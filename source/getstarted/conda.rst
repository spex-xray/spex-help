.. _sec:conda:

Conda/Mamba
===========

  .. highlight:: none

The recommended way to install SPEX is through Conda or `Mamba <https://mamba.readthedocs.io/en/latest/user_guide/mamba.html>`_
on both Linux and MacOS systems. If you do not have a conda or mamba environment installed,
then we recommend to install it through the `conda-forge installer <https://conda-forge.org/download/>`_.

The install also works for the commercial version of Anaconda, but we recommend to
use the open-source conda-forge alternative instead.

.. note:: We are moving from the commercial version of Anaconda to an open source alternative.
          This means that the Anaconda spexxray channel is going to be discontinued.
          Please use https://var.sron.nl/spexconda as channel URL for installing SPEX.
          The best option is to create a new mamba/conda environment for a fresh SPEX install.

Create a conda/mamba environment for SPEX (optional, but recommended)
---------------------------------------------------------------------

To make sure that SPEX keeps having access to its dependencies, it is best to install
it in its own environment. This way, the number of potential conflicts with other
packages remains minimal.

Currently, SPEX is available for Python 3.11, 3.12 and 3.13, and numpy 2.3 and 2.4.
Please choose a version that matches your needs. A conda/mamba environment can be
created with the command below. If you use the commercial version of conda, then
you can replace the ``mamba`` command with ``conda``::

    user@linux:~> mamba create -n spex python=3.12

Replace the version number in the flag ``python=3.12`` with the Python version you need. Once the environment
is created and the minimal packages are installed, the environment can be activated::

    user@linux:~> mamba activate spex
    user@linux:~>

You now have a minimal environment to install SPEX into.

Install SPEX using conda/mamba
------------------------------

Installing SPEX in a conda/mamba environment is as simple as::

    (spex) user@linux:~> mamba install -c https://var.sron.nl/spexconda spex

or with conda::

    (spex) user@linux:~> conda install -c https://var.sron.nl/spexconda -c conda-forge spex

Mamba will automatically install the dependencies of SPEX. It is possible
that you need to re-initialize the conda environment to make SPEX run
directly from the command line::

    (spex) user@linux:~> mamba deactivate
    (base) user@linux:~> mamba activate spex
    (spex) user@linux:~> spex
     Welcome user to SPEX version 3.08.03

     Setting the number of threads to  4 for optimal performance.

     Currently using SPEXACT version 2.07.00. Type `help var calc` for details.

    SPEX>

You probably want to install more packages in this environment for your purposes, like Jupyterlab or other
scientific packages. This can be done using the ``mamba install`` command as well.

On an Apple Mac, it is necessary to install an Xserver, like `XQuartz <https://www.xquartz.org/>`_.

Running SPEX in conda/mamba
---------------------------

Every time that you want to use SPEX in a new terminal, you have to activate the spex environment::

    user@linux:~> conda activate spex
    (spex) user@linux:~>

After this command also the python interface of SPEX should be automatically initialized::

    (spex) user@linux:~> python
    >>> from pyspex.spex import Session
    >>> s=Session()


Pyspextools in conda
--------------------

Our Python support package `pyspextools <https://spex-xray.github.io/pyspextools/index.html>`_ is also available
in conda/mamba::

   (spex) user@linux:~> mamba install -c https://var.sron.nl/spexconda pyspextools

