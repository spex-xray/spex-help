Powerlaw with a Gaussian line
=============================

The files :download:`powgaus.spo </_static/exercises/powgaus.spo>`
and :download:`powgaus.res </_static/exercises/powgaus.res>` contain an absorbed
powerlaw spectrum with a Gaussian line. From an optical observation of
the source we know that this source has a redshift of :math:`z` =
0.0345. There is also Galactic foreground absorption. The source has
been observed with the same instrument as exercise 1.

#. Load the spectrum into SPEX, select the proper energy range and rebin
   the spectrum properly. Set up a model with the right components (a
   gaussian is added with the command ``com gaus``) and fit the
   spectrum.

#. You may want to fit first with the line flux set to zero (freeze or
   fix some parameter of the line, make a fit, and then fine-tune the
   line by releasing the relevant parameters.

   You can find the absorbed and unabsorbed fluxes and luminosity just
   above the fit statistics. The energy limits can be changed by the
   command ``elim``. To change the energy range over which the fluxes
   are calculated, type ``elim 0.2 10.``. This changes the range to
   0.2–10 keV.

#. What is the 2–10 keV luminosity of the source? What is the difference
   between absorbed and unabsorbed flux? Find out which of the columns
   in the table (listed above the fit statistic values) is absorbed.

#. What is the energy of the centroid of the line? Calculate the
   equivalent width of the line (by hand). (equivalent width is the
   ratio :math:`\frac{F_{\ell}}{F_c}`, where :math:`F_{\ell}` is the
   photon flux of the line in unit :math:`\mathrm{photons}`
   :math:`\mathrm{s}^{-1}` and
   :math:`F_c` is the flux per unit of energy of the continuum at the
   energy of the line in unit :math:`\mathrm{photons}` :math:`\mathrm{s}^{-1}`
   :math:`\mathrm{keV}^{-1}`)

#. Calculate the errors on all free parameters. What is the error in the
   equivalent width you calculated?

**Learning goals:**

After having done this spectrum, you should know:

-  How to make complex spectral models

-  How to freeze or thaw parameters (using :ref:`sec:par`)

-  How to obtain fluxes & luminosities

-  How to calculate the equivalent width of a line
