Log commands
------------

Being an interactive program, SPEX has facilities to save commands, execute lists of commands and
save outputs to files. This is arranged through the ``log`` commands.

Log execute
^^^^^^^^^^^

Executing lists of SPEX commands can be done using the ``log_exe`` method, similar to the
``log exe`` command in SPEX:

  .. automethod:: pyspex.spex.Session.log_exe

The ``filename`` should include a .com extension.

Example::

    >>> s.log_exe('mysource.com')

Log save
^^^^^^^^

To save the commands typed into SPEX (or passed through the ``command`` function in
PYSPEX or the API), one can use the ``log_save`` command.

  .. automethod:: pyspex.spex.Session.log_save

The ``savefile`` should have the .com extension included in the name. Optionally, the status
``overwrite`` or ``append`` can be added.

Example::

    >>> s.log_save('mycommands.com')
    >>> s.log_save('session_01.com', status='append')

Log output
^^^^^^^^^^

The terminal output can be saved in another file with the .out extension using the method
``log_out``:

  .. automethod:: pyspex.spex.Session.log_out

The ``outfile`` should have the .out extension included in the name. Optionally, the status
``overwrite`` or ``append`` can be added.

Examples::

    >>> s.log_out('session.out')
    >>> s.log_out('mylog.out', status='overwrite')

Log close
^^^^^^^^^

The logging done by the ``log_save`` or ``log_out`` methods can be stopped by calling the
``log_close`` method:

  .. automethod:: pyspex.spex.Session.log_close

where ``logtype`` is either ``save`` or ``out``.

Examples::

    >>> s.log_close('out')
    >>> s.log_close('save')
