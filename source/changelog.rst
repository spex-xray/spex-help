Changelog
=========

What is new in SPEX version 3.00 compared to SPEX 2.06? Most of the changes are
actually “under the hood” of the SPEX program and are only noticed when
model fits are compared, but we also provide useful new model additions.
A more detailed overview of the changes in the plasma models can be
found in Section :ref:`chap:plasmamodel`. The most important changes are
summarized here:

-  The first version of the new atomic database prepared by Ton Raassen
   is included in this release. It contains hundreds of thousands of
   energy levels from hydrogen to zinc. The new database is not yet
   enabled by default (see command ``var calc new``). Using the new line
   database requires more memory and CPU time then before, which may not
   be needed in every case. Enable the new line list if you need more
   accuracy, for example when you fit high-resolution spectra.

-  We have optimized the calculation of the radiative recombination,
   di-electronic recombination, two-photon, and proton excitation
   processes to be able to calculate a spectrum from the new atomic data
   within a reasonable time. The results from full calculations were
   approximated by functions that can be calculated much faster, which
   allows the fitting of complicated spectra with models containing a
   large range of physical parameters of the plasma.

-  The photo-ionization model ``pion`` has been substantially improved.
   It is now possible to model several absorption layers with including
   their radiative transfer. Also the emission part is implemented.
   However, use with care since this model is still experimental.

-  We included natural & Voigt broadening to SPEX emission models.

-  We introduce a new charge exchange model (``cx``) developed by
   `Gu et al. (2016) <https://ui.adsabs.harvard.edu/abs/2016A%26A...594A..78G/abstract>`_.

-  We added the ``ebv`` component in SPEX to model interstellar extinction.

-  There are now interfaces to include your own model in SPEX. Use
   ``com user`` for additive models and ``com musr`` for multiplicative
   models. Examples of how to use this model component are shown in the
   revised SPEX Cookbook. It also allows you to call Xspec models from
   SPEX.

-  We added a line emission/absorption model with a Voigt profile
   (``com line``) to model individual lines.

-  Contour plots of :math:`\chi^2` values from the ``steppar`` command
   can now be plotted using the ``stepcontour`` task. The ``steppar``
   command can now export the results to an ASCII file that
   ``stepcontour`` can convert into a quick contour plot (or QDP file).

-  The SPEX syntax has been slightly changed. From now on, all ranges
   can be written with a ’:’ in between to improve the consistency of
   the syntax. For example, changing the X axis of a plot can now be
   written as: ``plot rx 0.1:10``. Affected commands are ``plot``,
   ``egrid``, ``elim``, ``dem chireg``, ``step axis``, and
   ``par ... range``. If possible, the old syntax was also kept alive.
   Check the manual for details.

-  C-statistics, the `Bryans et al. (2009)
   <https://ui.adsabs.harvard.edu/abs/2009ApJ...691.1540B/abstract>`_
   ionization balance and the proto-solar abundances by `Lodders et al. (2009)
   <https://ui.adsabs.harvard.edu/abs/2009LanB...4B..712L/abstract>`_
   are now the default in SPEX. The abundance table and the ionisation
   balance can now be queried using the commands ``abun show`` and
   ``ibal show``, respectively.

Version 3.01.00
---------------

-  To optimize for calculation speed, in the new line list, one can
   select ions that should be calculated the old way (``ions old``) or
   the new way (``ions new``). The syntax is the same as the
   ``ions ignore`` and ``ions use`` commands.

-  Added sorting option to the command ``asc ter ... line`` to sort
   lines based on emissivity.

-  In version 3.00.00 (using the new line database, ``var calc new``),
   we had also included dielectronic satellite lines of He-like ions of
   the type 1s2 :math:`=>` 2s 2p2, which actually are trielectronic
   recombination lines. The 2s 2p2 levels decay rapidly through
   radiation of a photon (2p to 1s transition) to the 1s 2s 2p level,
   which decays further by a similar transition to the 1s2 2s ground
   state of Li-like iron. Therefore, our model predicts relatively
   strong satellite lines from these transitions, stronger than present
   in corresponding EBIT spectra. We have resolved this issue by for
   this moment omitting transitions from these triply excited states
   from the calculations. Note they were/are absent in SPEX version 2.0
   or all APEC versions.

-  The new CIE model did not reproduce the x/y line ratio in He-like
   iron very well. The x & y lines are the two intercombination lines in
   this ion. We traced this problem down to some confusion caused by
   different notations for line levels. The NIST database, the Cowan
   code, Chianti use different notations for the same transition: some
   use 1s2s(3S)2p 2P1/2, others 1s2s(1S)2p 2P1/2 for the same transition
   (same if you compare the values of the corresponding energy levels).
   Some others couple the 2s and 2p electrons first, leading to P
   states, and then attach the 1s electron to it, leading to again
   different notations. This confusion led to an interchange of
   collisonal and radiative rates between some levels, thereby affecting
   the x/y line intensities. This has now been fixed.

-  The innershell levels and related auger and radiative transitions for
   Fe XIX to Fe XXIII are added using the data from `Palmeri et al. (2003)
   <https://ui.adsabs.harvard.edu/abs/2003A%26A...410..359P/abstract>`_.

Version 3.02.00
---------------

-  Updated pion model (details will be described soon).

-  Re-installed the tri-electronic recombination transistions (details
   will be described soon).

-  Introduced the SPEXACT naming and versioning for the atomic code and
   tables in SPEX.

Version 3.03.00
---------------

In SPEX 3.03.00:

-  Fixed bug related to opening many fits files.

-  Fixed bug in data merge regarding the deallocation of the derivative
   array.

-  Fixed bug in the calculation of the average exposure time in data
   show.

In SPEXACT 3.03.00:

-  Fixed bug in generation of atomic data files.

-  Added Auger rates for O V, Ne VII, Fe XIII.

-  Ionization limits added for Mg IX, Si XI, S XIII, Ar XV.

-  Atomic data extended including autoionisation for Be-like ions.

-  Added correction for auto-ionization for excitation and inner-shell
   ionisation to doubly excited levels.

-  Update and bugfix for CX model (H-H collision).

-  Updated ionisation balance for U16.

Version 3.04.00
---------------

In SPEX 3.04.00:

-  The ionisation balance is now by default `Urdampilleta et al. (2017)
   <https://ui.adsabs.harvard.edu/abs/2017A%26A...601A..85U/abstract>`_
   The actual data did not change, but the paper was published in 2017.
   The command ``ibal u16`` still works, but gives a warning message
   that the actual command is ``ibal u17`` from now on.

-  Fixed bug in stepcontour program related to logarithmic grids.

In SPEXACT 3.04.00:

-  Fixed bugs in the CIE, NEIJ, CX and PION models.

-  Included radiative recombination cooling following `Mao et al. (2017)
   <https://ui.adsabs.harvard.edu/abs/2017A%26A...599A..10M/abstract>`_.

-  Updates of PION model.

-  Updated Auger rates for Be-like to C-like Fe.

-  Ni XXI of the O-like added and some Fe ions extended.

-  Now we multiply the emission measure by n\ :math:`_e`/n:math:`_H` in
   the pion model. This will result in typically 20% more emission from
   the pion model.

-  Added the tmod option to the pion model (see [sec:pion]), allowing to
   set the temperature and not solve for energy balance (useful for hot
   stars, the WHIM etc.).

-  Allowed to use multiple solutions in the pion model (fmod and soln
   parameters).

-  Allowed for external heating source in the pion model (exth
   parameter).

-  Extended the pion model with all elements from Z=1 to Z=30.

-  Fe XX levels modified to Nist5.

-  Bug fix: Now we use the proper argument 2 (y) in the call to the
   integrated Voigt function sivf. The Lorentzian component is now 2x
   narrower than before, which does affect the CIE emission spectra. It
   does not affect “old” xabs, hot calculations etc.

-  Extended data for Fe XXI, Fe XXII, and Fe XXIII.

Version 3.05.00
---------------

In SPEX 3.05.00:

-  Bug in sector copy fixed.

-  Fixed additional page problem in postscript output of plot.

-  Introduced W-statistics (not recommended for use).

-  Xabsinput can now handle SEDs with more than 1024 bins.

-  New version of trafo that adds the Ext\_rate column to a .spo file.
   This column is necessary to properly simulate a spectrum when there
   is a background spectrum present. The Ext\_rate column shows the
   ratio of the backscales of the source and background spectrum.

-  Simulate command syntax changed.

-  When calculating errors of multiple parameters with one error
   command, parameters of the best fit found across all parameters are
   written to ``spex_lower_chi.com``, if a better minimum was found.

-  Spectra dumped with ``plot adum`` now contain a ’NO’ to separate the
   spectra.

-  The sector command can now dump a model to a text file that can be
   read in by the SPEX file model. This could be helpful when one wants
   to model the background without evaluating the model each time.

-  Added correlation information in the output of the ``par show``
   command.

-  Added the instrument normalisation to the output of ``par write``.

-  Replaced a few proprietary math routines with open source
   alternatives.

-  Applied GPL license to SPEX and prepared source code for publication.

-  Added first version of SPEX tests to the source code directory.

-  Fixed bug in the check of the number of free instrument
   normalisations in the model.

SPEXACT 3.05.00:

-  Bug and stability fixes for the pion model.

-  Bugfix in the temperature grid of the cooling-flow model. Mass
   deposition rates are now consistent with other cooling-flow models.

-  Stability issue with the free-bound calculation resolved.

-  Fixed small issue in the charge exchange model for Fe XXIII.

Version 3.06.00
---------------

In SPEX 3.06.00:

-  The new SPEX manual can now be found at: `<https://spex-xray.github.io/spex-help/>`_

-  Added a Python interface to SPEX (Experimental, see :ref:`sec:pyspexidx`)

-  User can now control the random seed in simulations (see :ref:`sec:simulate`).

-  User can now control the output of the command ``par show`` (see :ref:`sec:par`).

-  Next to Levenberg-Marquardt, we also added the simplex and simulated annealing fit methods (see :ref:`sec:fit`).

-  Introduced the ``ions mute`` and ``ions unmute`` commands (see :ref:`sec:ions`).

-  The help texts in SPEX now contain links to the online documentation (Ctrl-<click> to open in browser).

In SPEXACT 3.06.00:

-  Model calculations now in double precision.

-  Added new dust extinction models (see :ref:`sec:amolmodel`).

-  Added adiabatic cooling to the pion model.

-  Added new cooling by Stofanova et al. (submitted).

-  Added cooling by di-electronic recombination.

-  The definition of microturbulent velocity in emission models has been changed to Vrms (see :ref:`sect:turbulence`).

-  The ``ebv`` model now contains a switch to put the Milky way bump on and off.

-  Atomic data:

   *  Fe-L data from `Gu et al. (2019) <https://ui.adsabs.harvard.edu/abs/2019A%26A...627A..51G/abstract>`_.

   *  O II, Mg VI, S X, Ar XII, Ca XIV, Ti XVI, Cr XVIII

   *  Absorption lines of Ne II, Ne III, Mg I and Si I have been updated using Juett et al. (2006) for Ne. The Mg I
      and Si I have been updated using calculations with FAC and COWAN respectively.

Version 3.06.01
---------------

This SPEX release mainly fixes a few important bugs found after the release of SPEX 3.06.00.

In SPEX 3.06.01:

- Added par_show function to pyspex for use with Jupyter Notebook.

- Added functionality to ascdump, both in SPEX and in pyspex. The ascdump command in SPEX has now the
  ``set range`` and ``set flux`` options to limit the output to a certain energy range or to lines
  with a minimum flux or optical depth.

- Added a command to remove one (or a couple of) lines from emission spectra. With the ``ions mute line``
  command, a line can be selected for removal from the spectrum. This is especially helpful when a line
  shows effects that SPEX does not model, but can be fitted with a customized Gaussian/line profile.

In SPEXACT 3.06.01:

- The collisional excitation cross sections for H I at low and intermediate
  temperatures were too low. After carefull comparison, we have chosen to
  replace the 1s-nl and 2s-nl transitions (n.le.5) with the ones as given
  in the Chianti database. That is based on the Anderson et al. 2002 erratum
  with a sensible extrapolation to higher energies.

  .. Warning:: The update above affects both emitted H I spectra, and the total cooling
     rate at the lower temperatures (few eV) in the ``pion`` model. That cooling rate
     may differ at some temperatures by a factor of 3-4. Therefore results obtained
     with the most recent SPEX version will differ from those of version 3.05 and earlier.

- Due to improvements in the charge exchange processes, the hot model (:ref:`sect:hot`)
  now behaves differently at low temperatures. Where previous versions of SPEX produced a
  neutral gas at :math:`5 \times {10}^{-4}` keV, now the temperature needs to be lowered,
  because charge exchange still causes ionizations at this temperature. Because of this,
  we have changed the default temperature of ``hot`` to :math:`8 \times 10^{-6}` keV.
  At this temperature, the modeled gas is neutral and comparable to ``hot`` results
  produced by previous SPEX versions.

- Fixed a problem with Li-like Fe-L data (remove high multipole transitions arisen from a bug in FAC).

- Fixed a bug in the NEIJ model which produced wrong ion concentrations from SPEX version 3.05.

- Added pyroxene and DNA to amol model.

- Updates to ions: C I, N II, O II, Ne IV, Cr IV, Cr V, Mn V, Mn VI.

Version 3.07.00
---------------

This is a SPEX version with a number of new models, updates to atomic data and many more new features
and bugfixes.

Changes in SPEX 3.07.00:
''''''''''''''''''''''''

- Doppler velocity parameter ``zv`` and the ``reds`` model in velocity mode is now relativistic.

- Added 3D cluster model including resonant scattering, see :ref:`sect:clus`.

- Added time-dependent photoionisation model (TPHO), see :ref:`sec:tpho`.

- Generalized output from the ascdump command. Includes many more selection, sorting and
  display options. Now also fits output is possible (see :ref:`sec:ascdump`).

- Added support for multiple matrix extensions in new XRISM and Athena response matrices.

- Use different fit statistics for different instruments (see :ref:`sec:fit`).

- Extended the ebv model to include the Gordon et al. SMC model (see :ref:`model_evb`).

- Several fixes to make SPEX compile on newer GCC versions and Macs.

- Trafo now contains an option to calculate response derivatives.

- Expanded the use of double precision to a large part of SPEX.

Changes in SPEXACT 3.07.00:
'''''''''''''''''''''''''''

- Updated ions: Fe IX, Ni XI, Ni XX, Cr XII, Cr XVI, Ti XIV, Ca XII.

- Atomic data updates on L-shell calculation of Mg, Si, S, Ar, Ca, Cr, Mn, Ni.

- The hot and slab model now use SPEXACT v3 atomic data. It is still possible to switch
  between SPEXACT v2 and v3 by using the ``var calc old/new`` command.

- Charge exchange recombination and ionization rates update: Kingdon-Ferland
  rates added; also allow to choose between Arnaud-Rothenflug and Kingdon-Ferland (var cxcon).

- Magnetic field dependence of lines added to the hot (:ref:`sect:hot`) and cie (:ref:`sect:cie`) models.

- Added ``aerror`` command to estimate errors in parameters due to uncertainties in atomic data (see :ref:`sec:aerror`).

Changes in PYSPEX 3.07.00:
''''''''''''''''''''''''''

- Added and modified PYSPEX commands to match new SPEX commands.

- Output data is now offered as Astropy Quantities and QTables (see :ref:`pyspex_astropy`).

- Added option to plot in wavelength (Angstrom), see :ref:`pyspex_plot`.
