.. _sec:ibal:

Ibal: set type of ionisation balance
====================================

Overview
~~~~~~~~

For the plasma models, different ionisation balance calculations are
possible.

Currently, the default set is `Urdampilleta et al. (2017) <https://ui.adsabs.harvard.edu/abs/2017A%26A...601A..85U/abstract>`_
The Table \ `Ionisation balance models <#tab:ibal>`__ lists the possible options.

.. table:: Ionisation balance modes

   =========== ==========================================================================================
   Abbrevation Reference
   =========== ==========================================================================================
   reset       default (=u17)
   ar85        `Arnaud & Rothenflug (1985) <https://ui.adsabs.harvard.edu/abs/1985A%26AS...60..425A/abstract>`_
   ar92        `Arnaud & Raymond (1992) <https://ui.adsabs.harvard.edu/abs/1992ApJ...398..394A/abstract>`_ for Fe,
   \           `Arnaud & Rothenflug (1985) <https://ui.adsabs.harvard.edu/abs/1985A%26AS...60..425A/abstract>`_ for the other elements
   bryans09    `Bryans et al. (2009) <https://ui.adsabs.harvard.edu/abs/2009ApJ...691.1540B/abstract>`_
   u17         `Urdampilleta et al. (2017) <https://ui.adsabs.harvard.edu/abs/2017A%26A...601A..85U/abstract>`_ (default)
   =========== ==========================================================================================

Syntax
~~~~~~

The following syntax rules apply:

| ``ibal #a`` : Set the ionisation balance to set #a with #a in the table above.
| ``ibal show`` : Show the currently active ionisation balance.

Examples
~~~~~~~~

| ``ibal reset`` : Take the standard ionisation balance
| ``ibal ar85`` : Take the Arnaud & Rothenflug ionisation balance
