Pdem: DEM models
================

The pdem model is intended to be used for differential emission measure
analysis, simultaneous with fitting of abundances etc. of an optically
thin plasma.

It works as follows. The user gives a a number of temperature grid
points :math:`n`, a minimum temperature :math:`T_1`, a maximum
temperature :math:`T_n`, a total emission measure :math:`Y` and relative
contributions :math:`y_1 \ldots y_n`. SPEX assumes that the grid points
between :math:`T_1` and :math:`T_n` are distributed logarithmically.

The relative contributions :math:`y_1\ldots y_n` represents the values
of :math:`{\mathrm d}Y/{\mathrm d}\ln T` (note the logarithm!) at the grid
points. SPEX then interpolates in the :math:`\log T_i - \log y_i` space
on a finer grid using splines. That temperature grid on which the data
are being evaluated has a fine mesh: step size is about 0.10 in
:math:`\log T` (finer is not usefull because uniqueness is no longer
guaranteed), with the additional constraint that the number of mesh
points is at least :math:`n` and not larger than 64 (practical limit in
order to avoid excessive cpu-time). The emission measure distribution is
then simply scaled in such a way that its sum over the fine mesh equals
the total emission measure :math:`Y` that went into the model.

.. Warning::At least one of the :math:`y_i` values should be kept
   frozen during fitting, when :math:`Y` is a free parameter, otherwise no
   well defined solution can be obtained! If :math:`Y` is fixed, then all
   :math:`y_i` can be free.

The parameters of the model are:

| ``norm`` : Normalisation, i.e. total integrated emission measure
  :math:`Y` in units of :math:`10^{64}` :math:`\mathrm{m}^{-3}`.
| ``t1`` : Lower temperature :math:`T_1` in keV.
| ``tn`` : Upper temperature :math:`T_n` in keV.
| ``npol`` : Number of temperature grid points :math:`n`; minimum value
  2, maximum value 8.
| ``y1`` : Relative contribution :math:`y_1` at :math:`T_1`.
| ``y2`` : Relative contribution :math:`y_2` at :math:`T_2`
| :math:`\ldots` ``y8`` : Relative contribution :math:`y_8` at
  :math:`T_8`; note that the higher contributions :math:`y_i` are
  neglected if :math:`i>n`.
| The following parameters are the same as for the cie-model: 
| ``ed`` : Electron density in :math:`10^{20}` :math:`\mathrm{m}^{-3}`.
| ``it`` : Ion temperature in keV.
| ``vrms`` : RMS Velocity broadening in km/s (see :ref:`sect:turbulence`)
| ``ref`` : Reference element.
| ``01...30`` : Abundances of H to Zn.
| ``file`` : Filename for the nonthermal electron distribution
| Note that the true emission measure on the finer mesh can be displayed
  by using the "ascdump term # # dem" command; you will get a list of
  temperature (keV) versus emission measure.
