.. _sec:install:

How to install SPEX
===================

  .. highlight:: none

Download
--------

SPEX install files can be downloaded from our Zenodo page.

We provide several options for installing SPEX. They all have their own install file:

+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Download type             |Linux                                                                                                                      |Mac OS                                                                                                     |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Binary (Administrator)	   |                                                                                                                           |`SPEX-3.06.00-MacOS.dmg <https://zenodo.org/record/3939056/files/spex-3.06.00-MacOS.dmg?download=1>`_      |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Binary (Non-Administrator)|`SPEX-3.06.00-Linux-x86_64.tar.gz <https://zenodo.org/record/2419563/files/spex-3.05.00-Linux-x86_64.tar.gz?download=1>`_  |`SPEX-3.06.00-MacOS.tar.gz <https://zenodo.org/record/3939056/files/spex-3.06.00-MacOS.tar.gz?download=1>`_|
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Windows 10                |`spex-3.05.00-Linux-gfortran.tar.gz <ftp://ftp.sron.nl/pub/jellep/spex/v3.05/spex-3.05.00-Linux-gfortran.tar.gz>`_         |                                                                                                           |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Source code               | `SPEX-3.06.00-Source.tar.bz2 <https://zenodo.org/record/3939056/files/spex-3.06.00-Source.tar.bz2?download=1>`_                                                                                                                       |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+
|Docker image              | `SPEX-3.06.00-docker.tar.gz <https://zenodo.org/record/3939056/files/spex-3.06.00-Docker.tar.gz?download=1>`_                                                                                                                         |
+--------------------------+---------------------------------------------------------------------------------------------------------------------------+-----------------------------------------------------------------------------------------------------------+

Linux
-----

Unpack the tar file in the destination directory (for example /usr/local/):: 

    tar xvfz spex-3.06.00-Linux-x86_64.tar.gz

The tar file will create a directory called SPEX-3.05.00-Linux in which the program will be installed.

Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.06.00-Linux)::
 
    export SPEX90=/usr/local/SPEX-3.06.00-Linux (bash shell)
    setenv SPEX90 /usr/local/SPEX-3.06.00-Linux (C-type shell)

Source the script provided by the distribution::
 
    source $SPEX90/spexdist.sh (bash shell)
    source $SPEX90/spexdist.csh (C-type shell)

Remove the tar file: rm SPEX-3.06.00-Linux-x86_64.tar.gz


Mac OS
------

Administrator install
^^^^^^^^^^^^^^^^^^^^^

If you have administrator rights on your Mac, this option is the easiest one. Download the DMG file from Zenodo (SPEX-3.06.00-MacOS.dmg),
open it in Mac OS and follow the instructions on the screen.

Non-administrator install
^^^^^^^^^^^^^^^^^^^^^^^^^

Unpack the tar file in the destination directory (for example /usr/local/):: 

    tar xvfz spex-3.06.00-MacOS.tar.gz

The tar file will create a directory called SPEX-3.06.00-MacOS in which the program will be installed.

Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.06.00-MacOS)::
 
    export SPEX90=/usr/local/SPEX-3.06.00-MacOS (bash shell)
    setenv SPEX90 /usr/local/SPEX-3.06.00-MacOS (C-type shell)

Source the script provided by the distribution::
 
    source $SPEX90/spexdist.sh (bash shell)
    source $SPEX90/spexdist.csh (C-type shell)

Remove the tar file: rm SPEX-3.06.00-MacOS.tar.gz


Windows 10
----------

SPEX can be installed in Windows 10 using the new linux subsystem in Windows. SPEX can run in an Ubuntu Linux 
environment that can be installed through the Microsoft Store.

`How to install Ubuntu in Windows 10 <https://tutorials.ubuntu.com/tutorial/tutorial-ubuntu-on-windows#0>`_

In addition to the Ubuntu terminal, you also need a graphical X server. We recommend the XMING server. 
This will make sure that you can plot in SPEX.

Install SPEX in the Ubuntu environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

1. On the Ubuntu terminal, first install the OpenBlas library: apt-get install libopenblas-base

2. Download `spex-3.05.00-Linux-gfortran.tar.gz <ftp://ftp.sron.nl/pub/jellep/spex/v3.05/spex-3.05.00-Linux-gfortran.tar.gz>`_ 
   from our FTP server. This file is not (yet) available on Zenodo.
   Unpack the tar file in the destination directory (for example /usr/local/):: 

       tar xvfz spex-3.05.00-Linux-gfortran.tar.gz

   The tar file will create a directory called SPEX-3.05.00-Linux in which the program will be installed.

3. Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.05.00-Linux)::
 
       export SPEX90=/usr/local/SPEX-3.05.00-Linux (bash shell)
       setenv SPEX90 /usr/local/SPEX-3.05.00-Linux (C-type shell)

4. Source the script provided by the distribution::
 
       source $SPEX90/spexdist.sh (bash shell)
       source $SPEX90/spexdist.csh (C-type shell)

5. Remove the tar file: rm SPEX-3.05.00-Linux-gfortran.tar.gz


