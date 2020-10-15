Tpho: Time-dependent, non-equilibrium, photoionised plasma model
================================================================

The *tpho* model computes the state of a photoionised plasma that is out
of equilibrium due to changes in the ionising radiation. In the *pion*
model, which corresponds to a photoionisation equilibrium (PIE) plasma,
the heating=cooling solution is found for the plasma. However, in the
*tpho* model this is not necessarily the case. Depending on the spectral
energy distribution (SED) variation, and the parameters of the plasma
(such as its density), heating does not balance cooling in the plasma.
The *tpho* model can be considered to be analogous to the *neij* model
in SPEX, but for a photoionised plasma case.

For the *tpho* computation the user provides the X-ray lightcurve of the
ionising source as an input file. At time=0, the model is calculated at
PIE condition like the *pion* model. Then at time > 0, the heating and
cooling processes are calculated as the SED is scaled according to the
provided lightcurve. The state of the plasma is evolved and the
corresponding non-equilibrium temperature is calculated at each step. At
t=final, the evolution and calculations finish, and the final spectrum
is displayed in SPEX. The *tpho* model also has an option to store
intermediate results of the computations (from time=0 to time=final) as
ASCII outputs for further examination by the user outside of SPEX.

| The parameters of the model are:
| ``nh``: Hydrogen column density in :math:`10^{28}` :math:`\mathrm{m}^{-2}`. Default
  value: :math:`10^{-4}` (corresponding to :math:`10^{24}` :math:`\mathrm{m}^{-2}`).
| ``xi``: the :math:`^{10}\log` of the initial (time=0) ionisation parameter
  :math:`\log\xi` in units of :math:`10^{-9}` W m. Default value: 1.
| ``mode``: This parameter specifies how
  the ionising SED is taken into account. Mode=1 means use the continuum
  models that the user has set up in SPEX (e.g. pow). This mode is the
  same as how the continuum is used in the *pion* model. Mode=2 means an
  input SED file in ASCII format is read.
| ``sed``: The name of the input SED
  file, if mode=2. The format of this file is like the *file* model in
  SPEX and is as following: the 1st line contains the number of data
  points, and the next lines provide the energy in keV (1st column) and
  the flux in :math:`10^{44}` photons/s/keV (2nd column). Remember to use
  ’aval’ instead of ’val’ when setting the name of the parameter in
  SPEX.
| ``lc``: The name of the file containing the lightcurve. The first
  column is time in second, and the second column is the X-ray flux
  (energy per unit area per second). Remeber to use ’aval’ instead of
  ’val’ when setting the name of the parameter in SPEX.
| ``hden``: Hydrogen number density in :math:`10^{20}` :math:`\mathrm{m}^{-3}`.
| ``fcov``: The covering factor of the absorber. Default value: 1 (full covering)
| ``v``: Root mean square velocity :math:`\sigma_{\mathrm v}`
| ``rms``: Rms velocity :math:`\sigma_{\mathrm b}` of line blend components
| ``dv``: Velocity distance :math:`\Delta v` between different blend components
| ``zv``: Average systematic velocity :math:`v` of the absorber
| ``ref``: Reference element for abundances
| ``01..28``: Abundances of H to Ni; only here we take H, He, C, N, O,
  Ne, Na, Mg, Al, Si, S, Ar, Ca, Fe, Ni.
| ``info``: Flag for writing out the intermediate calculation results into ASCII
  files. Info=0 (default) does not write any files, while info=1 writes
  the intermediate results into a directory called ``tpho_info``. The
  following ASCII files are produced: plasma.dat (1st column: time (s),
  2nd column: ionisation parameter xi in erg cm /s, 3rd column: T in keV);
  ``heat_cool.dat`` (1st column: total heating in :math:`\mathrm{W m^{-3}}`,
  2nd column: total cooling in :math:`\mathrm{W m^{-3}}`);
  ``ionic_conc.dat`` (the ioninc concentrations);
  ``spect.dat`` (1st column: E in keV, 2nd column: transmission) We note that
  currently only the final spectrum (at t=final) can be stored; the user
  however can modify the t=final in the lightcurve file to be able to see
  the spectrum at the desired time in SPEX.

*For questions and issues regarding the model please contact Missagh
Mehdipour and Daniele Rogantini.*
