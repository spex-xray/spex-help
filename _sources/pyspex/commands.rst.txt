.. _sect:pyspex_commands:

Basic PYSPEX commands
=====================

The main PYSPEX commands that can be used in Python are designed to follow the SPEX command names.
The syntax, however, deviates slightly because it needs to follow the Python syntax. This page
contains the full list of the basic PYSPEX commands that are available.

This manual intents to show the basic usage of the commands intended for users already familiar
with the SPEX syntax. If you need more information what the command does, please check the
`SPEX reference manual <https://spex-xray.github.io/spex-help/index.html>`_.
For each command, the equivalent SPEX command will be mentioned for reference.

In the examples below, we assume PYSPEX has been started in python as follows::

    >>> from pyspex import spex
    >>> s = spex.Session()
     Welcome user to SPEX version 3.05.00

     NEW in this version of SPEX:
    11-06-2018 Added Ext_Rate column to new spo files
    18-12-2018 SPEX is now using the GPL license

    Currently using SPEXACT version 2.07.00. Type `help var calc` for details.
    >>>

.. note::

    Note that only one SPEX session can be used within one Python run or program.

.. toctree::
   :maxdepth: 2
   :caption: Commands:

   com_data
   com_model
   com_opt
   com_plot
   com_log




