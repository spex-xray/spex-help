.. _sec:stepcontour:

Stepcontour
===========

.. highlight:: none

The stepcontour task produces 1D and contour plots of step searches
produced using the ``step`` commands. At the end of the step command
definitions (see :ref:`sec:step`), add the text ``file`` and a file name to
the step command to write out the step results to a .stp file.

For example::

    SPEX> step dimension 2
    SPEX> step axis 1 parameter 1 1 norm range 0.5 1.5 n 10 
    SPEX> step axis 2 parameter 1 1 t range 0.75 1.25 n 10
    SPEX> step file norm-kt

These commands will produce a norm-kt.stp file. Subsequently, the
``stepcontour`` command can be run from the command line or the SPEX>
prompt::

    linux:~> stepcontour

    or 

    SPEX> sys exe "stepcontour"

The program will start and ask the user for the name of the .stp file::

     Program stepcontour version 1.0.
     Use this program to plot contours from SPEX steppar (.stp) files.

     Enter filename of SPEX steppar file (.stp): norm-kt.stp

Then provide a PGPLOT device to show the plot. For example ’/xw’ for X
output or ’file.ps/ps’ for Postscript plots::

     Number of axes in your steppar file:            2
     Graphics device/type (? to see list, default /NULL): /xw
     PGPLOT device type: XWINDOW
     Plotting contours for: 68.3%, 90%, 95.4%, 99%, 99.99%.

If you would like to write the plot data to QDP format, say yes to the
following question::

     Would you like to write this plot to a QDP file (y/n)? y

The program asks for an output QDP filename and writes the data to that
file.

.. warning:: The stepcontour program does not support logarithmic axes
   on 2D plots. Use another program to plot these or perform the step
   command on a linear grid.
