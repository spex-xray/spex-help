Relativistic lines
==================

The file :download:`agnrel.spo </_static/exercises/agnrel.spo>` contains
a spectrum of an AGN at 1 Mpc distance. The response matrix to be used
is :download:`corona.res </_static/exercises/corona.res>`. The two features that are
visible in the spectrum are the O VIII L\ :math:`\alpha`
(:math:`\lambda=18.969` Å)and N VII L\ :math:`\alpha`
(:math:`\lambda=24.781` Å) lines. Because the emission from the disk is
influenced by general relativistic effects, the lines appear to be broad
and asymmetric. In SPEX we can model these lines by convolving a delta
line with a so-called Laor profile (``com laor``) and learn a lot about
the geometry of the system.

In this exercise we fix the :math:`\mathrm{N}_{\mathrm{H}}` to
:math:`1 \times 10^{20} \ \mathrm{cm}^{-2}`. The continuum emission can be well
described with a powerlaw. The response file is :download:`corona.res
</_static/exercises/corona.res>`.

#. First start with the most simple model components: ``pow`` and
   Galactic foreground absorption. Plot the data. Hint: it may be useful
   to plot the flux as counts/:math:`\mathrm{m}^2`/s/Å versus wavelength in Å.
   Try first to get a reasonable model spectrum for the continuum. You
   may do this by ignoring the part of the spectrum where you see lines.

#. Set up next the full model by adding lines with ``delt`` and
   relativistic broadening by ``laor``. Do not forget to use all data
   again, and it may be wise at this stage to freeze the parameters for
   the continuum (but do not forget to thaw them for your final fits).

#. Fit the spectrum. Hint: do not thaw all parameters at the same time,
   but step by step.

   In the ``laor`` component you can free the parameters ``r1``, ``r2``,
   ``q`` and ``i``. You can find the line energies of the oxygen and
   nitrogen lines also in the SPEX line list. Is the fit acceptable?
   Look at the residuals of the fit and check wether the lines are well
   fitted. If not, try to find out which parameter of the ``laor``
   component should be altered.

#. The inner radius of the disk ``r1`` tells you immediately the spin of
   the black hole. A non-spinning black hole has :math:`r_1=6`, a
   maximally spinning black hole has :math:`r_1\rightarrow 1`. What can
   you tell about the spin of the black hole?

#. Vary the parameters ``r1``, ``r2``, ``q`` and ``i`` to see how they
   influence the line profile (give them manually a different value and
   issue the "calc" command followed by the "plot" command).

**Learning goals:**

After having done this spectrum, you should know:

-  How to create a complex model with relativistic emission lines.

-  The usefullness of freezing parameters or omitting initially parts of
   the spectrum to get a first-step estimate of the spectrum.

-  How X-ray spectra tell you something about spinning black holes.
