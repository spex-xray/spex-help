Basic usage of PYSPEX
=====================

The PYSPEX python module offers a python interface to the SPEX program. This means that you can
use SPEX directly either in interactive python mode and in python scripts. In this short tutorial,
we assume you are using PYSPEX in interactive mode.

The structure of PYSPEX is chosen such that for many SPEX commands, there is an equivalent class
in PYSPEX. These classes contain the functions that copy the functionality of the SPEX command,
and if applicable, the classes contain also the output parameters of the SPEX command. This makes
it easy to incorporate the SPEX results inside your own program.

In addition to the classes, you can also simply send a SPEX command-line command using the
``command`` function (see Section below).

Start a PYSPEX session
----------------------

For this example PYSPEX session in python, we use the interactive mode of python. We simply start
python from the Linux command line (making sure that the environment is set using a spexdist script
located in the SPEX install directory)::

    linux:~> source spex/spexdist.sh
    linux:~> python
    Python 2.7.13
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

If the PYTHONPATH variable is correctly set, we should now be able to import spex from pyspex::

    >>> from pyspex import spex

From here, we can start a SPEX session easily::

    >>> s=spex.Session()
     Welcome user to SPEX version 3.05.00

     NEW in this version of SPEX:
    11-06-2018 Added Ext_Rate column to new spo files
    18-12-2018 SPEX is now using the GPL license

    Currently using SPEXACT version 2.07.00. Type `help var calc` for details.
    >>>

The ``s`` object now contains all the functions and commands that are available to control
the SPEX session. For example, we can send SPEX the following command-line commands::

    >>> s.command('var calc new')
     Now using SPEXACT version 3.05.00
    0
    >>> s.com('cie')
     You have defined    1 component.
    0
    >>> s.calc()
    0

With these commands SPEX calculates a CIE spectrum for a temperature of 1 keV.

Although it is possible to call ``s.command('quit')``, the session will be terminated
automatically once python is closed or ``s`` is reassigned.

Using the ``command`` function only does not provide an advantage over the regular command line
of SPEX. To really benefit from PYSPEX, you need to use the additional classes which are described
in the next sections.

The command function
--------------------

The PYSPEX module contains a general function to send SPEX commands to the SPEX session. This
function is especially helpful for SPEX commands that have not been implemented (yet) in PYSPEX.
The function returns 0 when the command was successfully executed. If not a non-zero value is
returned.

.. automodule:: pyspex.spex

    .. automethod:: Session.command



