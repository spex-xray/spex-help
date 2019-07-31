.. _sec:step:

Step: Grid search for spectral fits
===================================

Overview
~~~~~~~~

A grid search can be performed of :math:`\chi^2` versus 1, 2, 3 or 4
parameters. The minimum, maximum and number of steps for each parameter
may be adjusted. Steps may be linear or logarithmic. For each set of
parameters, a spectral fit is made, using the last spectral fit executed
before this command as the starting point. For each step, the parameters
and :math:`\chi^2` are displayed. This option is useful in case of doubt
about the position of the best fit in the parameter space, or in cases
where the usual error search is complicated. Further it can be useful
incases of complicated correlations between parameters.

**Warning:** *Take care to do a spectral fit first!*

**Warning:** *Beware of the cpu-time if you have a fine grid or many
dimensions!*

Syntax
~~~~~~

The following syntax rules apply:

| ``step dimension #i`` : Define the number of axes for the search
  (between 1–4).
| ``step axis #i1 parameter [[#i2] #i3] #a range #r1:#r2 n #i4`` : Set
  for axis #i1, optional sector #i2, optional component #i3 and
  parameter with name #a the range to the number specified by #r1 and
  #r2, with a number of steps :math:`n` given by #i4. If :math:`n>0`, a
  linear mesh between #r1 and #r2 will be taken, for :math:`n<0`, a
  logarithmic grid will be taken.
| ``step`` : Do the step search. Take care to do first the "step
  dimension" command, followed by as many "step axis" commands as you
  entered the number of dimensions.
| ``step file example`` : Do the step search and also write the results
  to an .stp file used by the stepcontour program (see
  `[sec:stepcontour] <#sec:stepcontour>`__).
| **Warning:** *The step file command will overwrite existing .stp files
  with the same name by default.*

Examples
~~~~~~~~

Below we give a worked out example for a CIE model where we took as free
parameters the normalization "norm", temperature "t", Si abundance "14"
and Fe abundance "26". To do a 3-dimensional grid search on the
temperature (logarithmic between 0.1 and 10 keV with 21 steps), Fe
abundace (linear between 0.0 and 1.0 with 11 steps) and Si abundance
(linear between 0.0 and 2.0 with 5 steps, i.e. values 0.0, 0.4, 0.8,
1.2, 1.6 and 2.0) the following commands should be issued:

| ``fit`` : Do not forget to do first a fit
| ``step dimension 3`` : We will do a three-dimensional grid search
| ``step axis 1 parameter 1 1 t range 0.1:10.0 n -21`` : The logarithmic
  grid for the first axis, temperature; note the :math:`-` before the
  21!
| ``step axis 2 par 26 range 0:1 n 11`` : The grid for axis 2, Fe
  abundance
| ``step axis 3 par 14 range 0:2 n 5`` : Idem for the 3rd axis, Silicon
| ``step`` : Now do the grid search. Output is in the form of ascii data
  on your screen (and/or output file if you opened one).
| ``step file example`` : Grid search with output to your screen and
  .stp output file for use with the stepcontour task.
