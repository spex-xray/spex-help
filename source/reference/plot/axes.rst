.. _sect:plotaxes:

Plot axis units and scales
==========================

.. _sect:plotunits:

Different units can be chosen for the quantities that are plotted. Which
units are available depends upon the plot type that is used, for example
an observed spectrum (data), a Differential Emission Measure
distribution (DEM) etc. For the available plot types see
Section :ref:`sect:plottypes`.

Note also that depending upon the plot type, there are two or three axes
available, the x-axis, y-axis and z-axis. The last axis is only used for
contour maps or images, and corresponds to the quantity that is being
plotted in the contours or image.

X-axis units
------------

X-axis units for plot type model, data, chi, area, fwhm and spec
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

+-------+------------------------------------------+
| bin   | Bin number                               |
+-------+------------------------------------------+
| kev   | keV (kilo-electronvolt), default value   |
+-------+------------------------------------------+
| ev    | eV (electronvolt)                        |
+-------+------------------------------------------+
| ryd   | Rydberg units                            |
+-------+------------------------------------------+
| hz    | Hertz                                    |
+-------+------------------------------------------+
| ang   | Å (Ångstrom)                             |
+-------+------------------------------------------+
| nm    | nm (nanometer)                           |
+-------+------------------------------------------+
| vel   | :math:`\mathrm{km} \ \mathrm{s}^{-1}`    |
+-------+------------------------------------------+

Note: when using the velocity scale, negative values correspond to a
blueshift, positive values to a redshift. Also note that in this case
one needs to provide the reference energy or wavelength.

X-axis units for plot type dem
""""""""""""""""""""""""""""""

+-------+------------------------------------------+
| bin   | Bin number                               |
+-------+------------------------------------------+
| kev   | keV (kilo-electronvolt), default value   |
+-------+------------------------------------------+
| ev    | eV (electronvolt)                        |
+-------+------------------------------------------+
| ryd   | Rydberg units                            |
+-------+------------------------------------------+
| k     | K (Kelvin)                               |
+-------+------------------------------------------+
| mk    | MK (Mega-Kelvin)                         |
+-------+------------------------------------------+


Y-axis units
------------


Y-axis units for plot type model, spec
""""""""""""""""""""""""""""""""""""""

+--------+---------------------------------------------------------------------------------+
|        | Photon numbers:                                                                 |
+--------+---------------------------------------------------------------------------------+
| cou    | :math:`\mathrm{Photons} \ \mathrm{m}^{-2} \mathrm{s}^{-1}  \mathrm{bin}^{-1}`   |
+--------+---------------------------------------------------------------------------------+
| kev    | :math:`\mathrm{Photons} \ \mathrm{m}^{-2} \mathrm{s}^{-1}  \mathrm{keV}^{-1}`   |
|        | (default value)                                                                 |
+--------+---------------------------------------------------------------------------------+
| ev     | :math:`\mathrm{Photons} \ \mathrm{m}^{-2} \mathrm{s}^{-1}  \mathrm{eV}^{-1}`    |
+--------+---------------------------------------------------------------------------------+
| ryd    | :math:`\mathrm{Photons} \ \mathrm{m}^{-2} \mathrm{s}^{-1}  \mathrm{Ryd}^{-1}`   |
+--------+---------------------------------------------------------------------------------+
| hz     | :math:`\mathrm{Photons} \ \mathrm{m}^{-2} \mathrm{s}^{-1}  \mathrm{Hz}^{-1}`    |
+--------+---------------------------------------------------------------------------------+
| ang    | :math:`\mathrm{Photons} \ \mathrm{m}^{-2} \mathrm{s}^{-1}  \mathrm{Å}^{-1}`     |
+--------+---------------------------------------------------------------------------------+
| nm     | :math:`\mathrm{Photons} \ \mathrm{m}^{-2} \mathrm{s}^{-1}  \mathrm{nm}^{-1}`    |
+--------+---------------------------------------------------------------------------------+
|        | Energy units:                                                                   |
+--------+---------------------------------------------------------------------------------+
| wkev   | :math:`\mathrm{W} \ \mathrm{m}^{-2} \ \mathrm{keV}^{-1}`                        |
+--------+---------------------------------------------------------------------------------+
| wev    | :math:`\mathrm{W}\ \mathrm{m}^{-2} \ \mathrm{eV}^{-1}`                          |
+--------+---------------------------------------------------------------------------------+
| wryd   | :math:`\mathrm{W}\ \mathrm{m}^{-2} \ \mathrm{Ryd}^{-1}`                         |
+--------+---------------------------------------------------------------------------------+
| whz    | :math:`\mathrm{W}\ \mathrm{m}^{-2} \ \mathrm{Hz}^{-1}`                          |
+--------+---------------------------------------------------------------------------------+
| wang   | :math:`\mathrm{W}\ \mathrm{m}^{-2} \ \mathrm{Å}^{-1}`                           |
+--------+---------------------------------------------------------------------------------+
| wnm    | :math:`\mathrm{W}\ \mathrm{m}^{-2} \ \mathrm{nm}^{-1}`                          |
+--------+---------------------------------------------------------------------------------+
| jans   | Jansky (:math:`10^{-26} \  \mathrm{W}\ \mathrm{m}^{-2} \ \mathrm{Hz}^{-1}`)     |
+--------+---------------------------------------------------------------------------------+
|        | :math:`\nu F_{\nu}` units:                                                      |
+--------+---------------------------------------------------------------------------------+
| iw     | :math:`\mathrm{W} \ \mathrm{m}^{-2}`                                            |
+--------+---------------------------------------------------------------------------------+
| ij     | Jansky Hz (:math:`10^{-26} \  \mathrm{W}\ \mathrm{m}^{-2}`)                     |
+--------+---------------------------------------------------------------------------------+
|        | Various:                                                                        |
+--------+---------------------------------------------------------------------------------+
| bin    | Bin number                                                                      |
+--------+---------------------------------------------------------------------------------+

Y-axis units for plot type data
"""""""""""""""""""""""""""""""

+--------+---------------------------------------------------------------------------------+
| bin    | Bin number                                                                      |
+--------+---------------------------------------------------------------------------------+
| cou    | :math:`\mathrm{Counts}`                                                         |
+--------+---------------------------------------------------------------------------------+
| cs     | :math:`\mathrm{Counts} \ \mathrm{s}^{-1}`                                       |
+--------+---------------------------------------------------------------------------------+
| kev    | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{keV}^{-1}`                   |
|        | (default value)                                                                 |
+--------+---------------------------------------------------------------------------------+
| ev     | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{eV}^{-1}`                    |
+--------+---------------------------------------------------------------------------------+
| ryd    | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{Ryd}^{-1}`                   |
+--------+---------------------------------------------------------------------------------+
| hz     | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{Hz}^{-1}`                    |
+--------+---------------------------------------------------------------------------------+
| ang    | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{Å}^{-1}`                     |
+--------+---------------------------------------------------------------------------------+
| nm     | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{nm}^{-1}`                    |
+--------+---------------------------------------------------------------------------------+
| fkev   | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{keV}^{-1}` |
+--------+---------------------------------------------------------------------------------+
| fev    | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{eV}^{-1}`  |
+--------+---------------------------------------------------------------------------------+
| fryd   | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{Ryd}^{-1}` |
+--------+---------------------------------------------------------------------------------+
| fhz    | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{Hz}^{-1}`  |
+--------+---------------------------------------------------------------------------------+
| fang   | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{Å}^{-1}`   |
+--------+---------------------------------------------------------------------------------+
| fnm    | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{nm}^{-1}`  |
+--------+---------------------------------------------------------------------------------+



Y-axis units for plot type chi
""""""""""""""""""""""""""""""

+--------+---------------------------------------------------------------------------------+
| bin    | Bin number                                                                      |
+--------+---------------------------------------------------------------------------------+
| cou    | :math:`\mathrm{Counts}`                                                         |
+--------+---------------------------------------------------------------------------------+
| cs     | :math:`\mathrm{Counts} \ \mathrm{s}^{-1}`                                       |
+--------+---------------------------------------------------------------------------------+
| kev    | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{keV}^{-1}`                   |
|        | (default value)                                                                 |
+--------+---------------------------------------------------------------------------------+
| ev     | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{eV}^{-1}`                    |
+--------+---------------------------------------------------------------------------------+
| ryd    | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{Ryd}^{-1}`                   |
+--------+---------------------------------------------------------------------------------+
| hz     | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{Hz}^{-1}`                    |
+--------+---------------------------------------------------------------------------------+
| ang    | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{Å}^{-1}`                     |
+--------+---------------------------------------------------------------------------------+
| nm     | :math:`\mathrm{Counts} \ \mathrm{s}^{-1} \ \mathrm{nm}^{-1}`                    |
+--------+---------------------------------------------------------------------------------+
| fkev   | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{keV}^{-1}` |
+--------+---------------------------------------------------------------------------------+
| fev    | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{eV}^{-1}`  |
+--------+---------------------------------------------------------------------------------+
| fryd   | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{Ryd}^{-1}` |
+--------+---------------------------------------------------------------------------------+
| fhz    | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{Hz}^{-1}`  |
+--------+---------------------------------------------------------------------------------+
| fang   | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{Å}^{-1}`   |
+--------+---------------------------------------------------------------------------------+
| fnm    | :math:`\mathrm{Counts} \ \mathrm{m}^{-2} \ \mathrm{s}^{-1} \ \mathrm{nm}^{-1}`  |
+--------+---------------------------------------------------------------------------------+
| dchi   | (Observed - Model) / Error (default)                                            |
+--------+---------------------------------------------------------------------------------+
| rel    | (Observed - Model) / Model                                                      |
+--------+---------------------------------------------------------------------------------+


Y-axis units for plot type area
"""""""""""""""""""""""""""""""

+-------+---------------------------+
| bin   | Bin number                |
+-------+---------------------------+
| m2    | :math:`\mathrm{m}^2`      |
|       | (default)                 |
+-------+---------------------------+
| cm2   | :math:`\mathrm{cm}^2`     |
+-------+---------------------------+

Y-axis units for plot type fwhm
"""""""""""""""""""""""""""""""

+--------+------------------------------------------+
| bin    | Bin number                               |
+--------+------------------------------------------+
| kev    | keV (kilo-electronvolt), default value   |
+--------+------------------------------------------+
| ev     | eV (electronvolt)                        |
+--------+------------------------------------------+
| ryd    | Rydberg units                            |
+--------+------------------------------------------+
| hz     | Hertz                                    |
+--------+------------------------------------------+
| ang    | Å (Ångstrom)                             |
+--------+------------------------------------------+
| nm     | nm (nanometer)                           |
+--------+------------------------------------------+
| de/e   | :math:`\Delta E / E`                     |
+--------+------------------------------------------+

Y-axis units for plot type dem
""""""""""""""""""""""""""""""

The emission measure :math:`Y` is
defined as :math:`Y \equiv n_{\mathrm e}n_{\mathrm H}V` and is expressed
in units of :math:`10^{64}` :math:`\mathrm{m}^{-3}`. Here
:math:`n_{\mathrm e}` is the electron density, :math:`n_{\mathrm e}` is
the Hydrogen density and :math:`V` the emitting volume.

+--------+----------------------------------------------+
| bin    | Bin number                                   |
+--------+----------------------------------------------+
| em     | :math:`Y` (default)                          |
+--------+----------------------------------------------+
| demk   | :math:`{\mathrm d}Y/{\mathrm d}T`, per keV   |
+--------+----------------------------------------------+
| demd   | :math:`{\mathrm d}Y/{\mathrm d}T`, per K     |
+--------+----------------------------------------------+

.. _sect:plotscales:

Plot axis scales
----------------

The axes in a plot can be plot in different ways, either linear or
logarithmic.

For the y-axis we also have made an option for a mixed linear and
logarithmic scale. The lower part of the plot will be on a linear scale,
the upper part on a logarithmic scale. This option is useful for example
for plotting a background-subtracted spectrum. Often there are bins with
a low count rate which scatter around zero after background subtraction;
for those channels a linear plot is most suited as a logarithmic scaling
cannot deal with negative numbers. On the other hand, other parts of the
spectrum may have a high count rate, on various intensity scales, and in
that case a logarithmic representation might be optimal. The mixed
scaling allows the user to choose below which y-value the plot will be
linear, and also which fraction of the plotting surface the linear part
will occupy. For an example see the figure below.

.. figure:: mix.png
   :alt: Example of the mixed y-axis scale. Simulation of a Chandra LETGS spectrum for a thermal plasma with a temperature of 1 keV.
   :width: 100.0%

