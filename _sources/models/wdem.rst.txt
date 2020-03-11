Wdem: power law differential emission measure model
===================================================

This model calculates the spectrum of a power law distribution of the
differential emission measure distribution. It appears to be a good
empirical approximation for the spectrum in cooling cores of clusters of
galaxies. It was first introduced by `Kaastra et al. (2004)
<https://ui.adsabs.harvard.edu/abs/2004A%26A...413..415K/abstract>`_
and is defined as follows:

.. math::
   \frac{ {\mathrm d}Y }{ {\mathrm d}T } = \left\{
   \begin{array}{ll}
   0            & \qquad \mathrm{if} \quad T \leq \beta T_{\max} ; \\
   cT^{\alpha}  & \qquad \mathrm{if} \quad \beta T_{\max} < T < T_{\max} ;\\
   0            & \qquad \mathrm{if} \quad T \geq T_{\max} .
   \end{array} \right.
   :label: demalpha

Here :math:`Y` is the emission measure
:math:`Y \equiv n_{\mathrm H} n_{\mathrm e} V` in units of
:math:`10^{64}` :math:`\mathrm{m}^{-3}`, where :math:`n_{\mathrm e}` and
:math:`n_{\mathrm H}` are the electron and Hydrogen densities and
:math:`V` the volume of the source.

For :math:`\alpha\rightarrow\infty`, we obtain the isothermal model, for
large :math:`\alpha` a steep temperature decline is recovered while for
:math:`\alpha=0` the emission measure distribution is flat. Note that
`Peterson et al. (2003) <https://ui.adsabs.harvard.edu/abs/2003ApJ...590..207P/abstract>`_
use a similar parameterisation but then for the differential luminosity
distribution). In practice, we have implemented the model :eq:`demalpha` by
using the integrated emission measure :math:`Y_{\mathrm{tot}}` instead of
:math:`c` for the normalisation, and instead of :math:`\alpha` its
inverse :math:`p=1/\alpha`, so that we can test isothermality by taking
:math:`p=0`. The emission measure distribution for the model is binned
to bins with logarithmic steps of 0.10 in :math:`\log T`, and for each
bin the spectrum is evaluated at the emission measure averaged
temperature and with the integrated emission measure for the relevant
bin (this is needed since for large :math:`\alpha` the emission measure
weighted temperature is very close to the upper temperature limit of the
bin, and not to the bin centroid). Instead of using :math:`T_{\min}`
directly as the lower temperature cut-off, we use a scaled cut-off
:math:`\beta` such that :math:`T_{\min} = \beta T_{\max}`.

From the parameters of the wdem model, the emission weighted mean
temperature :math:`kT_{\mathrm{mean}}` can be calculated
`de Plaa et al. (2006) <https://ui.adsabs.harvard.edu/abs/2006A%26A...452..397D/abstract>`_:

.. math::
   T_{\mathrm{mean}} = \frac{(1+\alpha)}{(2+\alpha)}
                      \frac{(1 - \beta^{2+\alpha})}{(1 - \beta^{1+\alpha})} ~T_{\mathrm{max}}

.. warning:: Take care that :math:`\beta<1`. For :math:`\beta=1`, the
   model becomes isothermal, regardless the value of :math:`\alpha`. The
   model also becomes isothermal for :math:`p`\ =0, regardless of the value
   of :math:`\beta`.

.. warning:: For low resolution spectra, the :math:`\alpha` and
   :math:`\beta` parameters are not entirely independent, which could lead
   to degeneracies in the fit.

The parameters of the model are:

| ``norm`` : Integrated emission measure between :math:`T_{\min}` and
  :math:`T_{\max}`
| ``t0`` : Maximum temperature :math:`T_{\max}`, in keV. Default: 1 keV.
| ``p`` : Slope :math:`p=1/\alpha`. Default: 0.25 (:math:`\alpha = 4`).
| ``cut`` : Lower temperature cut-off :math:`\beta` , in units of
  :math:`T_{\max}`. Default value: 0.1.

The following parameters are the same as for the cie-model:

| ``ed`` : Electron density in :math:`10^{20}` :math:`\mathrm{m}^{-3}`
| ``it`` : Ion temperature in keV
| ``vrms`` : RMS Velocity broadening in km/s (see :ref:`sect:turbulence`)
| ``ref`` : Reference element
| ``01...30`` : Abundances of H to Zn
| ``file`` : Filename for the nonthermal electron distribution

*Recommended citation:* `Kaastra et al. (2004)
<https://ui.adsabs.harvard.edu/abs/2004A%26A...413..415K/abstract>`_.
