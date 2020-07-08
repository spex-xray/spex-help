.. _sec:pyspexidx:

Python Interface
================

Welcome to the documentation of PYSPEX, the Python interface to SPEX. Since version
3.06.00 we provide a Python interface layer to the SPEX program. This documentation
section explains how to use this interface, which is an alternative for the standard
command-line interface of SPEX.

.. Warning:: Since this is the first public release of pyspex, the amount of testing
  in the field has been limited. Be critical and expect errors. Please report issues
  at `our Github page <https://github.com/spex-xray/spex-help/issues>`_.

.. Note:: As an alternative to some auxilliary programs of SPEX (e.g. trafo), we offer
  a separate Python package called pyspextools. Please see the `Pyspextools documentation
  <https://spex-xray.github.io/pyspextools/>`_ for more information.

Basic commands
--------------

.. toctree::
   :maxdepth: 2

   pyspex/install
   pyspex/spex
   pyspex/commands

Analysis threads
----------------

.. toctree::
   :maxdepth: 1

   pyspex/threads

Advanced class descriptions
---------------------------

.. toctree::
   :maxdepth: 2

   pyspex/session
   pyspex/data
   pyspex/model
   pyspex/optimize
   pyspex/plot
   pyspex/ascdump
   pyspex/log


