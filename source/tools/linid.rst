.. highlight:: none

.. _sec:linid:

Linid
========


Linid is a utility for displaying spectral line lists without starting a full SPEX session. It can operate in two modes.
In the first mode, it returns detailed information on the strongest transitions for a user-specified element and
ionization stage. In the second mode, it lists all transitions within a user-defined energy interval.

For each transition, the tool provides the element, charge state, Rydberg state, empirical identifier, energy,
wavelength, and transition probability.

.. note::
The current implementation includes all isoelectronic sequences from H-like down to B-like ions. It only contains
K-shell transitions in the Rydberg series. For a complete list, please run a SPEX session.

.. example::

The first example is to list the Ne X Rydberg lines::
   
    Atomic number and spectroscopic charge (e.g., 8 8 for O VIII), or E and dE in keV (1.0 0.1):
    10 10

Next, to display all the recorded transitions in the 0.1 keV range around a central energy of 6.6 keV::

    Atomic number and spectroscopic charge (e.g., 8 8 for O VIII), or E and dE in keV (1.0 0.1):
    6.6 0.1
    

