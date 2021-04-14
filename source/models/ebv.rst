Ebv: Galactic interstellar extinction model
===========================================

This model can be used to correct fluxes of optical/UV data for
interstellar reddening in our Galaxy. The reddening is caused by dust
absorption and scattering (extinction) in the interstellar medium. 

There are two different models used, indicated by the parameter ``mode``

For mode=1 or 2, the
model uses the extinction curve of `Cardelli et al. (1989)
<https://ui.adsabs.harvard.edu/abs/1989ApJ...345..245C/abstract>`_.
including the update for near-UV given by `O'Donnell et al. (1994)
<https://ui.adsabs.harvard.edu/abs/1994ApJ...422..158O/abstract>`_.

For mode=3, the model uses the SMC extinction curve of `Gordon et al. (2003)
<https://ui.adsabs.harvard.edu/abs/2003ApJ...594..279G/abstract>`_.

The extinction law can be expressed as:

.. math::
   ({A_\lambda }/{A_V}) = {a_\lambda } + ({b_\lambda }/{R_V})

where, :math:`A_\lambda` and :math:`A_V` are the total extinctions
(measured in magnitude) at wavelength :math:`\lambda` and the
:math:`V`-band, respectively. The wavelength- dependent parameters
:math:`a_\lambda` and :math:`b_\lambda` are provided by the
aforementioned papers. The scalar :math:`R_V` is defined as the ratio
of total extinction :math:`A_V` to selective extinction
:math:`{A_{B} - A_{V}}`, where :math:`A_B` is the total extinction at
the :math:`B`-band. So the selective extinction
:math:`{A_{B} - A_{V}}` represents a colour excess, which is commonly
denoted as :math:`{E(B-V)}`. For the Milky Way, the typical value for
:math:`R_V` is reported to be 3.1. Thus, by specifying :math:`E(B-V)`
and :math:`R_V`, the extinction :math:`A_\lambda` can be derived,
which in turn gives us the unreddened flux (:math:`F_\lambda`) from
the observed reddened flux (:math:`F_{\lambda}^*`) using
:math:`F_\lambda = (10^{\,0.4 A_\lambda})\, F_{\lambda}^*`.
Note that at energies above the Lyman limit, the transmission of the
model is set to 1 in SPEX, thus it can be used alongside the Galactic
interstellar X-ray absorption models in SPEX. 

These parameterisations are in particular derived for the optical-UV band.
The model can formally be used also at longer wavelengths; we have secured
that the transmission does not rise above 1 at long wavelengths, which for
some parameter settings may occur. Note however that for an accurate 
IR extinction model (inclusive silicate features etc.) other models are needed which are not (yet)
included in SPEX.

The extinction model of Cardelli et al. is currently the best model for the Milky Way.
However, the extinction curve of the Milky Way has a famous broad bump
at 2175 :math:`\mathrm{\AA}`. The origin of this bump is still not fully
understood. Interestingly, this feature (due to dust) is seen in the
Milky Way and not in other galaxies like in AGN. If one would use the ``ebv``
model to correct for extinction in the host galaxy of an AGN, it is best
to remove this bump from the model as it can have an effect on the fit
to the data. The bump can be removed by setting the ``model`` parameter to 2;
alternatively, the Gordon et al. SMC model can be used.

| The parameters of the model are:
| ``ebv`` : The colour excess :math:`E(B-V)`. The value is set by the
  user.
| ``rv`` : The scalar :math:`R_{V}`. Default (recommended) value: 3.1
| ``fcov`` : The covering factor of the absorber. Default value: 1 (full covering)
| ``mode`` : 1: Cardelli et al. model with bump (default); 2:
 Cardelli et al. model without bump; 3: Gordon et al. SMC model. It is suggested to
 use R_V = 4 for this last case.

*Recommended citation:* `Cardelli et al. (1989)
<https://ui.adsabs.harvard.edu/abs/1989ApJ...345..245C/abstract>`_ and
`O'Donnell et al. (1994) <https://ui.adsabs.harvard.edu/abs/1994ApJ...422..158O/abstract>`_
for mode=1 and 2, and
<https://ui.adsabs.harvard.edu/abs/2003ApJ...594..279G/abstract>`_
for mode=3
