.. _sec:install:

How to install SPEX
===================

  .. highlight:: none

Download
--------

The current SPEX version 3.07.01 was released on 2022-08-31. SPEX install files can be downloaded from
`our Zenodo page <https://doi.org/10.5281/zenodo.1924563>`_.

.. only:: html

    We provide several options for installing SPEX. They all have their own install file:

    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
    |Download type             |Linux                                                                                                                      |Mac OS                                                                                                     |
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
    |Binary (Administrator)    |                                                                                                                           |`spex-3.07.00-MacOS.pkg <https://zenodo.org/record/6948884/files/spex-3.07.00-MacOS.pkg?download=1>`_      |
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
    |Binary (Non-Administrator)|`spex-3.07.00-Linux-Intel.tar.gz <https://zenodo.org/record/6948884/files/spex-3.07.00-Linux-Intel.tar.gz?download=1>`_    |`SPEX-3.07.00-MacOS.tar.gz <https://zenodo.org/record/6948884/files/spex-3.07.00-MacOS.tar.gz?download=1>`_|
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
    |Windows 10                |`SPEX Ubuntu 22.04 WSL <https://zenodo.org/record/6948884/files/spex-3.07.00-Ubuntu-WSL.tar.gz?download=1>`_               |                                                                                                           |
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
    |Source code               | `spex-3.07.00-Source.tar.bz2 <https://zenodo.org/record/6948884/files/spex-3.07.00-Source.tar.bz2?download=1>`_                                                                                                                       |
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
    |Docker image              | `spex-3.07.00-Docker.tar.gz <https://zenodo.org/record/6948884/files/spex-3.07.00-Docker.tar.gz?download=1>`_                                                                                                                         |
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+

Linux
-----

Unpack the tar file in the destination directory (for example /usr/local/):: 

    tar xvfz spex-3.07.01-Linux-Intel.tar.gz

The tar file will create a directory called SPEX-3.07.01-Linux in which the program will be installed.

Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.07.01-Linux)::
 
    export SPEX90=/usr/local/SPEX-3.07.01-Linux (bash shell)
    setenv SPEX90 /usr/local/SPEX-3.07.01-Linux (C-type shell)

Source the script provided by the distribution::
 
    source $SPEX90/spexdist.sh (bash shell)
    source $SPEX90/spexdist.csh (C-type shell)

Remove the tar file: rm SPEX-3.07.01-Linux-Intel.tar.gz

  .. Note:: In some cases the ``csh`` script fails because either PATH, LD_LIBRARY_PATH or PYTHONPATH
            are not defined. This can be temporarily fixed by defining an empty variable using setenv,
            for example: ``setenv PATH ""`` and run the script again. This will be fixed in the next
            SPEX release.


Mac OS
------

We provide a SPEX binary version for Mac OS that has been built on Intel processors. This version
also works on new Apple M1 chips.

  .. Note:: This version of SPEX has been compiled using XQuartz 2.8.0, so please upgrade XQuartz
            to a version >=2.8.0.

Administrator install
^^^^^^^^^^^^^^^^^^^^^

If you have administrator rights on your Mac, this option is the easiest one. Download the PKG file from Zenodo
(SPEX-3.07.01-MacOS.pkg), open it in Mac OS and follow the instructions on the screen.

MacOS may complain about not being able to verify the developer of the software. Please close this dialog and
go to the MacOS System Preferences >> Security & Privacy. In that dialog, you are offered to open the SPEX package
anyway. Accept the offer and make sure the SPEX package is unblocked. Now, you can open the SPEX DMG installer again
and proceed with the installation.

Non-administrator install
^^^^^^^^^^^^^^^^^^^^^^^^^

Unpack the tar file in the destination directory (for example /usr/local/):: 

    tar xvfz spex-3.07.01-MacOS.tar.gz

The tar file will create a directory called SPEX-3.07.01-Darwin in which the program will be installed.

Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.07.01-Darwin)::
 
    export SPEX90=/usr/local/SPEX-3.07.01-Darwin (bash shell)
    setenv SPEX90 /usr/local/SPEX-3.07.01-Darwin (C-type shell)

Source the script provided by the distribution::
 
    source $SPEX90/spexdist.sh (bash shell)
    source $SPEX90/spexdist.csh (C-type shell)

Remove the tar file: rm SPEX-3.07.01-MacOS.tar.gz

  .. Note:: In some cases the ``csh`` script fails because either PATH, DYLD_LIBRARY_PATH or PYTHONPATH
            are not defined. This can be temporarily fixed by defining an empty variable using setenv,
            for example: ``setenv PATH ""`` and run the script again. This will be fixed in the next
            SPEX release.


Windows 10
----------

SPEX can be installed in Windows 10 using the new linux subsystem in Windows. SPEX can run in an Ubuntu Linux 
environment that can be installed through the Microsoft Store.

`How to install Ubuntu in Windows 10 <https://tutorials.ubuntu.com/tutorial/tutorial-ubuntu-on-windows#0>`_

In addition to the Ubuntu terminal, you also need a graphical X server. We recommend the `Vcxsrv server <https://sourceforge.net/projects/vcxsrv/>`_.
Otherwise, the `XMING server <https://sourceforge.net/projects/xming/>`_ is an alternative. 
This will make sure that you can plot in SPEX.

Install SPEX in the Ubuntu environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. On the Ubuntu terminal, first install the OpenBlas library: apt-get install libopenblas-base

2. Download SPEX-3.07.01-Ubuntu-WSL.tar.gz from Zenodo.
   Unpack the tar file in the destination directory (for example /usr/local/)::

       tar xvfz spex-3.07.01-Ubuntu-WSL.tar.gz

   The tar file will create a directory called SPEX-3.07.01-Linux in which the program will be installed.

3. Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.07.01-Linux)::
 
       export SPEX90=/usr/local/SPEX-3.07.01-Linux (bash shell)
       setenv SPEX90 /usr/local/SPEX-3.07.01-Linux (C-type shell)

4. Source the script provided by the distribution::
 
       source $SPEX90/spexdist.sh (bash shell)
       source $SPEX90/spexdist.csh (C-type shell)

5. Remove the tar file: rm spex-3.07.01-Ubuntu-WSL.tar.gz

6. Set the DISPLAY variable in ~/.bashrc::
 
       echo "export DISPLAY=localhost:0.0" >> ~/.bashrc
       . ~/.bashrc

7. Run SPEX::

       spex

If you get an error about a missing library when running SPEX, please run the following command::

       sudo apt-get install libopenblas-base libreadline8 libncurses5 x11-common libx11-6 gfortran

The command above makes sure that all the packages that SPEX needs are installed.

The latest Ubuntu build also contains the python interface. To use it, make sure to install::

       sudo apt-get install python3-numpy python3-matplotlib python3-future python3-astropy


