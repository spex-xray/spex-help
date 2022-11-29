.. _sec:abundance:

Abundance: standard abundances
==============================

Overview
~~~~~~~~

For the plasma models, a default set of abundances is used. All
abundances are calculated relative to those standard values. The current
default abundance set are the proto-Solar abundances of
`Lodders et al. (2009) <https://ui.adsabs.harvard.edu/abs/2009LanB...4B..712L/abstract>`_.
Note that in older versions of SPEX, `Anders & Grevesse (1989)
<https://ui.adsabs.harvard.edu/abs/1989GeCoA..53..197A/abstract>`_
was the default. In particular, we recommend to use the proto-Solar
(= Solar system) abundances for most applications, as the Solar
photospheric abundance has been affected by nucleosynthesis (burning
of H to He) and settlement in the Sun during its lifetime.
The following abundances (`see the Table below <#tab:standabu>`__)
can be used in SPEX:

.. table:: Standard abundance sets

   =========== ============================================================
   Abbrevation Reference
   =========== ============================================================
   reset       default `Lodders et al. (2009) <https://ui.adsabs.harvard.edu/abs/2009LanB...4B..712L/abstract>`_
   ag          `Anders & Grevesse (1989) <https://ui.adsabs.harvard.edu/abs/1989GeCoA..53..197A/abstract>`_
   allen       `Allen (1973) <https://ui.adsabs.harvard.edu/abs/1973asqu.book.....A/abstract>`_
   ra          `Ross & Aller (1976) <https://ui.adsabs.harvard.edu/abs/1976Sci...191.1223R/abstract>`_
   grevesse    `Grevesse et al. (1992) <https://ui.adsabs.harvard.edu/abs/1992ESASP.348..305G/abstract>`_
   gs          `Grevesse & Sauval (1998) <https://ui.adsabs.harvard.edu/abs/1998SSRv...85..161G/abstract>`_
   lodders     Lodders proto-Solar `Lodders <https://ui.adsabs.harvard.edu/abs/2003ApJ...591.1220L/abstract>`_
   solar       Lodders Solar photospheric `Lodders <https://ui.adsabs.harvard.edu/abs/2003ApJ...591.1220L/abstract>`_
   =========== ============================================================

For the case of `Grevesse & Sauval (1998)
<https://ui.adsabs.harvard.edu/abs/1998SSRv...85..161G/abstract>`_
we adopted their meteoritic values (in general more accurate than the
photospheric values, but in most cases consistent), except for He
(slightly enhanced in the solar photosphere due to element migration
at the bottom of the convection zone), C, N and O (largely escaped
from meteorites) Ne and Ar (noble gases).

In the table below, we show the values of the
standard abundances. They are expressed in logarithmic units, with
hydrogen by definition 12.0.

.. table:: Abundances for the standard sets

   == ==== ======= ===== ============== ===== ======== ===== ======= =====
   Z  elem Default AG    Allen          RA    Grevesse GS    Lodders solar
   == ==== ======= ===== ============== ===== ======== ===== ======= =====
   1  H    12.000  12.00 12.00          12.00 12.00    12.00 12.00   12.00
   2  He   10.987  10.99 10.93          10.80 10.97    10.99 10.98   10.90
   3  Li   3.331   1.16  0.70           1.00  1.16     3.31  3.35    3.28
   4  Be   1.373   1.15  1.10           1.15  1.15     1.42  1.48    1.41
   5  B    2.860   2.6   <3.0           2.11  2.6      2.79  2.85    2.78
   6  C    8.443   8.56  8.52           8.62  8.55     8.52  8.46    8.39
   7  N    7.912   8.05  7.96           7.94  7.97     7.92  7.90    7.83
   8  O    8.782   8.93  8.82           8.84  8.87     8.83  8.76    8.69
   9  F    4.491   4.56  4.60           4.56  4.56     4.48  4.53    4.46
   10 Ne   8.103   8.09  7.92           7.47  8.08     8.08  7.95    7.87
   11 Na   6.347   6.33  6.25           6.28  6.33     6.32  6.37    6.30
   12 Mg   7.599   7.58  7.42           7.59  7.58     7.58  7.62    7.55
   13 Al   6.513   6.47  6.39           6.52  6.47     6.49  6.54    6.46
   14 Si   7.586   7.55  7.52           7.65  7.55     7.56  7.61    7.54
   15 P    5.505   5.45  5.52           5.50  5.45     5.56  5.54    5.46
   16 S    7.210   7.21  7.20           7.20  7.21     7.20  7.26    7.19
   17 Cl   5.299   5.5   5.60           5.50  5.5      5.28  5.33    5.26
   18 Ar   6.553   6.56  6.90           6.01  6.52     6.40  6.62    6.55
   19 K    5.161   5.12  4.95           5.16  5.12     5.13  5.18    5.11
   20 Ca   6.367   6.36  6.30           6.35  6.36     6.35  6.41    6.34
   21 Sc   3.123   1.10  1.22           1.04  3.20     3.10  3.15    3.07
   22 Ti   4.979   4.99  5.13           5.05  5.02     4.94  5.00    4.92
   23 V    4.042   4.00  4.40           4.02  4.00     4.02  4.07    4.00
   24 Cr   5.703   5.67  5.85           5.71  5.67     5.69  5.72    5.65
   25 Mn   5.551   5.39  5.40           5.42  5.39     5.53  5.58    5.50
   26 Fe   7.514   7.67  7.60           7.50  7.51     7.50  7.54    7.47
   27 Co   4.957   4.92  5.10           4.90  4.92     4.91  4.98    4.91
   28 Ni   6.276   6.25  6.30           6.28  6.25     6.25  6.29    6.22
   29 Cu   4.319   4.21  4.50           4.06  4.21     4.29  4.34    4.26
   30 Zn   4.700   4.60  4.20           4.45  4.60     4.67  4.70    4.63
   == ==== ======= ===== ============== ===== ======== ===== ======= =====

.. warning:: For `Allen (1973) <https://ui.adsabs.harvard.edu/abs/1973asqu.book.....A/abstract>`_
             the value for boron is just an upper limit.

The current active solar abundance table can be shown using the command
``abundance show``.

Syntax
~~~~~~

The following syntax rules apply:

| ``abundance #a`` : Set the standard abundances to the values of
  reference #a in the table above.
| ``abundance show`` : Show the currently active abundance table.

Examples
~~~~~~~~

| ``abundance gs`` : change the standard abundances to the set of
  `Grevesse & Sauval (1998) <https://ui.adsabs.harvard.edu/abs/1998SSRv...85..161G/abstract>`_
| ``abundance reset`` : reset the abundances to the standard set
| ``abundance show`` : show the currently active abundance table
