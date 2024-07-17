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

    <table>
    <tr>
    <td>Current SPEX version:</td>
    <td><a href="https://anaconda.org/spexxray/spex">
        <img src="https://anaconda.org/spexxray/spex/badges/version.svg" alt="Last SPEX version"/></a></td>
    </tr>
    <tr>
    <td>Platforms for which SPEX is available:</td>
    <td><a href="https://anaconda.org/spexxray/spex">
        <img src="https://anaconda.org/spexxray/spex/badges/platforms.svg" alt="Platforms for which SPEX is available"/></a></td>
    </tr>
    <tr>
    <td>Total number of downloads of SPEX through Anaconda:</td>
    <td><a href="https://anaconda.org/spexxray/spex">
        <img src="https://anaconda.org/spexxray/spex/badges/downloads.svg" alt="Total number of downloads of SPEX through Anaconda"/></a></td>
    </tr>
    </table>

Create a conda environment for SPEX (optional, but recommended)
---------------------------------------------------------------

To make sure that SPEX keeps having access to its dependencies, it is best to install it in its own environment.
This way, the number of potential conflicts with other packages remains minimal.

Currently, SPEX is available for Python 3.9, 3.10 and 3.11, so please choose a version that matches your needs.
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
     Welcome user to SPEX version 3.08.01

     NEW in this version of SPEX:
    29-03-2024 Added plot ion command and linid program for line identification
    27-05-2024 Fixed issue with trafo converting large XRISM matrix
    15-07-2024 Multiple bugfixes for response binning, tpho, and pyspex
    15-07-2024 Neutral nitrogen N I oscilator strength correction based on Garcia+09

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


Pyspextools in conda
--------------------

Our python support package `pyspextools <https://spex-xray.github.io/pyspextools/index.html>`_ is now also available
on Conda::

   (spex) user@linux:~> conda install -c spexxray pyspextools


More information
----------------

See `our SPEX page at Anaconda <https://anaconda.org/spexxray/spex>`_ for more information.
