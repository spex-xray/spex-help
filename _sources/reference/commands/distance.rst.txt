.. _sec:distance:

Distance: set the source distance
=================================

  .. highlight:: none

Overview
~~~~~~~~

One of the main principles of SPEX is that spectral models are in
principle calculated at the location of the X-ray source. Once the
spectrum has been evaluated, the flux received at Earth can be
calculated. In order to do that, the distance of the source must be set.

SPEX allows for the simultaneous analysis of multiple sky sectors. In
each sector, a different spectral model might be set up, including a
different distance. For example, a foreground object that coincides
partially with the primary X-ray source has a different distance value.

The user can specify the distance in a number of different units.
Allowed distance units are shown in the table below.

.. table:: SPEX distance units

   =========== ================================================================
   Abbrevation Unit
   =========== ================================================================
   spex        internal SPEX units of :math:`10^{22}` m (this is the default)
   m           meter
   au          Astronomical Unit, 1.49597892 \ :math:`10^{11}` m
   ly          lightyear, 9.46073047 \ :math:`10^{15}` m
   pc          parsec, 3.085678 \ :math:`10^{16}` m
   kpc         kpc, kiloparsec, 3.085678 \ :math:`10^{19}` m
   mpc         Mpc, Megaparsec, 3.085678 \ :math:`10^{22}` m
   z           redshift units for the given cosmological parameters
   cz          recession velocity in km/s for the given cosmological parameters
   =========== ================================================================

The default unit of :math:`10^{22}` m is internally used in all
calculations in SPEX. The reason is that with this scaling all
calculations ranging from solar flares to clusters of galaxies can be
done with single precision arithmetic, without causing underflow or
overflow. For the last two units (z and cz), it is necessary to specify
a cosmological model. Currently this model is simply described by
:math:`\mathrm{H}_0`, :math:`\Omega_m` (matter density), :math:`\Omega_\Lambda`
(cosmological constant related density), and :math:`\Omega_r` (radiation
density). At startup, the values are:

:math:`\mathrm{H}_0`: 70 km/s/Mpc ,

:math:`\Omega_m`: 0.3 ,

:math:`\Omega_\Lambda`: 0.7 ,

:math:`\Omega_r`:   0.0

i.e. a flat model with cosmological constant. However, the user can
specify other values of the cosmological parameters. Note that the
distance is in this case the luminosity distance.

Note that the previous defaults for SPEX (:math:`\mathrm{H}_0=50`,
:math:`q_0=0.5`) can be obtained by putting H\ :math:`_0=50`,
:math:`\Omega_m=1`, :math:`\Omega_\Lambda=0` and :math:`\Omega_r=0`.

.. warning:: When H\ :math:`_0` or any of the :math:`\Omega` is changed,
             the luminosity distance will not change, but the equivalent
             redshift of the source is adjusted. For example, setting the distance
             first to z=1 with the default :math:`\mathrm{H}_0`\ =70 km/s/Mpc results
             into a distance of :math:`2.039\,10^{26}` m. When :math:`\mathrm{H}_0` is
             then changed to 100 km/s/Mpc, the distance is still :math:`2.168\,10^{26}` m,
             but the redshift is adjusted to 1.3342.

.. warning:: In the output also the light travel time is given. This should
             not be confused with the (luminosity) distance in light years,
             which is simply calculated from the luminosity distance in m!

Syntax
~~~~~~

The following syntax rules apply to setting the distance:

| ``distance [sector #i:]  #r [#a]`` : set the distance to the value #r
  in the unit #a. This optional distance unit may be omittted. In that
  case it is assumed that the distance unit is the default SPEX unit of
  :math:`10^{22}` m. The distance is set for the sky sector range #i:.
  When the optional sector range is omitted, the distance is set for all
  sectors.
| ``distance show`` : displays the distance in various units for all
  sectors.
| ``distance h0 #r`` : sets the Hubble constant :math:`\mathrm{H}_0` to the
  value #r.
| ``distance om #r`` : sets the :math:`\Omega_m` parameter to the value
  #r.
| ``distance ol #r`` : sets the :math:`\Omega_\Lambda` parameter to the
  value #r.
| ``distance or #r`` : sets the :math:`\Omega_r` parameter to the value
  #r.

Examples
~~~~~~~~

| ``distance 2`` : sets the distance to 2 default units, i.e. to 2E22 m.
| ``distance 12.0 pc`` : sets the distance for all sectors to 12 pc.
| ``distance sector 3 0.03 z`` : sets the distance for sector 3 to a
  redshift of 0.03.
| ``distance sector 2 : 4 50 ly`` : sets the distance for sectors 2-4 to
  50 lightyear.
| ``distance h0 50.`` : sets the Hubble constant to 50 km/s/Mpc.
| ``distance om 0.27`` : sets the matter density parameter
  :math:`\Omega_m` to 0.27
| ``distance show`` : displays the distances for all sectors, see the
  example below for the output format.

::

   SPEX> di 100 mpc 
    Distances assuming H0 =  70.0 km/s/Mpc, Omega_m = 0.300 Omega_Lambda = 0.700 Omega_r = 0.000
   Sector       m      A.U.        ly        pc       kpc       Mpc  redshift        cz   age(yr)
   ----------------------------------------------------------------------------------------------
      1 3.086E+24 2.063E+13 3.262E+08 1.000E+08 1.000E+05  100.0000    0.0229    6878.7 3.152E+08
   ----------------------------------------------------------------------------------------------
