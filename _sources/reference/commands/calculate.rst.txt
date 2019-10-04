.. _sec:calculate:

Calculate: evaluate the spectrum
================================

Overview
~~~~~~~~

This command evaluates the current model spectrum. When one or more
instruments are present, it also calculates the model folded through the
instrument. Whenever the user has modified the model or its parameters
manually, and wants to plot the spectrum or display model parameters
like the flux in a given energy band, this command should be executed
first (otherwise the spectrum is not updated). On the other hand, if a
spectral fit is done (by typing the "fit" command) the spectrum will be
updated automatically and the calculate command needs not to be given.

Syntax
~~~~~~

The following syntax rules apply:

| ``calc`` : Evaluates the spectral model.

Examples
~~~~~~~~

| ``calc`` : Evaluates the spectral model.
