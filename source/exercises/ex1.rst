Powerlaw
========

Before doing this exercise, we advise you to read :ref:`sec:intro`.

The spectrum in the files :download:`powerl.spo </_static/exercises/powerl.spo>`
and :download:`powerl.res </_static/exercises/powerl.res>` was recorded
from a source at 6 kpc distance.

#. Load the spectrum into SPEX and plot it.

#. The calibration of the instrument is not very accurate for energies
   below 0.3 keV and above 10 keV. Ignore those parts of the spectrum.

#. How many data bins do you have in the spectrum? Now try to apply
   optimal binning to the spectrum. How many bins are left?

#. Set up an absorbed powerlaw model. Do not forget to set the distance
   to the source.

#. Next step: fit the spectrum. Is it a good fit?

#. Calculate the errors on all free parameters and save your results in
   a text file.

#. It may be wise to save the commands that you entered in SPEX to a
   command file, so you can repeat the analysis where needed. Try to
   make such a command file.

**Learning goals:**

After having done this spectrum, you should know:

-  How to read a spectrum in SPEX (using :ref:`sec:data`).

-  How to use the basic plot functionalities (using :ref:`sec:plot`).

-  How to ignore parts of the spectrum (using :ref:`sec:ignore`).

-  How to rebin a spectrum (using :ref:`sec:bin`).

-  How to set-up a simple spectral model (using :ref:`sec:comp`).

-  How to set the distance (using :ref:`sec:distance`).

-  How to do spectral fitting (using :ref:`sec:fit`).

-  How to determine errors on parameters (using :ref:`sec:error`).

-  How to save your commands & results (using :ref:`sec:log`).
