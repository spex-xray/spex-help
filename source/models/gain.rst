Gain: Modify the energy scale of the model to compensate instrumental gain errors
=================================================================================

This multiplicative, operative model allows to stretch the energy scale of the spectral
model to which it is applied. The number of photons is conserved, but the energy 
:math:`E` of each photon is changed to :math:`E^{\prime}` with the relation:

.. math:: E^{\prime} = E (1 + z(x)),

where :math:`x` can be either energy E, wavelength :math:`\lambda`, or the logarithm of energy or wavelength.
The function :math:`z(x)` is a Chebychev polynomial with up to 10 terms, defined in 
the energy interval :math:`E_1` to :math:`E_2` (always given as energy in keV, even when the user
chooses to use :math:`x` as logarithmic value or wavelength.

The user also has an option to produce an ascii-file named 'spexgain.asc' in the directory
where SPEX is running. This contains three columns: the original energy :math:`E` in keV, the
modified energy :math:`E^{\prime}` in keV, and the factor :math:`z(x)` at that energy.
This output is only produced when the parameter out=1 is set.

.. Warning:: although the model does not put constraints upon the amplitudes of the Chebychev
   polynomials (they are in principle fittable parameters), the user must take care that their
   values are not too extreme. For extreme values, the modified energies :math:`E^{\prime}`
   may not be a monotonous function of their index, which may lead to unreliable or wrong results.
   When the flag "out=1" is turned on, the user gets a warning when this condition occurs
   (turning the mode on during spectral fitting may produces repeated error warnings for each
   evaluation where this condition occurs, so be warned).
   
.. Warning:: :math:`z(x)` is only evaluated between the energies :math:`E_1` and
   :math:`E_2`. Outside this range, we put :math:`z(x)=0`. Note that this may lead to some
   discontinuities at the energies :math:`E_1` or  :math:`E_2`. For this reason, their
   derfault values are put to very small resp. very high values.


The parameters of the model are:

| ``n`` :  The maximum number of polynomial terms that is desired. Default value is 1,
  maximum is 10. Note  that for n less than 10, all Chebychev terms larger than n are ignored,
  even if the corresponding scaling parameter is non-zero.
| ``wav`` : Wheter to use an energy grid (wav=0, default) or a wavelength grid (wav=1) for the
  evaluation of the Chebychev polynomials.
| ``log`` : Wheter to use a linear grid (log=0, default) or a logarithmic grid (log=1) for the
  evaluation of the Chebychev polynomials.
| ``e1`` : The Chebychev polynomials are evaluated only between energy :math:`E_1` and
  :math:`E_2` (both in keV). Default value: :math:`E_1=10^{-20}`. Outside this range
  we force :math:`z(x)=0`.
| ``e2`` : The Chebychev polynomials are evaluated only between energy :math:`E_1` and
  :math:`E_2` (both in keV). Default value: :math:`E_2=10^{20}`.
| ``out`` : Whether output of the gain correction (out=1) is desired or not (out=0, default).
| ``p0`` : first chebychev term (a constant). Note that due to the definition of chebychev
  polynomials, the gain is half of this; for example, p0=0.1 leads toa 5\% gain correction. 
  Default value: 0. 
| ``p1`` : next chebychev term (linear). Default value 0.
| ``p2`` : next chebychev term (linear). Default value 0.
| :math:`\ldots` ``p9`` : 9th order chebychev term. Default value 0.

