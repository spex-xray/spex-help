Use any Xspec model in SPEX
===========================

The most general way to incorporate Xspec models in SPEX is to call Xspec itself directly by a SPEX user model
executable. Here we provide a fortran+tcl example to use an Xspec built-in comptt model. The program ``comptt-xspec.f90``
can be modified to calculate different models.

It requires the following files:

 - `Xspec <https://heasarc.gsfc.nasa.gov/docs/xanadu/xspec/>`_ as provided in HEASARC web site.
 - Module `moduser.f90 <https://github.com/spex-xray/spex-help/blob/master/moduser/module/moduser.f90>`_ from our
   Github site.
 - Example program `comptt-xspec.f90 <https://github.com/spex-xray/spex-help/blob/master/moduser/examples/comptt/comptt-xspec.f90>`_
   as provided on our Github page.

Modify the commtt-xspec program (optional)
------------------------------------------

The key part of the model can be found in line 18-21 of ``comptt-xspec.f90``. There, the TCL script sets up the model
in Xspec. If you need another model than comptt, then change the model name and modify the number of parameters
accordingly!

Compile the executable
----------------------

The program can be compiled in a few simple steps::

    linux:~/lmodel>  gfortran -g -c -o moduser.o moduser.f90
    linux:~/lmodel>  gfortran -g -c -o comptt-xspec.o comptt-xspec.f90
    linux:~/lmodel>  gfortran -g -o comptt-xspec comptt-xspec.o moduser.o

Use the Xspec model in SPEX
---------------------------

Here are the SPEX commands to calculate the Xspec-version comptt model. If you are using a different Xspec model,
please adapt the number of parameters to the number of parameters in the Xspec model::

    SPEX> com user
    SPEX> par 1 exec av ./comptt-xspec
    SPEX> par 1 npar v 6
    # The number of parameter needed by the Xspec model
    SPEX> par 1 p01 v 0
    ...
    SPEX> calc
