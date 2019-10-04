.. _chap:plasmamodel:

Plasma model in SPEX 3.0
========================

The core of the plasma model
----------------------------

The old plasma code used by  in version 2.0 and below is essentially the
same plasma code as developed originally by Rolf Mewe and colleagues,
with relatively minor updates to the atomic data (like wavelength
improvements, corrections of a few typo’s, improvements for Fe XVII).

Its basis were precalculated and parametrized line emissivities for each
spectral line, as a function of temperature, with for relevant lines
empirical density corrections. For some transitiuons, like the He-like
triplets, the calculations were rather complex and required several
correction factors to account for the full density dependence.

In the new approach presented here, the basic plasma processes are
evaluated for each individual level, and then the occupation numbers of
the excited states are calculated for the full ion, solving a matrix
equation. This has the great advantage that with the same effort a
multitude of processes can be taken into account, including effects of
photo-excitation and photo-ionisation. From the occupation numbers and
the radiative transition probabilities it is then straightforward to
calculate the emitted spectrum.

In order to keep the code fast and flexible, we have chosen for a
procedure to parametrise all relevant processes, and using simple
analytical formulae with a limited number of parameters for each
process. This is beneficial both in terms of computation time and
storage demands and formed the basis for the succes of Mewe’s original
work.

The production of the relevant files is not yet complete, but in the
first release of version 3.0 we incorporate the data for the H, He, and
Li iso-electronic sequences, and some data for the other sequences,
including the Fe-L ions. For an overview of what is in the code see
Section :ref:`sect:newsequences` below.

By default, the plasma code is the old version 2.0 code, but by giving
the command “var calc new”, for the ions for which new data are
available, the new code is used. This leads in principle to higher
accuracy and many more spectral lines. A disadvantage is of course that
the computations become somewhat slower. For spectral fitting, one could
envision a procedure where in a first run the old code is used to get
close to the best parameters, and then to refine using the new plasma
core.

If you want to use the new plasma model, it is
important to make sure the ionisation balance is the
new *u17* balance. This new balance has improved
collisional ionisation rates and allows to calculate
properly inner-shell transitions that are needed for
the new calculations. See `Urdampilleta et al.
(2017) <https://ui.adsabs.harvard.edu/abs/2017A%26A...601A..85U/abstract>`_
for details.

Finally, it is advised that the users have a look to the various
ascii-output options that are available for the plasma models, allowing
to get deeper insight into the physical process and parameters that are
being used.

.. _sect:newsequences:

Ions for which updated calculations are available
-------------------------------------------------

Below we list for each iso-electronic sequence what data is available
for the new plasma calculations. Each line corresponds to one ion, with
*ii, iz and jz* corresponding to the iso-electronic sequence, nuclear
charge and ionisation stage, respectively. Then for a number of process
we list two quantities: :math:`N`, the number of entries we have (e.g.,
number of energy levels or transition rates), and :math:`n_{\mathrm max}`
the maximum principal quantum number for wich we use data for that ion
and process. Note that :math:`n_{\mathrm max}` refers to the highest level
included for a transition between two levels.

The processes incorporated and shown in the table are:

#. *levels* – Energy levels

#. *Arad* – Radiative transition probabilities (Einstein coefficients)

#. *Atwo* – Two-photon processes

#. *El col* – Electron collisional excitation

#. *Pr col* – Proton collisional excitation

#. *Aug* – Auger rates (auto-ionisation, needed for dielectronic
   recombination)

#. *CX* – Charge exchange recombination

#. *RR* – Radiative recombination

#. *II* – Inner-shell processes (this is merely the number of quantum
   states after ionisation; the number of fluorescent lines will be
   larger)
