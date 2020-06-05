.. _sec:model:

Model: show the current spectral model
======================================

Overview
~~~~~~~~

This commands prints the current spectral model, for each sector, to the
screen. The model is the set of spectral components that is used,
including all additive and multiplicative components. For all additive
components, it shows in which order the multiplicative components are
applied to the additive (emitted) components. See
:ref:`sec:comp` for more details.

Syntax
~~~~~~

The following syntax rules apply:

| ``model show`` : Prints the model for all sectors to the screen.
| ``model show #i`` : Prints the model for sector #i to the screen.

Examples
~~~~~~~~

| ``model show 2`` : Prints the model for the second sector
