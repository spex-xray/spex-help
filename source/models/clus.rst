.. _sect:clus:

Clus: projected cluster model
=============================

.. Warning:: This is a complex model, so please read carefully this documentation before using the model

Overview
--------

This model calculates the spectrum and radial profiles of a cluster of galaxies.
The 3-D density, temperature, abundance, turbulence and in/outflow fields are 
parameterized. The cluster is subdivided into 3D-shells; the number of shells can be adjusted.
For each shell, the spectrum is calculated using the collisional equilibrium (CIE) model for
the proper parameters.

The shell spectra are projected on the sky, and the user can choose an inner and outer
projected radius between which the spectrum is calculated. By choosing different radii,
the spectra of different regions of the cluster can be evaluated.

The model calculates the total spectrum, and this spectrum can be fit like any other SPEX model.
At this moment, there are two ascii-output options associated with the model.

The first option ("clus") provides output of radius, hydrogen density, temperature,
gas pressure, emission measure, turbulent velocity, outflow velocity and relative abundances.
The second option ("clup") provides the projected radial profile of the number of photons and energy flux,
in an energy band specified by the user.

.. Warning:: this model has a lot of free parameters (currently 80). Do not blindly thaw
   all parameters, but make as much as possible use of other constraints and common sense.
   
Two important radii
-------------------

It is important to distinguish two important radii in the model.

Internally, everything is scaled to :math:`r_{500}` , which is the first parameter of the
model (input name r500). It should be given in units of :math:`10^{22}` meter. 
The default value is 3 (i.e., :math:`r_{500} = 3\times 10^{22}` m, or approximately (but not exactly!))
1 Mpc.

The cluster is terminated at a radius :math:`r_{\mathrm{out}}` (input name: rout).
Outside this radius, the density is cut-off to zero, so this means the effective edge
of the cluster is at :math:`r_{\mathrm{out}}`. It should be provided in units of 
:math:`r_{500}`, and its default value is 2 (i.e., :math:`2\times 3` or :math:`6\times 10^{22}` m
or approximately 648 kpc).

.. Warning:: If you really want to go to the outermost cluster outskirts,
   and you increase :math:`r_{\mathrm{out}}` , then you should take care to adjust 
   possibly the number of shells (default 25) and/or projected annuli (default 50),
   otherwise the spatial resolution of your model may be insufficient.
   
The two parameters governing the radial scaling are summarized below.

+---------+--------------------------+---------------+-------------------+
| Acronym | Variable                 | Default value | Units             |
+---------+--------------------------+---------------+-------------------+
| r500    | :math:`r_{500}`          | 3.0           | :math:`10^{22}` m |
+---------+--------------------------+---------------+-------------------+
| rout    | :math:`r_{\mathrm{out}}` | 2.0           | :math:`r_{500}`   |
+---------+--------------------------+---------------+-------------------+

Radial grid: 3-d shells
-----------------------

The 3-d model is evaluated for a logarithmic radius grid, in order to cover the possible
large dynamical range between the core of the cluster and the outermost radius. 
The user specifies :math:`n_{r}` (input name nr), the number of shells for which the
model is evaluated. 

The default value for nr is 25, but it can be changed (obviously, for large values the computation
time increases). The logarithmic grid is chosen to be beween :math:`r_{\mathrm{in}}`
and :math:`r_{\mathrm{out}}`.
Here :math:`r_{\mathrm{in}}` is taken as 1% of :math:`r_{500}`, or if that is smaller,
10% of the smallest of the core radii for the density profile (see later).
Obviously, for the innermost shell the inner boundary :math:`r_{\mathrm{in}}` is replaced by 0 instead.

The hydrodynamical parameters like density, temperature etc. are then evaluated for the middle
radius of each shell using analytical parameterisation of the profiles (see later), and we assume
that these quantities are constant within the shell.

Therefore, the emission measure of each shell is simply evaluated as the product of
electron and hydrogen density at the central radius of the shell, multiplied by the volume of the
shell; we do not perform finer integration.

In case the user introduces a density discontinuity in the model, the radius of the density
discontinuity is also chosen as an additional grid point (if it is close to an existing grid point,
that existing grid point is moved to the discontinuity).

Radial grid: projected profile
------------------------------

While as said we take a logarithmic grid for the 3-d shells of the cluster, to cover the large
dynamical range, we take a linear grid for the projected 2-d profile. This is because that projected
profile is often closely linked to a real detector, which has a linear scale.

The default number of projected annuli (input name: npro) is 50, but again that number can be changed.

While for the 3-d shells we only evaluate quantities at the shell central radii, in evaluating the
projected profiles we do some sub-shell evaluation (typically using 20 points for each shell).
This is in order to avid a kind of "saw-tooth" projected profiles, which would result
if we simply kept the emission measure constant within the shell. Within the shell, we adopt
a power-law behaviour of the emission measure as a function of radius. The power-law slope
is simply determined by comparing the emission measures of the neighbouring shells.

.. Warning:: If you adjust the parameters for the model, take care that the radial bin sizes of the
   outermost shells are compatible in magnitude with the bin sizes of the projected profiles.
   You can see both grids by using the ascii-output options for the "clus" and "clup" options,
   respectively.

The parameters governing both the 3-d and projected bins are summarized below.

+---------+--------------------------+---------------+-------+
| Acronym | Variable                 | Default value | Units |
+---------+--------------------------+---------------+-------+
| nr      | :math:`n_{r}`            | 25            |       |
+---------+--------------------------+---------------+-------+
| npro    | npro                     | 50            |       |
+---------+--------------------------+---------------+-------+


Radial density distribution
---------------------------

The hydrogen density distribution is parametrised as the sum of two beta-models,
modified by a possible density jump (shock):

.. math:: n(r) = \bigl[ n_1(r) + n_2(r) \bigr] f(r)

with for :math:`i=1,2:`

.. math:: n_i(r) = \frac {n_{0,i}}{ \bigl[ 1 + (r/r_{c,i})^2 ) \bigl] ^{1.5\beta_{i}}}

where :math:`n_0` is the central density in units of per cubic meter for both components
(input names hd1 and hd2), :math:`r_c` are the core radii (rc1 and rc2 in the input)
in units of :math:`r_{500}` and
:math:`\beta` the beta parameters (bet1 and bet2 in the input).

The optional density jump parameterisation :math:`f(r)` is:

.. math:: r<r_s:\quad f(r) = 1

.. math:: r>r_s:\quad f(r) = \Delta_d (r/r_s)^{\gamma_d}

where the discontinuity radius :math:`r_{s}` (input name rsh) 
is given again in units of :math:`r_{500}`
and further :math:`\Delta_d` is the density jump at :math:`r_{s}` (its input name is dfac).
Please note that, in the case of no jump (i.e. :math:`\Delta_d = 1`), the term :math:`f(r)` is ignored.
For :math:`\Delta_d > 1` the density increases outside :math:`r_{s}` relative
to the undisturbed model, while for :math:`\Delta_d > 1` it decreases.
Further fine-tuning of the discontinuity can be achieved by playing with the power-law
parameter :math:`\gamma_d` (input name dgad). Positive values means increasing effects at 
large radii, z zero value (the default) a constant jump, and negative values correspond to
a decreasing effect of the jump at large radii.

The parameters describing the density profile are summarized below.

+---------+-----------------------+---------------+--------------------------+
| Acronym | Variable              | Default value | Units                    |
+---------+-----------------------+---------------+--------------------------+
| hd1     | :math:`n_{0,1}`       | 5000          | :math:`{\textrm m}^{-3}` |
+---------+-----------------------+---------------+--------------------------+
| rc1     | :math:`r_{c,1}`       | 0.1           | :math:`r_{500}`          |
+---------+-----------------------+---------------+--------------------------+
| bet1    | :math:`\beta_1`       | 0.7           |                          |
+---------+-----------------------+---------------+--------------------------+
| hd2     | :math:`n_{0,2}`       | 25000         | :math:`{\textrm m}^{-3}` |
+---------+-----------------------+---------------+--------------------------+
| rc2     | :math:`r_{c,2}`       | 0.01          | :math:`r_{500}`          |
+---------+-----------------------+---------------+--------------------------+
| bet2    | :math:`\beta_2`       | 1.0           |                          |
+---------+-----------------------+---------------+--------------------------+
| rsh     | :math:`r_s`           | 2.0           | :math:`r_{500}`          |
+---------+-----------------------+---------------+--------------------------+
| dfac    | :math:`\Delta_{d}`    | 1.0           |                          |
+---------+-----------------------+---------------+--------------------------+
| dgad    | :math:`\gamma_{d}`    | 0.0           |                          |
+---------+-----------------------+---------------+--------------------------+


Radial temperature distribution
-------------------------------

The temperature distribution is based upon Vikhlinin et al. (2006) (Eq. 6)  (2006ApJ...640..691V)
but with a temperature jump added and described below.

The Vikhlinin parameterisation is the product of two terms. For the first term, describing the
inner part of the cluster (:math:`T_1(r)` below), we rewrite his expression to an equivalent but slightly
different form, as given by Kaastra et al. 2004, eq. 10 (https://www.aanda.org/articles/aa/pdf/2004/02/aah4230.pdf),
which in turn is based on Allen et al. 2001.

With this, the temperature profile can be written as

.. math:: T(r) = T_1(r) f_1(r) f_2(r)

with

.. math:: T_1(r) = T_c + (T_h - T_c) \frac{x^\mu}{1+x^\mu}

.. math:: x = r / r_{tc}

.. math:: f_1(r) = \frac{y^{-a}}{\bigl[ 1 + y^b \bigr]^{c/b}}

.. math:: y = r / r_{to}

.. math:: r<r_s:\quad  f_2(r) = 1

.. math:: r>r_s:\quad  f_2(r) = \Delta_t (r/r_s)^{\gamma_t}

The central and outer temperatures :math:`T_c` and :math:`T_h` are not the actual temperatures,
but the temperatures that would exist without the  :math:`f_1(r)` and :math:`f_2(r)` terms.

Similar to the density profile, we allow for a possible temperature jump of any magnitude
(i.e., increase or decrease) at the radius :math:`r_s` (which is the same radius where a possible
density jump may occur).

Most default parameters are based on Vikhlinin et al. Eq. 8 for the typical 
temperature profile that they derived.

We assume that the ion temperature equals the electron temperature for each shell.
The parameters describing the temperature profile are summarized below.

+---------+-----------------------+---------------+-----------------+
| Acronym | Variable              | Default value | Units           |
+---------+-----------------------+---------------+-----------------+
| tc      | :math:`T_c`           | 1.8           | keV             |
+---------+-----------------------+---------------+-----------------+
| th      | :math:`T_h`           | 4.0           | keV             |
+---------+-----------------------+---------------+-----------------+
| rtc     | :math:`r_{tc}`        | 0.045         | :math:`r_{500}` |
+---------+-----------------------+---------------+-----------------+
| mu      | :math:`\mu`           | 1.9           |                 |
+---------+-----------------------+---------------+-----------------+
| rto     | :math:`r_{to}`        | 0.6           | :math:`r_{500}` |
+---------+-----------------------+---------------+-----------------+
| at      | :math:`a`             | 0.0           |                 |
+---------+-----------------------+---------------+-----------------+
| bt      | :math:`b`             | 2.0           |                 |
+---------+-----------------------+---------------+-----------------+
| ct      | :math:`c`             | 2.0           |                 |
+---------+-----------------------+---------------+-----------------+
| tfac    | :math:`\Delta_{t}`    | 1.0           |                 |
+---------+-----------------------+---------------+-----------------+
| gamt    | :math:`\gamma_{t}`    | 0.0           |                 |
+---------+-----------------------+---------------+-----------------+

Radial abundance profile
------------------------

The relative metal abundances can be adjusted similar to the CIE model 
(see the last parts of this chapter). 
But these abundances can be multiplied by a radial scaling law :math:`f(r)`.

The scaling law, including the default parameters, is taken from
Mernier et al. (2017)
https://www.aanda.org/articles/aa/pdf/2017/07/aa30075-16.pdf
However, we write it in a slightly different, equivalent form as follows:

.. math:: f(r) = \frac{A}{(1+r/B)^C} \bigl[ 1-De^{\displaystyle{-(r/F)(1+r/E)}}  \bigr] + G

If the abundances should be kept constant as a function of radius,
the user should take care that :math:`f(r)\equiv 1` for all radii. 
This can be achieved for instance by setting A=0, G=1.

The constant term with G was not included in Mernier et al. (2017), but may be useful for some applications.
Its default value is 0.

Note that the radial scaling works the same way for all chemical elements; the abundances
themselves (as given by the parameters 01, 02, 03 etc.) can of course be different.

.. Warning:: The radial scaling is only done for elements with nuclear charge 3 or more 
   (i.e., Li and higher). Hydrogen and helium are excluded from the scaling.
   It is therefore highly recommended to keep the reference atom to its default
   (Hydrogen) for this model, and not to use another one.

.. Warning:: If you do a spectral fit of a spectrum that is for example dominated
   by iron lines, take care that the parameter afe and the iron abundance 26 are strongly
   correlated. In those situations it may be wise to keep one of them frozen. 

The parameters describing the abundance profile are summarized below.

+---------+-----------+---------------+-----------------+
| Acronym | Variable  | Default value | Units           |
+---------+-----------+---------------+-----------------+
| afe     | A         | 1.34          |                 |
+---------+-----------+---------------+-----------------+
| bfe     | B         | 0.021         | :math:`r_{500}` |
+---------+-----------+---------------+-----------------+
| cfe     | C         | 0.48          |                 |
+---------+-----------+---------------+-----------------+
| dfe     | D         | 0.414         |                 |
+---------+-----------+---------------+-----------------+
| efe     | E         | 0.163         | :math:`r_{500}` |
+---------+-----------+---------------+-----------------+
| ffe     | F         | 0.0165        | :math:`r_{500}` |
+---------+-----------+---------------+-----------------+
| gfe     | G         | 0.0.          |                 |
+---------+-----------+---------------+-----------------+

Turbulence
----------

The plasma turbulence can also be parametrised. We use the following description:

.. math:: v^2 = v_a^2 + \frac{v_b \lvert v_b \rvert x^2}{1+x^2}

with

.. math:: x = r / r_v

Here :math:`v` has the same meaning as the vrms parameter of the CIE model of SPEX 
(see there for more documentation).

At the center, v is given by :math:`v=v_a`, at large distances it is given by
:math:`v^2=v_a^2 + v_b \lvert v_b \rvert`
Note that due to this definition, positive values of :math:`v_b` means increasing turbulence
for larger radii, while negative values means decreasing turbulence for larger radii.

.. Warning:: If you do a spectral fit or evaluate the model, take care that for negative
   values of :math:`v_b` with :math:`v_b` smaller than :math:`-v_a`, the turbulent velocity
   would become imaginary (:math:`v^2<0`). To avoid a crash, SPEX cuts these values off to zero,
   and continues, but be aware that your results are not realistic anymore in those situations.
   
.. Warning:: The turbulent velocity here is only the component due to microscopic or
   macroscopic motions of the gas cells. In addition, the thermal motions of the ions will be added
   in quadrature using the relevant (ion) temperature.

The parameters describing the turbulence profile are summarized below.

+---------+-------------+---------------+-----------------+
| Acronym | Variable    | Default value | Units           |
+---------+-------------+---------------+-----------------+
| av      | :math:`v_a` | 100           | km/s            |
+---------+-------------+---------------+-----------------+
| bv      | :math:`v_b` | 0             | km/s            |
+---------+-------------+---------------+-----------------+
| rv      | :math:`r_v` | 1             | :math:`r_{500}` |
+---------+-------------+---------------+-----------------+

   
Radial velocity fields
----------------------

In addition to turbulence, the model allows for systematic radial motion (inflow or outflow).
This is done as follows:


.. math:: v = v_c + \frac{(v_h - v_c) x^2}{1+x^2}

with

.. math:: x = r / r_z

Positive values correspond to inflow, negative values to outflow.
The parameter :math:`v_c` corresponds to the flow velocity at the core,
:math:`v_h` is the flow velocity at large distances. Note that the default
values for these parameters correspond to no in- or outflow.

+---------+-------------+---------------+-----------------+
| Acronym | Variable    | Default value | Units           |
+---------+-------------+---------------+-----------------+
| zc      | :math:`v_c` | 0             | km/s            |
+---------+-------------+---------------+-----------------+
| zh      | :math:`v_h` | 0             | km/s            |
+---------+-------------+---------------+-----------------+
| rz      | :math:`r_z` | 1             | :math:`r_{500}` |
+---------+-------------+---------------+-----------------+

Projected spectra and radial profiles
-------------------------------------

The cluster model projects the spectra of all shells onto the sky. But sometimes the
user is not interested in the spectrum of the full cluster, but only in the spectrum within
a projected annulus. 

One can specify the inner and outer radius :math:`r_{min}` and :math:`r_{max}`
for this projected annulus annulus. 
The spectrum is then only calculated between those boundaries.

Contrary to all other radii, we specify these radii in units of :math:`r_{out}`,
the outer radius of the cluster. Thus, for :math:`r_{min}=0` and :math:`r_{max}=1`,
the full cluster spectrum is obtained.

On the other hand, the "clup" output option allows to display the 
radial intensity profile of the cluster for a given energy band. These energies
(always in keV) can be specified by the parameters :math:`E_{min}` and :math:`E_{max}`.

It may be that the user wants the spectrum or profile in a more complex region than
a simple annulus, for instance the projection of a square detector (pixel). 
The cluster model provides an option for this by using the parameter with name
"azim". When this parameter has value 0, the full annulus is used. When it has a value
of 1, a more complex region can be used. In this latter case, the user must specify the
name of an ascii-file (parameter fazi).

This file must have the following contents:

first line: number of points

next lines: for each specified radius, from small to large radii, two numbers, namely the
radius :math:`r` and the azimuthal fraction :math:`f_a`.

The radius :math:`r` must be in units of :math:`r_{out}`, the azimuthal fraction :math:`f_a`
should be between 0 (no contribution of this annular radius) and 1 (the full annulus is contributing.)
The spacing between the radial points should be such that linear extrapolation between the
points gives a fair representation of the shape of the extraction region.

For example, if the extraction region is for example a quarter of the sky counted from the
cluster center (e.g, everything between 0 and 90 degrees azimuthal angle), the content of the 
file could be simply three lines:

2

0 0.25

1 0.25

If the first radius is larger than 0 or the last radius less than 1, we adopt
:math:`f_a=0` (no emission) for the non-specified regions.

An error message will be given if the file is incorrect, and in that case
the model is evaluated as if the flag azim=0 (i.e., :math:`f_a=1` everywhere).

We summarise the parameters below.

+---------+-----------------+-----------------+-----------------+
| Acronym | Variable        | Default value   | Units           |
+---------+-----------------+-----------------+-----------------+
| rmin    | :math:`r_{min}` | 0               | :math:`r_{out}` |
+---------+-----------------+-----------------+-----------------+
| rmax    | :math:`r_{max}` | 1               | :math:`r_{out}` |
+---------+-----------------+-----------------+-----------------+
| emin    | :math:`E_{min}` | 0               | keV             |
+---------+-----------------+-----------------+-----------------+
| emax    | :math:`E_{max}` | :math:`10^{20}` | keV             |
+---------+-----------------+-----------------+-----------------+
| azim    |                 | 0               |                 |
+---------+-----------------+-----------------+-----------------+
| fazi    |                 |                 |                 |
+---------+-----------------+-----------------+-----------------+

Resonance scattering
--------------------

Resonance scattering of the strong resonance lines can be taken into account, if the user needs this.
This is indicated by the parameter with name rsca. Allowed values are 0 (no resonance scattering)
or 1 (resonance scattering).

The resonance scattering is calculated using a Monte Carlo approach. It is therefore less suited for
spectral fitting, due to the random effect inherently caused by this technique.

The initial 3D emissivity profile for the relevant lines is taken as starting point. From this profile,
N x nr random photons are drawn (here nr is the number of shells introduced earlier, and N is an adjustable number that
can be set by the user, see the table below).

There are two modes: for mode=2, each shell starts with the same number of photons 
(the final result is of course weighted with the proper shell emissivity). 
This has the advantage that the calculation also have a reasonable accuracy in the outer parts, where the emissivity is
small. It is therefore most relevant when studying radial line profiles of the resonant lines in the outskirts.
For the default mode=1, the number of initial photons is distributed according to emissivity; therefore this case is
more suited for the overall spectrum of the full cluster. Experience shows it is slightly more accurate in the part
of the cluster that emits the bulk of the photons.

The fate of each individual photon is followed. The calculation for the photon stops when either it is absorbed in the
continuum, or when it leaves the cluster. Alternatively, it can be absorbed and then a) re-emitted in a new random
direction (the resonance scattering), or b) it decays to a non-ground level, resulting in two or more photons until the
atom reaches the ground state again. The fate of these multiple photons is followed until they are destroyed or escape.
At the end of the calculation, some statistics is collected on the history of the photon.

When resonance scattering is included, in principle three diagnostic files with information on the resonant lines are
produced. These files are always named ``cluslin1.asc``, ``cluslin2.asc`` and ``cluslin3.asc``, they are placed in
the directory from which SPEX is running, and they are overwritten each time the model is being evaluated. When the
user wishes to store these files, a simple spex command like ``sys exe "cp cluslin1.asc newa1.asc"`` is sufficient
to copy it to a file ``newa1.asc``, for example.

If the user does not want to produce this output, the parameters out1, out2 and out3 should be set to zero (see below).
The default value for them is 1, i.e. produce the output. If some of these numbers are put to zero, no output of that
kind is produced.

In most other cases of SPEX output, we make use of the asc-output options. However, in particular when the number of
shells is large or the number of iterations N is large, the computational time can be very large, and with different
random seeds for each run results may not be fully reproducible. For that reason, the resonance scattering line
information is given "on the fly".

The relevant parameters are listed below.

+---------+-----------------+-----------------+-----------------+
| Acronym | Variable        | Default value   | Units           |
+---------+-----------------+-----------------+-----------------+
| rsca    |                 | 0               |                 |
+---------+-----------------+-----------------+-----------------+
| nit0    | N               | 10000           |                 |
+---------+-----------------+-----------------+-----------------+
| rmod    | mode            | 1               |                 |
+---------+-----------------+-----------------+-----------------+
| out1    | out1            | 1               |                 |
+---------+-----------------+-----------------+-----------------+
| out2    | out2            | 1               |                 |
+---------+-----------------+-----------------+-----------------+
| out3    | out3            | 1               |                 |
+---------+-----------------+-----------------+-----------------+

.. Warning:: When running resonance scattering, be aware that the computation times may become very large.
   For example, a run with 128 radial shells, 256 projected annuli, with cluster parameters adjusted to 
   the Perseus cluster, and with nit0 equal to :math:`10^5` and thus :math:`1.28\times 10^7` random drawings
   per spectral line (and 666 spectral lines included) takes about 6 hours to complete on a single core of a 2.3 GHz processor
   using the gfortran compiler; it may be faster using other processors or compilers. For less ambitious accuracy
   a couple of minutes per model evaluation is more realistic.

Output files for resonance scattering
-------------------------------------

As noted, in principle three files are produced when resonance scattering is included in the calculations.
These file ``cluslin1.asc``, ``cluslin2.asc`` and ``cluslin3.asc`` are stored in the directory where SPEX is running,
and are overwritten each time the model is evaluated again. Here we describe the contents of these files.

**cluslin1.asc:**

This is a summary of all the spectral lines where resonance scattering is taken into account. 
The file contains a descriptive header (one line) followed by several lines for each spectral line.
The columns are as follows:

1. Line number. This is a unique number for each line, which is used as a label for the ``cluslin2.asc`` and ``cluslin3.asc``
   files to identify the spectral lines. These numbers are always the same for a given transition, but note that the
   numbering is different for the "old" set of atomic lines and the "new" set of atomic lines.

2. Element and ionisation stage.

3. Designation of the transition. For the "old" calculation, typically the Mewe et al. (1985) notation, for the "new"
   calculation, it gives the lower and upper level of the transition. Both notations are the same as for the line-ascii
   output option.

4. The energy of the line, in keV.

5. The oscillator strength of the line. However, for lines not ending at the ground level (the non-resonant lines),
   we put here a value of zero, even if the true oscillator strength is non-zero. The cluster model assumes that all
   ions are in their ground state when they absorb a photon.

6. Branching ratio. This is the probability that an atom that has absorbed a resonant photon falls back to the ground
   state immediately, rather than to an intermediate energy level.

7. tau_l: the optical depth of the line at line centre.

8. tau_c: the continuum optical depth (i.e., the optical depth relevant for absorption of the photon in the continuum).

9. photons: the number of photons that leave the cluster (either as original, scattered or splitted photon).

10. lost: the number of photons lost by continuum absorption. This number, added to the number of escaping photons
    gives the original number of photons for this line for the Monte-Carlo calculation.

11. ori_flux: the original emitted flux (number of photons per second) in the line, without resonance scattering.

**cluslin2.asc:**

This file gives the projected properties of all the lines summarized in cluslin1.asc. 
The file contains a descriptive header (one line) followed by npro lines for each spectral line.
The columns are as follows:

1. line number (corresponding to the first number in ``cluslin1.asc``)

2. ir: the projected annulus number

3. r: the radius of the projected annulus in :math:`10^{22}` m. The radius is here the mean of the inner and outer
   radius of the annulus.

4. fluxscale: the scaling factor by which the number of photons in the next three columns (5 to 7) needs to be
   multiplied in order to get fluxes in photons per square meter per second, emitted at the cluster (not to be
   confused with the flux received at Earth!).

5. f1: the number of photons that would have been visible in this annulus if no resonance scattering occurs.

6. f2: the actual number of photons that leave the cluster from this annulus to the observer.

7. f2-f1: the difference f2-f1.

8. f2/f1: the ratio between f2 and f1. This is actually the relative flux decrease or increase due to resonance
   scattering.

9. # scat: The average number of scatterings that the observed photon has experienced, since creation of the photon.

10. DelE: the average energy shift of the photons, in eV.

11. sigma: The r.m.s. line width in eV. This incorporates the original line width and  all effects of the resonance
    scattering. Note that some lines may have Lorentzian wings in reality; those are visible in the final spectrum.
    Voigt profiles are computed there based on this r.m.s. and the original natural broadening of the line. The
    Gaussian component of the line therefore ignores any non-gaussianity, but only considers the width of the line,
    which is accurate enough in the majority of cases.

**cluslin3.asc:**

This file gives the 3D, radial properties of all the lines summarized in ``cluslin1.asc``.
The file contains a descriptive header (one line) followed by several lines for each spectral line.
The columns are as follows:

1. line number (corresponding to the first number in ``cluslin1.asc``)

2. ir: the 3D shell number

3. r: the radius of the shell in :math:`10^{22}` m. The radius is here the mean of the inner and outer radius of the shell.

4. T: the temperature of the shell at mid-radius

5. fr: the fraction of the total line flux of the cluster emitted from this shell (without resonance scattering)

6. concentrat: the ion concentration of the emitting ion at this radius.

Atomic physics of the resonance lines
-------------------------------------

For the "old" atomic data set, we used a list of 204 selected lines deemed to be relevant in 1996, when the first
version of this model was created. For the "new" atomic data set, we selected 666 transitions for H-like to Na-like
ions, under the following assumptions:

1. We use a simple scaling law :math:`N_{\rm H} = 10^{25} \sqrt{T}` where :math:`N_{\rm H}` is the total column density
   from the core of the cluster to infinity, in units of per square meter, and :math:`{T}` the temperature in keV. This
   matches approximately the Perseus cluster at a temperature of 4 keV. It is based on the simple scaling laws for
   cluster mass M, radius R and density :math:`\rho`

:math:`M\sim R^3\rho` , :math:`\rho` constant, :math:`M\sim T^{1.5}` and :math:`N_{\rm H} \sim \rho R`

2. For a grid of temperatures T from 0.25 to 16 keV, step size a factor of 2, assuming no turbulence (i.e., the highest
   possible optical depths) and a column density of 5 times higher than the scaling relation given under 1. above, we
   calculated the optical depths of all ground-state absorption lines in SPEX using the "hot" absorption model.

3. From this list, we selected all lines with energy larger than 0.1 keV, optical depth larger than 0.03, and optical
   depth larger than 1% of the strongest line of that ion at that temperature.

4. For each resonance line, we only considered the most important decay channels from the excited state (typically
   stronger than 1% of the total decay rate) in order to limit the number of decay routes to the ground to a manageable
   number. In practice, the number of decay routes was thus limited to a maximum of 7 (including the main resonance
   line), and we limited the number of lines to a maximum of 3 per route (ignoring the lowest energy lines in a few
   cases; these ignored lines were always at much lower energy than the X-ray band).

5. Transition energies, oscillator strengths and branching ratios were thus obtained from the current atomic data
   base of SPEX. When this database will be updated, the same transitions will be used for the resonance scattering,
   but branching ratios, oscillator strengths and line energies will automatically be adjusted; these quantities are
   initialised each time upon the first call to the cluster model.


Non-thermal electron distributions and abundances
-------------------------------------------------

The effects of non-thermal electron distribution on the spectrum can be
included like any SPEX model. See :ref:`sec:nonthermal` for more details.

We refer here to the description of the CIE model for the abundances. 
We use the same parameters as in that model.
See description below.

Parameter description
---------------------

The remaining parameters of the model are:

| ``ref`` : reference element. Default value 1 (hydrogen). See above for
  more details. The value corresponds to the atomic number of the
  reference element.
| ``01`` : Abundance of hydrogen (H, Z=1) in Solar units. Default 1.
| ``02`` : Abundance of helium (He, Z=2) in Solar units. Default 1.
| ``03...30`` : Abundance of all elements up to zinc (Zn, Z=30) in Solar units.
  Default 1.
| ``file`` : Filename for the non-thermal electron distribution. If not
  present, non-thermal effects are not taken into account (default).

*Recommended citation:* Kaastra et al. (2022) (this manual for the moment).
