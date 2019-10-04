The SPEX Atomic Code & Tables (SPEXACT)
=======================================

The SPEX package is a spectral fitting program with integrated models
that are mostly based on one atomic database and a set of routines to
calculate all the atomic processes in the plasma. Although the
development of the atomic database and code is performed mostly in
parallel with the other SPEX development, it can sometimes be confusing
which version of the atomic database was actually used in an analysis.
Especially after the major update of the atomic database in SPEX 3.0 and
the option to calculate models using the ’old’ database and routines
from SPEX 2.0, there is a need to name and version the ’core’ routines
of SPEX separately. This has become SPEXACT (SPEX Atomic Code & Tables).
In principle, models calculated using the same SPEXACT version should
produce the same results.

Please note that the SPEXACT database and routines are an integrated
part of SPEX and are not distributed separately.

Main version number definition
------------------------------

**SPEXACT v1:** Is essentially the MEKAL model that was developed in the
1980’s and is distributed with Xspec. This model is no longer developed
or supported, but can be regarded as the first version of SPEXACT. It is
no longer included in SPEX.

**SPEXACT v2:** In SPEX version 1 & 2, the original MEKAL model was
extended and updated into SPEX. The version number of this SPEXACT
version is the same as the version number of SPEX when it was released.
For example, the SPEXACT version in SPEX version 2.04.00 is also
2.04.00. In SPEX version 3, these routines are still the default and are
used in ``var calc old`` mode.

**SPEXACT v3:** These are the newly developed atomic database and
corresponding routines that were officially released with SPEX version
3.00.00. This database and its routines are not (yet) the default in
SPEX, but can be used when the ``var calc new`` command is given. The
second number in the SPEXACT version is the same as the SPEX version it
was released in. The third number can in principle be different from the
SPEX version and indicates the minor version of the database.