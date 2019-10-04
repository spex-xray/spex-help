.. _sec:problemsolve:

Solving SPEX problems
=====================

In case you encounter a problem with SPEX, like a command does not do what you want,
you get unexpected results or in the worst case the program crashes, then you arrived
at the right page. Here we provide a checklist which may either allow you to solve the
problem yourself or provide us with enough information to help you.

  #. Does SPEX give you an error message? Although not all error messages clearly identify
     the problem, they do contain information about what is wrong. If the error message is
     not obvious, then entering the error message in Google or any other search engine may
     reveal solutions for your problem found by other people.

  #. If there is no clear error message, then it is important to know at which step in the
     process the problem appears to occur. Are you unable to start a program, or does the
     program quit after reading in files? The exact moment can give important hints about
     what may go wrong. If the problem occurs in SPEX, you could create a .com file with
     the commands that cause the issue and see at which command the error occurs.

     SPEX can also provide information about which subroutine SPEX is running. With the
     command watch sub true, SPEX will print out the subroutines for all following commands.
     Putting this line in the top of your .com file will make it easier to identify where
     the program fails.

  #. Check the :ref:`sec:knownissues` page how to search our Github page for similar problems.
     There may be very recent problems reported that are not indexed by search machines yet.

  #. When the points above do not lead you to a solution, please submit an issue to our issue
     tracker on Github. The :ref:`sec:reportissues` page contains instructions on how to do that.

Advanced debugging
------------------

If SPEX crashes with a segmentation fault, then it may help to run a debugger on the
SPEX program. We do not expect you to do this for each problem, but we may ask you to
run SPEX trough a debugger if you submitted an issue.

A very general debugger is the GDB program, which is available on most platforms.
On the command line, you can enter::

    linux:~/spex> gdb $SPEX90/bin/spex

    GNU gdb (Debian 7.12-6) 7.12.0.20161007-git
    Copyright (C) 2016 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
    This is free software: you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.  Type "show copying"
    and "show warranty" for details.
    This GDB was configured as "x86_64-linux-gnu".
    Type "show configuration" for configuration details.
    For bug reporting instructions, please see:
    <http://www.gnu.org/software/gdb/bugs/>.
    Find the GDB manual and other documentation resources online at:
    <http://www.gnu.org/software/gdb/documentation/>.
    For help, type "help".
    Type "apropos word" to search for commands related to "word"...
    Reading symbols from /spex/bin/spex...done.
    (gdb)

When GDB is started, you can type run to start SPEX::

    (gdb) run
    Starting program: /spex/bin/spex
    [Thread debugging using libthread_db enabled]
    Using host libthread_db library "/lib/x86_64-linux-gnu/libthread_db.so.1".
     Welcome user to SPEX version 3.05.00

     NEW in this version of SPEX:
    11-06-2018 Added Ext_Rate column to new spo files
    18-12-2018 SPEX is now using the GPL license

     Currently using SPEXACT version 2.07.00. Type `help var calc` for details.

    SPEX>

In the next step, you can enter the SPEX commands that lead to the problem.
Having the commands in a .com file would be most practical::

    SPEX> log exe bug

The GDB program will run slower than usual. When the error occurs, GDB will show
more detailed error messages related to the crash. If you want even more information,
you can give the bt command to backtrace where the error occurs::

    (gdb) bt

This output can be a bit intimidating, but it should show in which line of the code
things go wrong. This kind of information is very helpful to us in solving programming
errors.