.. _sec:install:

How to install SPEX
===================

  .. highlight:: none

Download
--------

The current SPEX version 3.08.01 was released on 2024-07-18. SPEX install files can be downloaded from
`our Zenodo page <https://doi.org/10.5281/zenodo.1924563>`_.

.. only:: html

    We provide several options for installing SPEX. They all have their own install file:

    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------+
    |Download type             |Linux                                                                                                                      |Mac OS                                                                                                              |
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------+
    |Binary (Administrator)    |                                                                                                                           |`MacOS Intel pkg <https://zenodo.org/records/12771915/files/spex-3.08.01-Apple-Intel.pkg?download=1>`_              |
    |                          +---------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------+
    |                          |                                                                                                                           |`MacOS M1/M2/M3 pkg <https://zenodo.org/records/12771915/files/spex-3.08.01-Apple-Silicon-M1.pkg?download=1>`_      |
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------+
    |Binary (Non-Administrator)|`spex-3.08.00-Linux-Intel.tar.gz <https://zenodo.org/records/12771915/files/spex-3.08.01-Linux-Intel.tar.gz?download=1>`_  |`MacOS Intel tar.gz <https://zenodo.org/records/12771915/files/spex-3.08.01-Apple-Intel.tar.gz?download=1>`_        |
    |                          +---------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------+
    |                          |                                                                                                                           |`MacOS M1/M2/M3 tar.gz <https://zenodo.org/records/12771915/files/spex-3.08.01-Apple-Silicon-M1.tar.gz?download=1>`_|
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------+
    |Windows 10/11             |`SPEX Ubuntu 22.04 WSL <https://zenodo.org/records/12771915/files/spex-3.08.01-Ubuntu2204-WSL.tar.gz?download=1>`_         |                                                                                                                    |
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------+
    |Source code               | `spex-3.08.00-Source.tar.bz2 <https://zenodo.org/records/12771915/files/spex-3.08.01-Source.tar.bz2?download=1>`_                                                                                                                              |
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------+
    |Docker image              | `spex-3.08.00-Docker.tar.gz <https://zenodo.org/records/12771915/files/spex-3.08.01-Docker.tar.gz?download=1>`_                                                                                                                                |
    +--------------------------+---------------------------------------------------------------------------------------------------------------------------+--------------------------------------------------------------------------------------------------------------------+

Linux
-----

Unpack the tar file in the destination directory (for example /usr/local/):: 

    tar xvfz spex-3.08.01-Linux-Intel.tar.gz

The tar file will create a directory called SPEX-3.08.01-Linux in which the program will be installed.

Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.08.01-Linux)::
 
    export SPEX90=/usr/local/SPEX-3.08.01-Linux (bash shell)
    setenv SPEX90 /usr/local/SPEX-3.08.01-Linux (C-type shell)

Source the script provided by the distribution::
 
    source $SPEX90/spexdist.sh (bash shell)
    source $SPEX90/spexdist.csh (C-type shell)

Remove the tar file: rm SPEX-3.08.01-Linux-Intel.tar.gz

  .. Note:: In some cases the ``csh`` script fails because either PATH, LD_LIBRARY_PATH or PYTHONPATH
            are not defined. This can be temporarily fixed by defining an empty variable using setenv,
            for example: ``setenv PATH ""`` and run the script again. This will be fixed in the next
            SPEX release.


Mac OS
------

We provide a SPEX binary version for Mac OS that has been built on Intel processors as an install package.
Although this Intel build works mostly on Apple Silicon processors, we recommend to follow the :ref:`sec:conda`
instead on Apple Silicon machines as this is a native build on that platform.

  .. Note:: This version of SPEX has been compiled using XQuartz 2.8.0, so please upgrade XQuartz
            to a version >=2.8.0.

Administrator install (Intel)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

If you have administrator rights on your Mac, this option is the easiest one. Download the PKG file from Zenodo
(SPEX-3.08.01-Apple-Intel.pkg or SPEX-3.08.01-Apple-Silicon.pkg for M1/M2/M3 processors), open it in Mac OS and
follow the instructions on the screen.

MacOS may complain about not being able to verify the developer of the software. Please close this dialog and
go to the MacOS System Preferences >> Security & Privacy. In that dialog, you are offered to open the SPEX package
anyway. Accept the offer and make sure the SPEX package is unblocked. Now, you can open the SPEX PKG installer again
and proceed with the installation.

Non-administrator install (Intel)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Unpack the tar file in the destination directory (for example /usr/local/):: 

    tar xvfz spex-3.08.01-Apple-Intel.tar.gz

The tar file will create a directory called SPEX-3.08.01-Darwin in which the program will be installed.

Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.08.01-Darwin)::
 
    export SPEX90=/usr/local/SPEX-3.08.01-Darwin (bash shell)
    setenv SPEX90 /usr/local/SPEX-3.08.01-Darwin (C-type shell)

Source the script provided by the distribution::
 
    source $SPEX90/spexdist.sh (bash shell)
    source $SPEX90/spexdist.csh (C-type shell)

Remove the tar file: rm SPEX-3.08.01-Apple-Intel.tar.gz

  .. Note:: In some cases the ``csh`` script fails because either PATH, DYLD_LIBRARY_PATH or PYTHONPATH
            are not defined. This can be temporarily fixed by defining an empty variable using setenv,
            for example: ``setenv PATH ""`` and run the script again. This will be fixed in the next
            SPEX release.


Windows 10/11
-------------

SPEX can be installed in Windows 10/11 using the linux subsystem in Windows (WSL2). SPEX can run in an Ubuntu Linux
environment that can be installed through the Microsoft Store.

`How to install Ubuntu in Windows 10/11 <https://ubuntu.com/tutorials/install-ubuntu-on-wsl2-on-windows-11-with-gui-support>`_

Since November 2022, WSL2 should support graphics output from Ubuntu, so a separate X-server should no longer be
necessary. Section 5 of the tutorial above shows some examples of running graphical programs. It should not be
necessary to run all of those, but they can be helpful to test your installation. After installing the X11 apps
using the command ``sudo apt install x11-apps``, you should be able to continue with the SPEX installation below.

Install SPEX in the Ubuntu environment
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The steps below describe how to install a SPEX version tailored to Ubuntu 22.04. If you are planning to
use Anaconda in this Ubuntu WSL2 environment, then we would recommend to install SPEX through Anaconda directly.
See :ref:`sec:conda` for details.

1. On the Ubuntu terminal, first install the OpenBlas library: apt-get install libopenblas-base

2. Download spex-3.08.01-Ubuntu-WSL.tar.gz from Zenodo.
   Unpack the tar file in the destination directory (for example /usr/local/)::

       tar xvfz spex-3.08.01-Ubuntu-WSL.tar.gz

   The tar file will create a directory called SPEX-3.08.01-Linux in which the program will be installed.

3. Set the environment variable SPEX90 to the installation directory (for example /usr/local/SPEX-3.08.01-Linux)::
 
       export SPEX90=/usr/local/SPEX-3.08.01-Linux (bash shell)
       setenv SPEX90 /usr/local/SPEX-3.08.01-Linux (C-type shell)

4. Source the script provided by the distribution::
 
       source $SPEX90/spexdist.sh (bash shell)
       source $SPEX90/spexdist.csh (C-type shell)

5. Remove the tar file: rm spex-3.08.01-Ubuntu-WSL.tar.gz

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


