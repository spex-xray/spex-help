.. _pyspex_session:

Session class structure
=======================

The PYSPEX session class is the top-level class for PYSPEX and the most important class managing
user interaction. When the class is initialized, a SPEX session is started for the duration of the
Python session. All subsequent commands communicate with this SPEX session in the background.

The start of a SPEX session is managed by the __init__ method. At the same time, objects are created
to contain much of the internal SPEX data that pyspex can access. These objects are instances of the
Data, Model, Optimization, Ascdump and Log classes that are explained later in this Chapter.

  .. autoclass:: pyspex.spex.Session

     .. automethod:: pyspex.spex.Session.__init__

During the SPEX session, the object variables can be used to obtain values from the SPEX session in the
background. Please note that for most of these there are existing PYSPEX commands to retrieve the
information safely.

Descriptions of the classes behind the object variables in __init__ can be found by clicking the link
behind the variable.

.. Warning:: You can only start one PYSPEX session during a python session. Unfortunately, the Fortran to
             Python interface that we use cannot handle multiple sessions properly.

Session class commands
----------------------

The Session class also contains the main PYSPEX commands listed in :ref:`sect:pyspex_commands`.

