.. _sec:slab:

Slab: thin slab absorption model
================================

The *slab* model calculates the transmission of a slab of material,
where all ionic column densities can be chosen independently. This has
the advantage that a spectrum can be fit without any knowledge of the
ionisation balance of the slab. After a spectral fit has been made, one
may try to explain the observed column densities by comparing the with
predictions from any model (as calculated by SPEX, Cloudy, XSTAR, ION or
any other existing (photo)ionisation code).

For more information on this model, the atomic data and parameters we
refer to :ref:`sect:abs_models`. Below we do
not list all the parameters of the model, but for each ion of H, He, C,
N, O, Ne, Na, Mg, Al, Si, S, Ar, Ca, Fe and Ni there is a parameter,
namely the logarithm (base 10) of the column density in SI units
(:math:`\mathrm{m}^{-2}`). So, a H  column of :math:`10^{28}` :math:`\mathrm{m}^{-2}`
(:math:`10^{24}` :math:`\mathrm{cm}^{-2}` should be entered as 28.0. The default
values of 1 therefore correspond to an almost negligible column.

.. Warning:: We do include here fully stripped ions, as their free
   electrons do produce Thomson scattering. However, the user is advised
   not to take more than one column density of a bare nucleus as a free
   parameter, as the shape of the Thomson scattering contribution is the
   same for all electrons, regardless from which ion they came from. In the
   spectral fitting, there would be 100% correlations between the column
   densities of these bare ions, which is undesirable.

The parameters of the model are:

| ``h1`` : log column density (:math:`\mathrm{m}^{-2}`) of H . Default value: 1.
| ``h2`` : log column density (:math:`\mathrm{m}^{-2}`) of H . Default value: 1.
| ``he1`` : log column density (:math:`\mathrm{m}^{-2}`) of He . Default value:
  1.
| ``he2`` : log column density (:math:`\mathrm{m}^{-2}`) of He . Default value:
  1.
| ``he2`` : log column density (:math:`\mathrm{m}^{-2}`) of He . Default value:
  1.
| ``c1`` : log column density (:math:`\mathrm{m}^{-2}`) of H . Default value: 1.
| :math:`\ldots`
| ``ni27`` : log column density (:math:`\mathrm{m}^{-2}`) of Ni . Default value:
  1.
| ``ni28`` : log column density (:math:`\mathrm{m}^{-2}`) of Ni . Default value:
  1.

The following parameters are common to all our absorption models:

| ``fcov`` : The covering factor of the absorber. Default value: 1 (full
  covering)
| ``v`` : Root mean square velocity :math:`\sigma_{\mathrm v}`
| ``rms`` : Rms velocity :math:`\sigma_{\mathrm b}` of line blend
  components
| ``dv`` : Velocity distance :math:`\Delta v` between different blend
  components
| ``zv`` : Average systematic velocity :math:`v` of the absorber

*Recommended citation:* `Kaastra et al. (2002)
<https://ui.adsabs.harvard.edu/abs/2002A%26A...386..427K/abstract>`_.
