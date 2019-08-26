.. _sec:comp:

Comp: create, delete and relate spectral components
===================================================

Overview
~~~~~~~~

In fitting or evaluating a spectrum, one needs to build up a model made
out of at least 1 component. This set of commands can create a new
component in the model, as well as delete any component. Usually we
distinguish two types of spectral components in SPEX.

The *additive* components correspond to emission components, such as a
power law, a Gaussian emission line, a collisional ionization
equilibrium (CIE) component, etc.

The second class (dubbed here *multiplicative* components for ease)
consists of operations to be applied to the additive components.
Examples are truly multiplicative operations, such as the Galactic
absorption, where the model spectrum of any additive component should be
multiplied by the transmission of the absorbing interstellar medium,
warm absorbers etc. Other operations contained in this class are
redshifts, convolutions with certain velocity profiles, etc.

The user needs to define in SPEX which multiplicative component should
be applied to which additive components, and in which order. The order
is important as operations are not always communative. This setting is
also done with this component command.

If multiple sectors are present in the spectral model or response matrix
(see Section `Sectors and regions <#sec:sectorsandregions>`__) then
one has to specify the spectral components and their relation for each
sector. The possible components to the model are listed and described in
Section `Spectral models <#chap:specmod>`__.

Note that the order that you define the components is not important.
However, for each sector, the components are numbered starting from 1,
and these numbers should be used when relating the multiplicative
components to the additive components.

If you want to see the model components and the way they are related,
type "model show".

.. warning:: If in any of the commands as listed above you omit the
             sector number or sector number range, the operation will
             be done for all sectors that are present. For example,
             having 3 sectors, the "comp pow" command will define a
             power law component for each of the three sectors. If you
             only want to define/delete/relate the component for one
             sector, you should specify the sector number(s). In the
             very common case that you have only one sector you can
             always omit the sector numbers.

.. warning:: After deleting a component, all components are re-numbered!
             So if you have components 1,2,3 for example as pow, cie, gaus,
             and you type "comp del 2", you are left with 1=pow, 2=gaus.

Syntax
~~~~~~

The following syntax rules apply:

| ``comp [#i:] #a`` : Creates a component #a as part of the model for
  the (optional) sector range #i:
| ``comp delete [#i1:] #i2:`` : Deletes the components with number from
  range #i2: for sector range (optional) #i1. See also the warning above
| ``comp relation [#i1:] #i2: #i3,...,#in`` : Apply multiplicative
  components #i3, …, #in (numbers) in this order, to the additive
  components given in the range #i2: of sectors in the range #i1
  (optional). Note that the multiplicative components must be separated
  by a ","

Examples
~~~~~~~~

| ``comp pow`` : Creates a power-law component for modeling the spectrum
  for all sectors that are present.
| ``comp 2 pow`` : Same as above, but now the component is created for
  sector 2.
| ``comp 4:6 pow`` : Create the power law for sectors 4, 5 and 6
| ``com abs`` : Creates a Morrison & McCammon absorption component.
| ``comp delete 2`` : Deletes the second created component. For example,
  if you have 1 = pow, 2 = cie and 3 = gaus, this command delets the cie
  component and renumbers 1 = pow, 2 = gaus
| ``comp del 1:2`` : In the example above, this will delete the pow and
  cie components and renumbers now 1 = gaus
| ``comp del 4:6 2`` : If the above three component model (pow, cie,
  gaus) would be defined for 8 sectors (numbered 1–8), then this command
  deletes the cie component (nr. 2) for sectors 4–6 only.
| ``comp rel 1 2`` : Apply component 2 to component 1. For example, if
  you have defined before with "comp pow" and "comp "abs" a power law
  and galactic absorption, the this command tells you to apply component
  2 (abs) to component 1 (pow).
| ``comp rel 1 5,3,4`` : Taking component 1 a power law (pow), component
  3 a redshift operation (reds), component 4 galactic absorption (abs)
  and component 5 a warm absorber (warm), this command has the effect
  that the power law spectrum is multiplied first by the transmission of
  the warm absorber (5=warm), then redshifted (3=reds) and finally
  multiplied by the transmission of our galaxy (4=abs). Note that the
  order is always from the source to the observer!
| ``comp rel 1:2 5,3,4`` : Taking component 1 a power law (pow),
  component 2 a gaussian line (gaus), and 3–5 as above, this model
  applies multiplicative components 5, 3 and 4 (in that orer) to the
  emission spectra of both component 1 (pow) and 2 (cie).
| ``comp rel 7:8 1:2 5,3,4`` : As above, but only for sectors 7 and 8
  (if those are defined).
| ``comp rel 3 0`` : Remove all relations from component 3.
