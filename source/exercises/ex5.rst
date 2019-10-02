Supernova remnants
==================

Up to now we have only fitted an object which was in collisional
ionization equilibrium (CIE), but when there are plasma shocks in a (low
density) medium, equilibrium might not be reached yet. This is often the
case in supernova remnants. We will illustrate this with the following
spectrum: ``nei.spo``. Again the response is the same as ``corona.res``.
Adopt a source distance of 3 kpc, and fix the Galactic foreground
absorption to :math:`5 \times 10^{24}  \mathrm{m}^{-2}`. Define your spectral model.

#. Fit the spectrum with a CIE model. Is the fit acceptable?

#. With the parameter ``rt``, which is the ratio between the temperature
   in ionization balance and spectral temperature, we can obtain a
   better fit. Set the parameter to thawn, but be aware that this ratio
   is not allowed to get too close to 0! Is the fit acceptable?

#. In SPEX there is also a component which can fit a non-equilibrium
   spectrum called ``neij``. The most important parameter is :math:`U`.
   It is defined as follows: :math:`U = \int_{t_0}^{t_n} n_e dt`. When
   :math:`U` is big, it means the ionization is in equilibrium. Fit the
   spectrum with ``neij``. What is the temperature after the shock?

#. Now vary the pre-shock temperature. Does that make any difference?

#. In order to see the effect of Non-Equilibrium Ionisation (NEI), make
   the parameter "U" of the ``neij`` model 10 times smaller and 10 times
   larger than your best-fit value (leave all other parameters the
   same!), calculate the spectrum using the "calc" command (no fitting
   here!) and plot the spectrum. You will see large differences.

**Learning goals:**

After having done this spectrum, you should know:

-  How to check your data for Non-Equilibrium Ionisation (NEI) effects
   by using the parameter RT.

-  How to use proper NEI models and get a basic understanding of these
   spectra.
