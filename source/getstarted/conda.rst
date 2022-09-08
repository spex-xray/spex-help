.. _sec:conda:

  .. highlight:: none

How to install SPEX using Anaconda
==================================

SPEX is now also available through Anaconda for Linux and (Intel) MacOS. The instructions
below assume that you have a working version of Anaconda on your system (otherwise see
`Anaconda download <https://www.anaconda.com/products/distribution>`_ or
`Miniconda <https://docs.conda.io/en/latest/miniconda.html>`_, which installs the
minimum needed).

Check your platform
-------------------

SPEX for Anaconda is currently only available for Linux 64-bit (linux64) and MacOS Intel (osx64),
so please make sure that your machine provides the right environment. If you have an Apple Mac
with an M1 processor, then SPEX can run in an x86_64 environment using Rosetta (see
`Managing multiple architecture specific conda installations on Apple M1
<https://taylorreiter.github.io/2022-04-05-Managing-multiple-architecture-specific-installations-of-conda-on-apple-M1/>`_).

Create a conda environment for SPEX (optional, but recommended)
---------------------------------------------------------------

To make sure that SPEX keeps having access to its dependencies, it is best to install it in its own environment.
This way, the number of potential conflicts with other packages remains minimal.

Currently, SPEX is available for Python 3.8, 3.9 and 3.10, so please choose a version that matches your needs.
A conda environment can be created with the command below::

    (base) user@linux:~> conda create -n spex python=3.9

Replace the version number in the flag ``python=3.9`` with the Python version you need. Once the environment
is created and the minimal packages are installed, the environment can be activated::

    (base) user@linux:~> conda activate spex
    (spex) user@linux:~>

You now have a minimal environment to install SPEX into.

Install SPEX using conda
------------------------

Installing SPEX in a conda environment is as simple as::

    (spex) user@linux:~> conda install -c spexxray spex

Conda will automatically install the dependencies of SPEX. It is possible that you need to re-initialize the
conda environment to make SPEX run directly from the command line::

    (spex) user@linux:~> conda deactivate
    (base) user@linux:~> conda activate spex
    (spex) user@linux:~> spex
     Welcome jellep to SPEX version 3.07.01

     NEW in this version of SPEX:
    02-08-2022 Fixed issue with optimal binning
    31-08-2022 Fixed issue with SPEX binaries on Apple M1 chips

     Currently using SPEXACT version 2.07.00. Type `help var calc` for details.

    SPEX> quit
     Thank you for using SPEX

You probably want to install more packages in this environment for your purposes, like Jupyterlab or other
scientific packages. This can be done using the ``conda install`` command as well.

On an Apple Mac, it is necessary to install an Xserver, like `XQuartz <https://www.xquartz.org/>`_.

Running SPEX in conda
---------------------

Every time that you want to use SPEX in a new terminal, you have to activate the spex environment::

    (base) user@linux:~> conda activate spex
    (spex) user@linux:~>

After this command also the python interface of SPEX should be automatically initialized::

    (spex) user@linux:~> python
    >>> from pyspex.spex import Session
    >>> s=Session()

More information
----------------

See `our SPEX page at Anaconda <https://anaconda.org/spexxray/spex>`_ for more information.
