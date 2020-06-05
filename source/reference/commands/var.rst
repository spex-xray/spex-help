.. _sec:var:

Var: various settings for the plasma models
===========================================

Overview
--------

For the plasma models, there are several quantities that have useful
default values but can be adjusted manually for specific purposes. We
list them below.

Free-bound emission
~~~~~~~~~~~~~~~~~~~

Usually the freebound emission takes most of the computing time for the
plasma models. This is because it needs to be evaluated for all
energies, ions and atomic sublevels that are relevant. In order to reduce
the computational burden, there is a parameter gfbacc in SPEX that is
approximately the accuracy level for the free-bound calculation. The
default value is :math:`10^{-3}`. If this quantity is higher, less
shells are taken into account and the computation proceeds faster (but
less accurate). The users are advised not to change this parameter
unless they are knowing what they do!

Line emission contributions
~~~~~~~~~~~~~~~~~~~~~~~~~~~

By default, all possible line emission processes are taken into account
in the plasma models. For testing purposes, it is possible to include or
exclude specific contributions. These are listed below in
the table below.

.. table:: Possible line emission processes

   =========== =====================================
   Abbrevation Process
   =========== =====================================
   ex          electron excitation
   rr          radiative recombination
   dr          dielectronic recombination
   ds          dielectronic recombination satellites
   ii          inner shell ionisation
   =========== =====================================

Doppler broadening
~~~~~~~~~~~~~~~~~~

By default, thermal Doppler broadening is taken into account. However,
the user can put this off for testing purposes. The options for the
broadening are:

#. No broadening at all

#. Only Doppler broadening (default)

#. Only natural broadening (works only for *var calc new*)

#. Doppler and natural broadening, Voigt profiles (best physical
   representation, works only for *var calc new*)

Atomic data
~~~~~~~~~~~

The user can choose between the "old" Mekal code (the current default,
also referred to as SPEXACT v2) and updated calculations with the
command ``var calc new`` (referred to as SPEXACT v3).

Calculation level occupations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the new line calculations, the occupation of the different atomic
energy levels is determined self-consistently. Consider an ion for which
we want to determine these occupations. If the occupation of the
different levels of all neighbouring ions is known, then given our
atomic database we know all the rates we need to calculate in one step
the level occupations of our ion. However, our initial guess of the
occupation of the neighbours may have been not correct, therefore the
rates are not correct, and we need to iterate a few times before all
ions of an element are converged. This usually takes between 2 and about
25 iterations, depending on the precise physical conditions.

As starting values we assume that all ions are in the ground state, and
then we iterate (this is the default mode). By setting ``var occstart
boltzmann``, we can change this to an initial Boltzmann distribution for
the occupation. This may be more appropriate for very high density
plasmas. To reduce the number of iterations, one may also start with
``var occstart last``, in which case the results from the last calculation
are used as starting values. This can be useful for spectral fitting
and/or error searches, where for each call the parameters of the model
are close to those for the previous call.

.. Warning:: The ``var occstart last`` option will have limited advantage
   if the model during a fit is far off from the final values (large
   parameter changes during fitting), or with multiple components (in which
   case the last parameters stored in the newlin subroutine may be
   associated to a different spectral component compared to the one
   studied).

Mekal code
~~~~~~~~~~

Over the years, we have made several minor improvements to the original Mekal plasma
model. These improvements are included by default. However, it is
possible to discard some of these improvements by going back to the old
code. The improvements are classified as follows (with the appropriate
syntax word added here).

``Wav:`` wavelength corrections according to the work of
`Phillips et al. (1999) <https://ui.adsabs.harvard.edu/abs/1999A%26AS..138..381P/abstract>`_,
based upon Solar flare spectra; in addition, the 1s-np wavelengths of
Ni XXVII and Ni XXVIII have been improved.

``Fe17:`` The strongest Fe XVII lines are corrected in order to agree with
the rates as calculated by `Doron & Behar (2002)
<https://ui.adsabs.harvard.edu/abs/2002ApJ...574..518D/abstract>`_.

``Update:`` several minor corrections: the Si IX C7 line has been deleted;
the Si VIII N6 line now only has the 319.83 Å line strength instead of
the total triplet strength; the Ni XVIII and Fe XVI Na1A and NA1B lines
plus their satellites have been deleted.

Cooling by collisional excitation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the oldest version of the *pion* model, for the cooling by
collisional excitation the Mekal code was used, with all processes
except for collisonal excitation on. This has now improved by using a
mixture of more modern data for collisional excitation taken from our
new SPEX calculations, or for ions for which no new data are yet
available, from the Chianti database, and in a few rare cases we still
use the old Mekal data (4 ions only). For a full description see
Stofanova et al. (2020, subm.). This new calculation is now the
default, but the user can switch between both by selecting the ``var
newcoolexc #l`` option.

Cooling by dielectronic recombination
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

In the oldest version of the *pion* model, cooling by di-electronic
recombination was not included. This has now been corrected. Wherever
available, cooling rates are calculated directly from the di-electronic
recombination model from the latest model, for those ions for which
Auger rates and associated energies are available. For all other ions,
we use the old calculations from the Mekal code (with only the *dr* and
*ds* flags turned on).

The user has the option, however, to use only Mekal data (for
comparison) by setting the command ``var newcooldr false``.

Syntax
------

The following syntax rules apply:

| ``var gacc #r`` : Set the accuracy gfbacc for free-bound emission.
  Default is :math:`10^{-3}`, maximum value 1 and minimum value 0. Do
  not change if you do not know what it does.
| ``var gacc reset`` : Reset gfbacc to its default value.
| ``var line #a #l`` : For process #a (where #a is one of the
  abbreviations in `the Table above <#tab:linproc>`__) the process
  is allowed (if #l is true) or disabled (if #l is false). By default,
  all processes are allowed.
| ``var line reset`` : Enable all line emission processes
| ``var line show`` : Show the status of the line emission processses
| ``var doppler #i`` : Line broadening, see the four allowed values in
  the above description
| ``var calc old`` : Use the old Mekal code
| ``var calc new`` : Use the new updated atomic data (for SPEX version
  3.0 and higher)
| ``var occstart ground`` : Start new line calculation iteration with
  initial guess that all ions are in the ground state. This is the
  default
| ``var occstart boltzmann`` : Start new line calculation iteration with
  initial guess that all levels have a Boltzmann distribution.
| ``var occstart boltzmann`` : Start new line calculation iteration with
  initial guess that all levels have same occupation as in last call to
  this routine.
| ``var newmekal wav #l`` : if true (the default), use the updated
  wavelengths for the Mekal code
| ``var newmekal fe17 #l`` : if true (the default), use the updated Fe
  XVII calculations for the Mekal code
| ``var newmekal update #l`` : if true (the default), use the updates
  for some lines for the Mekal code
| ``var newmekal all #l`` : if true (default), use all the above three
  corrections for the Mekal code
| ``var ibalmaxw #l`` : if true use multi-Maxwellians (if relevant) for
  both the ionisation balance and the spectrum (default); if false, only
  use it for the spectrum.
| ``var newcoolexc #l`` : if true (default), use the latest cooling by
  collisional excitation calculations
| ``var newcooldr #l`` : if true (default), use the latest cooling by
  dielectronic recombination calculations

Examples
--------

| ``var gacc 0.01`` : Set the accuracy gfbacc for free-bound emission.to
  0.01
| ``var gacc reset`` : Reset the accuracy gfbacc for free-bound
  emission.to its default value of 0.001
| ``var line ex f`` : Exclude electron excitation
| ``var line ds t`` : Include dielectronic satellites
| ``var line reset`` : Include all line emission processes
| ``var line show`` : Show status of all line emission proceses
| ``var doppler f`` : Do not use thermal Doppler bvroadening
| ``var calc new`` : Use the new atomic data (EXPERIMENTAL)
| ``var calc boltzmann`` : Start level occupation calculations with
  Boltzmann distribution
| ``var newmekal wav f`` : Use the original Mekal wavelengths instead
| ``var newmekal fe17 t`` : Use the updated Fe XVII calculations
| ``var newmekal all f`` : Go back to the full old Mekal code
| ``var newmekal all t`` : Take the full updated Mekal code
| ``var ibalmaxw f`` : Do not use Multi-Maxwellians for the ionisation
  balance
| ``var newcoolexc f`` : Change to the old collisional excitation
  cooling calculations
| ``var newcooldr f`` : Change to the old dielectronic recombination
  cooling calculations
