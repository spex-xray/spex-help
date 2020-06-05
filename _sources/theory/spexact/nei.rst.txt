.. _sect:neijtheory:

Non-equilibrium ionisation (NEI) calculations
=============================================

Our current implementation of time-dependent, non-equilibrium ionisation
spectra is based upon the work of `Kaastra & Jansen (1993)
<https://ui.adsabs.harvard.edu/abs/1993A%26AS...97..873K/abstract>`_, KJ
hereafter. The method consists essentially upon calculating the
transition matrix (containing ionisation and recombination rates) for a
grid of temperatures, calculating the eigenvalues and eigenvectors of
these matrices and also the inverse eigenvector matrix, and storing
those on disk. The ionisation balance is calculated then by dividing the
temperature history in several steps, with the steps defined in such a
way that the temperature over each time interval is close to one
temperature grid point. Then for each step the time evolution of the
plasma is calculated using eigenvalue decomposition and using the
pre-calculated coefficients for the relevant temperature. For more
details see KJ.

Here we make a few changes with respect to KJ. First, KJ adopted a
prescribed history of the Hydrogen density, and calculate the
corresponding electron density at each time from the ion concentrations
at that time. This was motivated by the argument that for a fixed plasma
element the number of Hydrogen atoms remains constant over time, while
the number of electrons depends upon the degree of ionisation and may be
time-dependent, thus not known before the ionisation balance has beeen
solved completely. But the situation is slightly more complicated. If
the plasma is not (nearly) completely ionised, then for normal
abundances there must be a considerable population of neutral Hydrogen
or Helium. But in that case charge exchange reactions become important,
and should be taken into account in the transition matrix. This however
is impossible to incorporate in the KJ method, since in this case there
are 3 free parameters (:math:`n_{\mathrm e}/n_{\mathrm H}`, :math:`n_{\mathrm
e}/n_{\mathrm He}` and :math:`T`) instead of 1 (:math:`T`), and storage of
matrices etc. becomes physically impossible. Knowing that the method of
KJ becomes inaccurate for low ionisation rates we decided to leave the
prescribed :math:`n_{\mathrm H}` concept and return to the prescribed
:math:`n_{\mathrm e}` concept. This has the advantage that the equations for
the ionisation balance of each chemical element can be calculated
independently from the other elements; KJ need to calculate the
concentrations of all elements for each time step in order to determine
the conversion from Hydrogen to electron density.

Another rationale behind the above-mentioned modification is the
following. For self-similar supernova remnants, a class of problems
where non-equilibrium ionisation applies, the hydrodynamics is
inconsistent with a time- or place varying electron/Hydrogen ratio: that
would introduce another scale length and destroy the assumptions behind
self-similarity. Thus, for SNR models it is necessary to assume that the
plasma is (almost) completely ionised in order to assure
self-consistency. We will neglect small changes in the electron/Hydrogen
ratio of SNRs therefore.

The second modification concerns the temperature grid. Contrary to KJ,
we use a keV grid instead of a K grid. Further, since we now include 30
chemical elements instead of 15, we had to reduce the step size
:math:`h` of the grid from 0.05 in :math:`\log T` to 0.10, in order not
to get disk storage problems. This change however is compensated by a
better interpolation technique used here. KJ just rounded all
temperatures to the nearest grid point. Here we interpolate the
calculated concentrations between two temperature grid points linearly,
which is one order of magnitude (:math:`h`) better. A rough estimate
learns that the error in the method of KJ per decade is :math:`nh^2`
which gives for :math:`n=1/h` an error of order 0.05, while the current
implementation has typical errors per decade of :math:`nh^3` which gives
a typical error of 0.01 per decade.
