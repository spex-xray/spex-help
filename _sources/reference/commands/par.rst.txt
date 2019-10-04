.. _sec:par:

Par: Input and output of model parameters
=========================================

Overview
~~~~~~~~

This command is used as an interface to set or display the parameters of
the spectral model. Each model parameter (like temperature :math:`T`,
abundance, normalization etc.) has a set of attributes, namely its
value, status, range and coupling. This is illustrated by the following
example. Assume we have a spectral model consisting of a thermal plasma.
Consider the silicon abundance (acronym in the model: 14). It can have a
value (for example 2.0, meaning twice the solar abundance). Its status
is a logical variable, true (thawn) if the parameter can be adjusted
during the spectral fitting proces or false (frozen) if it should be
kept fixed during the spectral fit. The range is the allowed range that
the parameter can have during the spectral fit, for example 0–1000
(minimum – maximum values). This is useful to set to constrain a
spectral search to a priori "reasonable" values (e.g. abundances should
be non-negative) or "safe" values (SPEX could crash for negative
temperatures for example). Finally the coupling allows you to couple
parameters, for example if the Si abundance is coupled to the Fe
abundance, a change in the Fe abundance (either defined by the user or
in a spectral fitting process) will result automatically in an
adjustment of the Si abundance. This is a useful property in practical
cases where for example a spectrum has strong Fe lines and weaker lines
from other species, but definitely non-solar abundances. In this case,
one may fit the Fe abundance, but the statistics for the other elements
may not be sufficient to determine their abundance accurately; however a
priori insight might lead you to think that it is the global metallicity
that is enhanced, and therefore you would expect the Si abundance to be
enhanced in the same way as Fe.

With the par command, you can set for each parameter individually or for
a range of parameters in the same command, their attributes (value,
status, range and coupling). Also, you can display the parameters on the
screen or write them on a SPEX command file, which allows you to start
another run with the current set of parameters.

When setting parameters, you can also specify the sector (range) and
component (range). For your first call, it is assumed that you refer to
sector 1, component 1, first parameter. In all subsequent calls of the
parameter command, it is assumed that you refer to the same sector(s)
and component(s) as your last call, unless specified differently. This
is illustrated by the following example. Suppose you have the following
model: power law (component 1), blackbody (component 2) and RGS line
broadening (lpro, component 3). If you type in the commands in that
order, this is what happens:

-  ``par val 2`` – sets the norm (= first parameter) of the power law to
   value 2

-  ``par gam val 3`` – sets the photon index of the power law to value 3

-  ``par 2 t val 2.5`` – sets the temperature of the blackbody to 2.5 keV

-  ``par norm val 10`` – sets the norm of the blackbody to 10

-  ``par 1:2 norm v 5`` – sets the norm of both the PL and BB to 5

-  ``par val 4.2`` – sets the norm of both the PL and BB to 4.2

-  ``par 3 file avalue myprofile.dat`` – sets for the LPRO component the
   file name with the broadening kernel to myprofile.dat. Note that the
   command ’value’ changes here to ’avalue’ to indicate that the
   parameter is an ascii string.

Instrument normalisations can be thawned by entering the instrument
number as a negative sector number. For example, freeing the instrument
normalisation of instrument 2 is done with the command
``par -2 1 norm stat thawn``. The second value in the command (1) is the
region number. Therefore, freeing the normalisation of the third region
of the fourth instrument is done with the command:
``par -4 3 norm stat thawn``.

Syntax
~~~~~~

The following syntax rules apply:

| ``par [#i1:] [#i2:] [#a1:] avalue #a2`` : Assign the value #a2 to the
  parameters specified by the (range of) name(s) #a1 of component range
  #i2: of sectors #i1:. The sector (range), component (range) and
  parameter name (range) are optional. If #a2 should be an empty text
  string, specify the value "none" (without quotes, and all four
  characters in lowercase). If they are not specified, the sector(s),
  component(s) and parameter(s) of the last call are used. This command
  containing the word "avalue" holds for input of text strings. For the
  input of real numbers "avalue" is replaced by "value" and #a2.
| ``par [#i1:] [#i2:] [#a:] value #r`` : Assign the value #r to the
  parameters specified by the (range of) name(s) #a of component range
  #i2: of sectors #i1:. The sector (range), component (range) and
  parameter name (range) are optional. If not specified, the sector(s),
  component(s) and parameter(s) of the last call are used.
| ``par [#i1:] [#i2:] [#a:] status #l`` : As above but for the status of
  a (range of) parameters; #l = T (true, thawn) means a parameter that
  can be adjusted during a spectral fit, #l = F (false, froze, fixed)
  means a parameter that will remain fixed during the spectral fitting.
| ``par [#i1:] [#i2:] [#a:] range #r1:#r2`` : As above but fore the
  allowed range of the parameter. #r1 denotes the lower limit and #r2
  denotes the upper limit. Both should be specified.
| ``par [#i1:] [#i2:] [#a1:] couple [#i3:] [#i4:] #a2:`` : Here #i1:,
  #i2:, #a1: are the sector(s), component(s) and parameter(s) that are
  to be coupled. The parameter (s) to which they are coupled are
  specified by #a2: and the optional #i3:, #i4:. If ranges are used,
  take care that the number of sectors, components and parameters on the
  right and left match.
| ``par [#i1:] [#i2:] [#a1:] couple [#i3:] [#i4:] #a2: factor #r`` : As
  above, but couple using a scaling factor #r.
| ``par [#i1:] [#i2:] #a: decouple`` : Decouples the parameter(s) #a: of
  (optional) components #i2: of of (optional) sector(s) #i1:. Inverse
  operation of the couple command.
| ``par show [free]`` : Shows on the display screen all parameters of
  all components. If the optional keyword free is given, shows only
  parameters with fit status "T" (true, thawn), i.e., the free
  parameters in a spectral fit.
| ``par show corr #l`` : Display the correlations between parameters
  after fitting if this flag is true (default)
| ``par write #a [overwrite]`` : Writes all parameters to a SPEX command
  file #a. #a should be specified without extension, SPEX automatically
  adds the .com extension. If the optional overwrite command is given,
  then the file #a will be overwritten with the new values.

Examples
~~~~~~~~

| ``par val 10`` : Sets the value of the current parameter to 10.
| ``par t val 4`` : Sets the parameter named "t" to 4.
| ``par 06:28 value 0.3`` : Sets the parameters named 06:28 (for example
  the abundances of C (:math:`Z=6`), N (:math:`Z=7`), :math:`\ldots` Ni
  (:math:`Z=28`)) to the value 0.3.
| ``par 2 nh val 0.01`` : Sets the parameter named "nh" of component 2
  to the value 0.01
| ``par 1 1 norm value 1E8`` : Sets parameter named "norm" of component
  1 of sector 1 to the value :math:`10^8`.
| ``par file avalue myfile.with.data`` : sets the ascii-type parameter
  named "file" to the value "myfile.with.data" (without quotes).
| ``par file avalue none`` : sets the ascii-type parameter named "file"
  to the value "" (i.e. an empty string)
| ``par status frozen`` : Sets the fit status of the current parameter
  to "frozen" (fixed).
| ``par 1 3 t stat thawn`` : Specifies that parameter "t" of the third
  component of the model for sector 1 should be left free (thawn) during
  spectral fitting.
| ``par 2 3 gamm range 1.6:1.9`` : Limit parameter "gamm" of component 3
  of sector 2 to the range 1.6 – 1.9.
| ``par norm range -1E8 1E8`` : Set the range for the parameter "norm"
  between :math:`-10^{8}` and :math:`+10^{8}`. This command is necessary
  if for example the model is a delta line used to mimick an absorption
  line, which normally has a default minimum value of 0. (for an
  emission line).
| ``par 1 1 norm couple 2 1 norm`` : Couples the norm of the first
  component for the first sector to the norm of the first component of
  the model for the second sector.
| ``par 1 1 norm couple 2 1 norm factor 3`` : The same command as the
  above, but now the norm of the first component in the model for sector
  1 is 3 times the norm of the first component of the model for sector
  2. For example, if the norm of the 1st component of sector 2 gets the
  value 40, then the norm of the 1st component of sector 1 will
  automatically be updated to a value of :math:`3\times 40 = 120`.
| ``par 3:5 02:30 couple 1 02:30`` : Couples the abundances of He–Zn of
  components 3, 4 and 5 to the He–Zn abundances of component 1.
| ``par norm decouple`` : Decouples the norm of the current component
  from whatever it was coupled to.
| ``par -2 1 norm stat thawn`` : Free the instrument normalisation of
  instrument 2 and region 1.
| ``par show`` : Shows all the parameters of the current model for all
  sectors and how they are coupled (if applicable). For each parameter
  it shows the value, status, range and coupling information, as well as
  info on its units etc. It also shows the fluxes and restframe
  luminosities of the additive components, photon flux (phot/m**2/s) and
  energy flux (W/m**2) are the values observed at Earth (including any
  transmission effects like Galactic absorption or intrinsic absoprtion
  that have been taken into account), and the nr. of photons (photons/s)
  and luminosity (W) are all as emitted by the source, without any
  attenuation.
| ``par show free`` : As above, but only displays the parameters that
  have the status thawn.
| ``par write mypar overwrite`` : SPEX writes all parameters for the
  model to a file named mypar.com. Any previously existing file
  mypar.com is overwritten.
| ``par write mypar`` : Same command as above, but now a new file is
  created. If there already exists a file with the same filename
  SPEX will give an error message.
