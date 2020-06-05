.. _sect:xabsinput:

Xabsinput
=========

For the *xabs* and *warm* models, an input file is needed that contains
the temperature and ionic column densities as a function of the
ionisation parameter :math:`\xi`. The standard input file provided by
 is based on a run with an older version of Cloudy, using the spectral
energy distribution of NGC 5548 as used in `Steenbrugge et al. (2005)
<https://ui.adsabs.harvard.edu/abs/2005A%26A...434..569S/abstract>`_.

The present program *xabsinput* allows the user to create such a file.
The user basically needs to provide the following information, discussed
in more detail below: spectral energy distribution (SED), abundances,
root directory, and how to call Cloudy.

The SED should be provided in an ascii-file with two columns. The first
column gives the energy in Rydberg units (note these units!), and the
second column gives the spectral energy distribution in terms of
:math:`E\,{\mathrm d}N/
{\mathrm d}E` (for instance, in units of
keV :math:`\mathrm{m}^{-2}` :math:`\mathrm{s}^{-1}` :math:`\mathrm{keV}^{-1}` or
Ryd :math:`\mathrm{m}^{-2}` :math:`\mathrm{s}^{-1}` :math:`\mathrm{Ryd}^{-1}`, or Jansky,
etc. Note that the absolute normalisation of the SED does not matter
here, only the shape is used, so therefore all these units can be used
as long as it corresponds to energy per area per time per unit energy.

.. warning:: In order to have a sufficiently broad energy band,
   *xabsinput* adds a value of :math:`10^{-10}` at energies of
   :math:`10^{-8}` and :math:`10^9` Ryd. Take care that the SED scaling
   would essentially imply :math:`10^{-10}` to be a very small value. Also,
   the energies in the file should be in increasing order, and within the
   :math:`10^{-8}` and :math:`10^9` Ryd interval.

Default abundances are presently the `Lodders et al. (2009)
<https://ui.adsabs.harvard.edu/abs/2009LanB...4B..712L/abstract>`_
proto-Solar values, presently the default of SPEX.

.. warning:: These default abundances are not equal to the default
   abundances of Cloudy.

The user is prompted for a file that contains the abundances relative to
these standard abundances. This ascii files should have one line for
each element with non-standard abundances. Each such line has two
numbers: the atomic number of the element and the abundance relative to
standard (in linear units, i.e. if you have iron two times solar, enter
“26 2.0”, without the quotes, of course). If all abundances are
standard, simply use an empty but existing file.

The user also should provide the name of a directory where the files
that are calculated will be stored. Basically, the following files will
appear in this directory:

-  a file “run.in”, which contains the input file for Cloudy; at the end
   of the program, it contains the input of the last Cloudy run (with
   the highest :math:`\xi`).

-  a file “run.out”, which contains the output of Cloudy; at the end of
   the program, it contains the output of the last Cloudy run (with the
   highest :math:`\xi`).

-  a file “xabs\_inputfile”, which is the input file that you will need
   for the *xabs* and *warm* models of ; you can rename or move that
   file after finishing this program. The format of that file is as
   follows: first part two columns (:math:`\log\xi` (in cgs, bah) and
   temperature (in eV); this is followed by blocks for each ion from H
   to Zn, with as first entry the nuclear charge and ionisation stage,
   and then simply the logs of the column densities, scaled to 28 for
   hydrogen.

-  ascii files named “column01.dat”, “column02.dat”, :math:`\ldots`
   “column30.dat” containing for each element with nuclear charge
   :math:`Z=1-30` the ion concentrations as a function of :math:`\xi`.
    does not need those files, but it can be educative to look at them
   (or to plot using qdp). The format of those files is :math:`\log\xi`,
   followed by the logs of the column densities for each ion (1 is
   neutral, 2 is singly ionised etc). The column densities take account
   of the abundances and have, for practical reasons, been scaled in
   such a way that Hydrogen has log column :math:`10`; values below 0
   are cut-off to 0.

Finally, the user should provide the name of a script that runs Cloudy.
At SRON, this is /opt/local/bin/cloudy, and the script is given as::

    #!/bin/csh -f
    #
    setenv CLOUDY_DATA_PATH /opt/local/HEA/cloudy/c13.01/data
    setenv LD_LIBRARY_PATH
    /opt/local/HEA/cloudy/c13.01/source/cloudy.exe < ${1}

.. warning:: We presently run Cloudy version 13. When newer versions
   of Cloudy become available, the Cloudy input or output formats may
   change, and the present program would need updates.

Finally, our runs with Cloudy are done using the following default
settings (apart from the SED and abundances that are entered by the
user):

-  Hydrogen density small, i.e. :math:`10^{14}` :math:`\mathrm{m}^{-3}`
   (:math:`10^8` :math:`\mathrm{cm}^{-3}`)

-  Column density small, i.e. :math:`10^{20}` :math:`\mathrm{m}^{-2}`
   (:math:`10^{16}` :math:`\mathrm{cm}^{-2}`)

-  Use the “iterate to convergence” command of Cloudy

-  Values of :math:`\log\xi` between :math:`-8.5` and :math:`+6.5` with
   steps of :math:`0.1`

Note that, depending on the computer used, this program may run for
several hours. During execution it should display the present value of
:math:`\log\xi` and the electron temperature in eV for each step of
:math:`\log\xi` between :math:`-8.5` and :math:`+6.5`. This number
should update regularly. If it does not, then it is possible that the
calculation is stuck. This usually happens if the used model cannot
calculate the lowest values for :math:`\xi`. If so, you may want to
change the :math:`\log\xi` range. This can be done by providing the flag
``-r`` at the command line when xabsinput is started.

.. warning:: We note that up to and including version 13.03 of Cloudy,
   :math:`L_{\mathrm ion}` in the definition of :math:`\xi` was actually the
   total bolometric ionising luminosity. However, from the upcoming version
   13.04 of Cloudy this is corrected in the Cloudy code to be consistent
   with the commonly used definition, where :math:`L_{\mathrm ion}` ranges
   between 1 to 1000 Ryd. Thus, we recommend using the xabsinput program
   with Cloudy version 13.04.
