.. _sec:nonthermal:

Non-thermal electron distributions
==================================

.. highlight:: none

In the current version of SPEX it is possible to include the effects of
non-thermal (NT) electron distributions. Such NT distributions affect
the spectrum in two ways: by changing the ionization balance and the
emitted spectrum. Currently we take both effects into account for all
our plasma models. The only exception is the NEI model, for
non-equilibrium ionisation. The way we calculate the ionisation balance
does not allow us to include the NT effects in the ionisation balance,
but we do take it into account in the spectrum.

The way we implemented it is as follows. Our atomic data (like collision
strengths) are all parameterized in a way that allow for analytical
integration over simple electron distributions like delta-functions,
Maxwellians or power laws. But there are other processes like radiative
recombination where such an analytical approach fails. However, one way
or the other, we use expressions for Maxwellian-averaged rates in all
our calculations. In principle, it is possible to decompose any electron
distribution as a linear combination of Maxwellians. The total rate, for
example a recombination rate, is then the sum of the rates caused by the
individual Maxwellian components.

Therefore, in all our rate calcualtions we build the total rate based
upon such a linear combination of Maxwellians. This is done for all
relevant processes (ionization, recombination, excitation, etc.)

In all our thermal models, there is an ascii-parameter called “file”; if
this value is defined (i.e. when a file name of an existing file is
entered), it will read the parameters of the Maxwellians from an
ascii-file with that filename. If there is not such a file, or if the
filename is reset by entering the ``par file aval none`` command, no file
will be taken into account (i.e., we have a simple, single Maxwellian
again).

The (ascii) file should have the following format. On the first line,
the number of Maxwellians is given. Then for each Maxwellian there is a
separate line containing two numbers: the first number is the
temperature of the Maxwellian, in units of the main temperature of the
plasma; the second number is the total number of electrons in this
Maxwellian, relative to the main component. It is wise to have the
parameters of the main component as the first line of this list.

Let us give an example. Suppose we have a plasma with three components:
2, 20 and 200 keV Maxwellians, with electron densities of 3000, 300 and
30 :math:`\mathrm{m}^{-3}`, respectively. In this case the parameters of the
*cie* model should be: temperature 2 keV, electron density
3000 :math:`\mathrm{m}^{-3}`, and the corresponding file should be as follows::

    3
    1 1
    10 0.1
    100 0.01

The first line tells us that there are three Maxwellians. The second
line contains the parameters of the first Maxwellian, that we scale here
to 1 1 (it is the one with temperature 2 keV and electron density
3000 :math:`\mathrm{m}^{-3}`). The third lines contain the second Maxwellian,
which has a 10 times higher temperature but also a 10 times lower
electron density as the first component. Finally, the fourth line
contains the parameters of the third Maxwellian, which has a 100 times
higher temperature and a 100 times lower electron density as the first
component.
