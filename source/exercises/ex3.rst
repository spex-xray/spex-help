Statistics, binning and more
============================

The files ``nustar.spo`` and ``nustar.res`` contains the observed (not
simulated!) spectrum of the pulsar PSR J1813-1246 as observed by the
NuSTAR satellite. You can adopt a distance of 2.5 kpc to this source.
You can assume that the spectrum is a simple power law with Galactic
foreground absorption.

#. Load the spectrum into SPEX, and rebin the spectrum properly. No need
   to ignore any data here.

#. Define the proper model and make a fit.

#. We will make a few alternative fits. Make a table and note down the
   following numbers for each fit starting with your current one: the
   best-fit parameters and their error bars of the three free parameters
   of your model; the correlation between these parameters; and the fit
   statistic with its expected values; your current fit is model A.

   =================================== =======  ======= ======= =======
   Parameter                           Model A  Model B Model C Model D
   =================================== =======  ======= ======= =======
   Norm                                 
   :math:`\Gamma`                       
   Luminosity                           
   corr norm-\ :math:`\Gamma`           
   corr norm-\ :math:`n_{\mathrm H}`
   corr :math:`n_{\mathrm H} - \Gamma`
   C-stat or :math:`\chi^2`             
   Exp. C-stat or dof                   
   =================================== =======  ======= ======= =======

#. Same as before, but now use the 3-80 keV luminosity as free parameter
   instead of the norm (change "type" for the power law model and the
   status of some parameters). This is model B.

#. As above, but now instead the 3-20 keV luminosity (model C).

#. As above, but now change the fit statistic from C-stat to
   :math:`\chi^2` (model D). Be shocked by the bias in fit parameters
   that you will see!

**Learning goals:**

After having done this spectrum, you should know:

-  How to change from normalisation ot luminosity.

-  See the importance of "pivot" point for the luminosity /
   normalisation.

-  Understand the danger of using :math:`\chi^2`-fitting.
