.. _sec:conda:

How to install SPEX using Anaconda
==================================

  .. highlight:: none

SPEX is now also available through Anaconda for Linux and MacOS. The instructions
below assume that you have a working version of Anaconda on your system (otherwise see
`Anaconda download <https://www.anaconda.com/products/distribution>`_ or
`Miniconda <https://docs.conda.io/en/latest/miniconda.html>`_, which installs the
minimum needed).

SPEX status at Anaconda
-----------------------

.. raw:: html

    <a href="https://anaconda.org/spexxray/spex">
        <img src="https://anaconda.org/spexxray/spex/badges/version.svg" alt="Last SPEX version"/></a>
        Last SPEX version.
    </br></br>
    <a href="https://anaconda.org/spexxray/spex">
        <img src="https://anaconda.org/spexxray/spex/badges/platforms.svg" alt="Platforms for which SPEX is available"/></a>
        Platforms for which SPEX is available.
    </br></br>
    <a href="https://anaconda.org/spexxray/spex">
        <img src="https://anaconda.org/spexxray/spex/badges/downloads.svg" alt="Total number of downloads of SPEX through Anaconda"/></a>
        Total number of downloads of SPEX through Anaconda.


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
     Welcome user to SPEX version 3.07.02

     NEW in this version of SPEX:
    05-09-2022 Fixed m2 to cm2 conversion factor in plot area
    06-09-2022 Fixed issue with dividing response matrix in trafo
    19-10-2022 Fixed issue with error output table format
    07-11-2022 Plot adum now outputs full range of double precision numbers
    10-11-2022 Fixed issue with quotes not appearing in log save output
    21-11-2022 Fixed issue with line broadening in the cluster model

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
