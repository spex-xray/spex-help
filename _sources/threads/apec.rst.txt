.. _sec:apec:

SPEX evaluation of APEC model
=============================

.. highlight:: none

*By: Liyi Gu*

It is possible to calculate APEC without calling XSPEC.
This could be done with the through atbl (:ref:`sect:atbl`).
This would allow user to compare APEC and CIE (:ref:`sect:cie`) 
without switching softwares.

Download APEC files
-------------------

The APEC package containing the continuum coco file and the
line file are available at 
`AtomDB <http://www.atomdb.org/download.php>`_.

Atbl for APEC
-------------

The APEC files can be evaluated through::

  SPEX> com atbl
  SPEX> par 1 1 file av /directory/to/apec/apec_v3.1.3_coco.fits
  SPEX> calc
  SPEX> com atbl
  SPEX> par 1 2 file av /directory/to/apec/apec_v3.1.3_line.fits
  SPEX> calc
  SPEX> par 1 2 norm:vrms cou 1 1 norm:vrms

Essentially, two atbl components are defined: one for the APEC continuum
and one for the emission lines. In this example, all parameters of the
continuum and line components are coupled; however, they can also be
calculated separately if needed.

The SPEX evaluation of APEC may differ slightly from the XSPEC implementation
due to differences in the interpolation algorithms. In addition, the
normalization follows the SPEX convention. This means that a SPEX/APEC model,
at its default distance and with a normalization of :math:`4\pi`, corresponds
to an XSPEC/APEC model evaluated at zero redshift.

It is possible to set the abundance standard using the ``abund``
(:ref:`sec:abundance`) command.

.. note:: The current atbl cannot be used to read the APEC-NEI fits table.

*Recommended citation:* `Smith et al. (2001)
<https://ui.adsabs.harvard.edu/abs/2001ApJ...556L..91S/abstract>`_
and
`Foster et al. (2012)
<https://ui.adsabs.harvard.edu/abs/2012ApJ...756..128F/abstract>`_
