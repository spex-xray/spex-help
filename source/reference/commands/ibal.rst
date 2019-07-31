.. _sec:ibal:

Ibal: set type of ionisation balance
====================================

Overview
~~~~~~~~

For the plasma models, different ionisation balance calculations are
possible.

Currently, the default set is :raw-latex:`\citet{arnaud1985}` for H, He,
C, N, O, Ne, Na, Mg, Al, Si, S, Ar, Ca and Ni, with
:raw-latex:`\citet{arnaud1992}`) for Fe.
Table \ `[tab:ibal] <#tab:ibal>`__ lists the possible options.

.. table:: Ionisation balance modes

   =========== ======================================================
   Abbrevation Reference
   =========== ======================================================
   reset       default (=u17)
   ar85        :raw-latex:`\citet{arnaud1985}`
   ar92        :raw-latex:`\citet{arnaud1992}` for Fe,
   \           :raw-latex:`\citet{arnaud1985}` for the other elements
   bryans09    :raw-latex:`\citet{bryans2009}`
   u17         :raw-latex:`\citet{urdampilleta2017}` (default)
   \          
   =========== ======================================================

Syntax
~~~~~~

The following syntax rules apply:

| ``ibal #a`` : Set the ionisation balance to set #a with #a in the
  table above.
| ``ibal show`` : Show the currently active ionisation balance.

Examples
~~~~~~~~

| ``ibal reset`` : Take the standard ionisation balance
| ``ibal ar85`` : Take the Arnaud & Rothenflug ionisation balance
