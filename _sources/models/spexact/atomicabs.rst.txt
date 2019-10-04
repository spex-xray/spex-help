.. _sect:abs_database:

Atomic database for the absorbers
=================================

The continuum opacities are taken from `Verner & Yakovlev
(1995) <https://ui.adsabs.harvard.edu/abs/1995A%26AS..109..125V/abstract>`__.
Line opacities and wavelengths for most ions are from
`Verner et al. (1996) <https://ui.adsabs.harvard.edu/abs/1996ADNDT..64....1V/abstract>`__,
with the following additions and exceptions:

.. _sect:k-shell:

K-shell transitions
-------------------

For some hydrogenic ions (C, N, O, Ne, Mg, Si, S and Ar) we added the
transitions from principal quantum numbers 11–20 to the ground using our
own SPEX database.

C-K transitions
~~~~~~~~~~~~~~~

Three inner-shell K-shell transitions for C I were calculated by Raassen
using the Cowan code, but here only the oscillator strengths were
calculated, and therefore calculated equivalent widths for large optical
depths will be too weak. We added two C IV lines from the work of
`Nahar et al. (2001) <https://ui.adsabs.harvard.edu/abs/2001PhRvA..63f0701N/abstract>`_.

N-K transitions
~~~~~~~~~~~~~~~

For N I the K-shell transitions were calculated by Raassen using the Cowan
code. We adjusted the wavelength of the strongest 1s–2p line acording to
measurements. However, for the 1s–2p lines towards
:math:`1s 2s^2 2p^4` :math:`^4 P`, we used oscilator
strengths and Auger widths from `Garcia et al. (2009)
<https://ui.adsabs.harvard.edu/abs/2009ApJS..185..477G/abstract>`_.

Inner-shell K-shell transitions for N II were also calculated by Raassen
using the Cowan code, but here only the oscillator strengths were
calculated, and therefore calculated equivalent widths for large optical
depths will be too weak. The exception to this are the 1s–2p absorption
lines to the :math:`1s 2s^2 2p^3` :math:`^3 S_1`,
:math:`^3 P_1` and :math:`^3 D_1` levels, for
which we use `Garcia et al. (2009)
<https://ui.adsabs.harvard.edu/abs/2009ApJS..185..477G/abstract>`_.

For N III we added the 1s–2p absorption lines towards the
:math:`1s 2s^2 2p^2` :math:`^2 S`, :math:`^2 P` and :math:`^2 D_{3/2}`
levels from the paper by `Garcia et al. (2009)
<https://ui.adsabs.harvard.edu/abs/2009ApJS..185..477G/abstract>`_.
Wavelengths are theoretical, so may be somewhat off.

For N IV we added the 1s–2p absorption lines towards the :math:`1s 2s^2 2p` :math:`^1P_1`
and :math:`1s 2p^3` :math:`^1 P_1` levels from the paper by `Garcia et al. (2009)
<https://ui.adsabs.harvard.edu/abs/2009ApJS..185..477G/abstract>`_.
Wavelengths are theoretical, so may be somewhat off.

For N V we added the 1s–2p absorption lines towards the
:math:`1s(2S)2s2p(3P)` :math:`^2 P` doublet and
:math:`1s(2S)2s2p(1P)` :math:`^2 P` doublet from the paper by
`Garcia et al. (2009)
<https://ui.adsabs.harvard.edu/abs/2009ApJS..185..477G/abstract>`_.
Wavelengths were corrected according to
the measurements of `Beiersdorfer et al.
(1999) <https://ui.adsabs.harvard.edu/abs/1999RScI...70..276B/abstract>`_.

For N VI we added the 1s–np lines for :math:`n=5-7` from our SPEX database.

O-K transitions
~~~~~~~~~~~~~~~

We included the inner shell K-shell transitions of oxygen ions (O I – O VI)
from earlier work of Behar (HULLAC calculations, private commumication).

We adjusted the wavelength of the strongest line to :math:`22.370\pm0.010` Å,
taken from `Gu et al. (2005)
<https://ui.adsabs.harvard.edu/abs/2005ApJ...627.1066G/abstract>`_.

The two 1s–2p :math:`^2 P_{1/2,3/2}` lines of O IV were adjusted
to 22.741 and 22.739 Å, respectively following `Gu et al. (2005)
<https://ui.adsabs.harvard.edu/abs/2005ApJ...627.1066G/abstract>`_.
The lines to the :math:`^2 D_{3/2}` and :math:`^2 S_{1/2}` terms
were not adjusted as no values are given by `Gu et al. (2005)
<https://ui.adsabs.harvard.edu/abs/2005ApJ...627.1066G/abstract>`_.

For O III, `Gu et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005ApJ...627.1066G/abstract>`_
give only a single line instead of the three dominant lines to
:math:`^3 D_1`, :math:`^3 S_1`, :math:`^3 P_1`. The
oscillator-strength weighted average wavelength for these three lines
using Behar’s HULLAC calculations is 23.058 Å, compared to 23.065 Å as
given by `Gu et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005ApJ...627.1066G/abstract>`_.
Other sets of calculation differ much from this, up to 0.05–0.10 Å 
`Olalla et al., 2002 <https://ui.adsabs.harvard.edu/abs/2002MNRAS.332.1005O/abstract>`_;
`Pradhan et al., 2003 <https://ui.adsabs.harvard.edu/abs/2003MNRAS.341.1268P/abstract>`_;
`Juett et al., 2004 <https://ui.adsabs.harvard.edu/abs/2004ApJ...612..308J/abstract>`_;
so we keep the Behar values lacking more reliable calculations.

For O II, `Juett et al. (2004)
<https://ui.adsabs.harvard.edu/abs/2004ApJ...612..308J/abstract>`_
identified a feature in observed
Chandra HETGS spectra towards several sources with the 1s–2p line from
this ion; their measured wavelength is 23.351 :math:`\pm` 0.003 Å.
This identification seems to be justified given the Auger electron
measurements of `Krause (1994) <https://ui.adsabs.harvard.edu/abs/1994NIMPB..87..178K/abstract>`_
and `Caldwell et al. (1994) <https://doi.org/10.1016/0368-2048(93)02055-Q>`_
as cited by `Garcia et al. (2005) <https://ui.adsabs.harvard.edu/abs/2005ApJS..158...68G/abstract>`_.
The relevant transitions are from the
ground :math:`^4 S_{3/2}` to the :math:`^4 P_{5/2}`, :math:`^4 P_{3/2}`, and
:math:`^4 P_{1/2}` levels; the oscillator strength weighted
wavelength from Behar is 23.3012 Å. Therefore we shift the wavelengths
of these transitions by :math:`+0.0498` Å in order to match the `Juett et al. (2004)
<https://ui.adsabs.harvard.edu/abs/2004ApJ...612..308J/abstract>`_ value.

Finally, in a similar way we shift the strong 1s–2p doublet from to
match the weighted average of the value found by `Juett et al. (2004)
<https://ui.adsabs.harvard.edu/abs/2004ApJ...612..308J/abstract>`_
with the Chandra HETGS (23.508 :math:`\pm` 0.003 Å) and in Mrk 421 with RGS
(23.5130 :math:`\pm` 0.0022 Å) to (23.5113 :math:`\pm` 0.0018 Å). For
all O I lines, we have updated the oscillator strengths and transition rates
to values obtained by Ton Raassen using Cowan’s code, and benchmarked to
an adjusted wavelength scale.

Lines from O VII up to :math:`n=100` were calculated by extrapolation of the
data for :math:`n \le 10`.

Ne-K to Ca-K transitions
~~~~~~~~~~~~~~~~~~~~~~~~

The strongest K-shell transitions from Li-like to F-like ions of Ne, Mg,
Al, Si, S, Ar, and Ca were taken from `Behar & Netzer (2002)
<https://ui.adsabs.harvard.edu/abs/2002ApJ...570..165B/abstract>`_.

Fe-K transitions
~~~~~~~~~~~~~~~~

K-shell transitions in Fe II – Fe XXIV were included from the series of papers by
`Palmeri et al. (2003) <https://ui.adsabs.harvard.edu/abs/2003A%26A...410..359P/abstract>`_,
`Mendoza et al. (2004) <https://ui.adsabs.harvard.edu/abs/2004A%26A...414..377M/abstract>`_,
and `Bautista et al. (2004) <https://ui.adsabs.harvard.edu/abs/2004A%26A...418.1171B/abstract>`_.

In addition, the strongest 1s–3p transitions in Fe XXIII were added from
`Behar & Netzer (2002) <https://ui.adsabs.harvard.edu/abs/2002ApJ...570..165B/abstract>`_.

.. _sect:l-shell:

L-shell transitions
-------------------

Fe-L transitions
~~~~~~~~~~~~~~~~

For the L-shell ions of iron (Fe XVII - Fe XXIV) we used HULLAC calculations.
The wavelengths of these L-shell transitions were adjusted according to
`Phillips et al. (1999)
<https://ui.adsabs.harvard.edu/abs/1999A%26AS..138..381P/abstract>`_.
Also the L-shell ions of Si VIII – Si XII, S X – S XIV and Ar XV
were calculated using the HULLAC code. In addition, we added the 2p–3d
inner shell resonance lines of Fe I - Fe XVI from `Behar et al. (2001)
<https://ui.adsabs.harvard.edu/abs/2001ApJ...563..497B/abstract>`_.
These inner shell resonance lines occur
mainly in the 16 - 17 Å band and appear to be extremely
important diagnostic tools, since the normal resonance lines of these
lowly ionized iron ions have their wavelengths mainly in the
inaccessible EUV band.

Ni-L transitions
~~~~~~~~~~~~~~~~

L-shell transitions of Ni I – Ni XVIII were calculated by Raassen using Cowan’s code,
with the neglect of line broadening due to auto-ionizations.

.. _sect:m-shell:

M-shell transitions
-------------------

For M-shell transitions of Fe ions, we have used data calculated by Ehud
Behar using HULLAC (Fe I – Fe XVI). The calculations for (Fe VI – Fe XVI)
were replaced on November 21, 2008 by updated calculations by Ming Feng Gu
using FAC and compared with the NGC 3783 spectrum in `Gu et al. (2006)
<https://ui.adsabs.harvard.edu/abs/2006ApJ...641.1227G/abstract>`_. They
represent slight ( ~ 0.03 Angstrom) shifts from Behar’s initial
calculations. Also, they exhibit typically 2–3 times higher total
transition rates (Auger rates).
