.. _sec:system:

System: call system executables
===============================

Overview
~~~~~~~~

Sometimes it can be handy if SPEX interacts with the computer system,
for example if you run it in command mode. You might want to check the
existence of certain file, or run other programs to produce output for
you, and depending on that output you want to continue SPEX.

Therefore there is an option to execute any shell type commands on your
machine, using the fortran "call system" subroutine.

Another useful goody is the possibility to stop SPEX automatically if
you find some condition to occur; this might be useful for example if
you have a program running that calls SPEX, and depending on the outcome
of SPEX you might want to terminate the execution. This is achieved in
SPEX by testing for the existence of a file with a given filename; if
the file exists, SPEX stops immediately execution and terminates; if the
file does not exist, SPEX continues normally.

Syntax
~~~~~~

The following syntax rules apply:

| ``system exe #a`` : execute the command #a on your UNIX/linux shell
| ``system stop #a`` : stop SPEX if the file #a exists

Examples
~~~~~~~~

| ``system exe "ls -l"`` : give a listing of all file names with length
  in the current directory
| ``system exe "myfortranprogram"`` : execute the fortran program with
  name "myfortranprogram"
| ``system stop testfile`` : stop SPEX if the file with name testfile
  exists; if this file does not exist, continue with SPEX
