Commandline help
================

.. highlight:: none

If you are unsure about the syntax of a command or you forgot the exact name of a command,
then the command-line help function in SPEX can help you. Simply entering ``help`` on the
commandline explains the basic usage of ``help``::

    SPEX> help
    Usage:
       SPEX> help <command>

    For a list of available help files, type 'help index'.

    See also the SPEX Reference manual and the SPEX Cookbook on:
    http://www.sron.nl/spex

List of commands
----------------

When you type ``help index``, SPEX will display all the commands for which a help text is
available. From there you can pick the command that you want to see a simple help text for::

    SPEX> help index
    Help files are available for these commands:

      abundance     elim    log         simulate
      ascdump       error   model       step
      bin           fit     multiply    syserr
      calculate     help    obin        system
      comp          ibal    par         use
      data          ignore  plot        var
      dem           index   sector      vbin
      distance      ions    shiftplot   watch
      egrid

    Usage:
      SPEX> help <command>

Print help for command
----------------------

When you know the command that you need help for, just type ``help <command>``, for
example we show the help for the abundance command below::

    SPEX> help abundance
    This command changes the used set of elemental abundances.

    Usage:
      SPEX> abundance <set>

    where <set> is the set of abundances used. Allowed sets:

      reset    - default set, currently Lodders et al. 2009
      ag       - Anders & Grevesse 1989
      allen    - Allen 1973
      ra       - Ross & Aller 1976
      grevesse - Grevesse et al 1992
      gs       - Grevesse & Sauval 1998
      lodders  - Lodders proto-Solar 2003
      solar    - Lodders Solar photospheric 2003

    To show the current abundance set in use:
      SPEX> abun show


