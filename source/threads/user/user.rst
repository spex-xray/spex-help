How to use the SPEX user model
==============================

Some users would like to add their own models to the SPEX program, similar to the local model option in Xspec.
Since the developers of SPEX do not have the man power to implement all possible models out there in a SPEX variety,
we have devised a quick way of running external models in SPEX.

SPEX contains two user models ’user’ and ’musr’ for additive and multiplicative models respectively. These model
components communicate with the external model through an input and output file containing the model parameters,
the energy grid and the calculated spectrum. By creating a program that reads in the input parameters and energy grid,
calculates the spectrum, and writes the result to an output file in the right format, users have a very flexible way
of using any model in SPEX.

Since this setup offers many possibilities, we can only show a few examples of how these user model components
can be used. We have prepared a helper library for Python and Fortran.

Python
------

The Python helper library for the user model is part of the `pyspextools <https://github.com/spex-xray/pyspextools>`_
package. A general example of how to user the Python interface to the user model can be found `here
<https://spex-xray.github.io/pyspextools/tutorials/myusermodel.html>`_.

As a more specific example we also provide a method to `calculate APEC models and import them to SPEX
<https://spex-xray.github.io/pyspextools/tutorials/apec.html>`_ using the Python interface.

Fortran
-------

Using the Fortran module `moduser <https://github.com/spex-xray/spex-help/blob/master/moduser/module/moduser.f90>`_,
we list a number of example user models below:

.. toctree::
   :maxdepth: 1

   xspec
   ismabs
