.. _sec:watch:

Watch: track time and subroutines
=================================

Overview
~~~~~~~~

If you have any problems with the execution of SPEX, you may set the
watch-options. For example, if the computation time needed for your
model is very large, it could be wise to check which parts of the
program consume most of the cpu-time. You might then hope to improve the
performance by assuming other parameters or by re-structuring a part of
the code. In this case, you set the "time" flag to true (see below), and
at the end of the program you will see how much time was spent in the
most important subroutines.

Another case occurs in the unlikely case that SPEX crashes. In that case
it is recommended to re-execute the program, saving all commands onto a
log-file and use the "sub" flag to report the entering and exiting of
all major subroutines. This makes it more easy to find the source of the
error.

Timing is done by the use of the stopwatch package by William F.
Mitchell of the NIST, which is free available at the web. If the time
flag is set to true, on exit SPEX will report for each subroutine the
following execution times (in s):

-  The user time, i.e. the cpu-time spent in this subroutine

-  The system time, i.e. the overhead system time for this subroutine

-  The wall time, i.e. the total time spent while executing this
   subroutine.

Also the totals for SPEX as a whole are given (this may be more then the
sum of the subroutine components, since not all subroutines are listed
separately; the wall tiem for SPEX as a whole also includes the time
that the program was idle, waiting for input from the user).

Syntax
~~~~~~

The following syntax rules apply:

| ``watch time #l`` : set the "time" flag to true or false.
| ``watch sub #l`` : set the flag that SPEX causes to report each major
  subroutine it enters or exits

Examples
~~~~~~~~

| ``watch time t`` : set the "time" flag to true
| ``watch sub f`` : set the subroutine report flag to false
