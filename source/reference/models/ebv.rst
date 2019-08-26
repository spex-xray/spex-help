Ebv: Galactic interstellar extinction model
===========================================

This model can be used to correct fluxes of optical/UV data for
interstellar reddening in our Galaxy. The reddening is caused by dust
absorption and scattering (extinction) in the interstellar medium. The
model uses the extinction curve of `Cardelli et al. (1989)
<https://ui.adsabs.harvard.edu/abs/1989ApJ...345..245C/abstract>`_.
including the update for near-UV given by `O'Donnell et al. (1994)
<https://ui.adsabs.harvard.edu/abs/1994ApJ...422..158O/abstract>`_.

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
denoted as :math:`{E(B-V)}`. For Milky Way, the typical value for
:math:`R_V` is reported to be 3.1. Thus, by specifying :math:`E(B-V)`
and :math:`R_V`, the extinction :math:`A_\lambda` can be derived,
which in turn gives us the unreddened flux (:math:`F_\lambda`) from
the observed reddened flux (:math:`F_{\lambda}^*`) using
:math:`F_\lambda = (10^{\,0.4 A_\lambda})\, F_{\lambda}^*`.
Note that at energies above the Lyman limit, the transmission of the
model is set to 1 in SPEX, thus it can be used alongside the Galactic
interstellar X-ray absorption models in SPEX.

| The parameters of the model are:
| ``ebv`` : The colour excess :math:`E(B-V)`. The value is set by the
  user.
| ``rv`` : The scalar :math:`R_{V}`. Default (recommended) value: 3.1
| ``fcov`` : The covering factor of the absorber. Default value: 1 (full
  covering)

*Recommended citation:* `Cardelli et al. (1989)
<https://ui.adsabs.harvard.edu/abs/1989ApJ...345..245C/abstract>`_ and
`O'Donnell et al. (1994) <https://ui.adsabs.harvard.edu/abs/1994ApJ...422..158O/abstract>`_.
