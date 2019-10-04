Stellar Spectra
===============

We examine a high resolution spectrum of a nearby star at a distance of
10 pc. The files :download:`corona.spo </_static/exercises/corona.spo>`
and :download:`corona.res </_static/exercises/corona.res>` contain the spectrum
and instrumental response of this source. This spectrum has been
simulated using a RGS-like response. We do not provide real data files,
because of their size and because of the time constraints of the course.
You can use :download:`plot_rgs.com </_static/exercises/plot_rgs.com>`
for plotting, but it is more instructive and easier to plot manually!

#. Read the data into SPEX and plot it in unit Å. The data ranges
   roughly from 8 to 38 Å. Hint: you may issue successively the commands
   ``plot set all`` and ``plot line disp t`` to get a connecting line
   through the data for better visibility.

#. Determine the wavelength of the two strongest lines in the spectrum
   and use this table to identify them:
   `<http://www.sron.nl/~kaastra/leiden2018/line_new.pdf>`_.
   Can you give a rough estimate of the temperature (in keV) of the
   corona from the fact that you see these lines? Note: The
   temperatures listed in the line list are in log Kelvin
   (:math:`k_b = 8.617 \times 10^{-8}` :math:`\mathrm{keV} \ \mathrm{K}^{-1}`).

#. Load a model with just one component called CIE (``com cie``) which
   means Collisional Ionization Equilibrium. Fit the spectrum and
   calculate the error. Was your temperature estimate right?

#. There is one line that is not fitted correctly. Use the line table
   from exercise 2 to see which element is emitting this line. Set this
   element to ``thawn`` and fit again. Is the fit better?

#. Now you can also free the iron and oxygen abundance and fit the
   spectrum again. What are the values for the abundance? The values in
   the fit are relative to solar abundances (more details can be
   obtained with the command ``asc ter 1 1 abun``, see :ref:`sec:ascdump`).
   Calculate the errors. Are the fitted abundances consistent with solar abundances?

   These kind of spectra (with a low continuum) often produce wrong
   abundances because of the low S/N of the continuum and the bias
   produced by :math:`\chi^2` statistics (Humphrey, Liu & Buote, 2008).
   In SPEX we can switch from C-statistics to :math:`\chi^2` statistics
   to test this. This is accomplished by issuing the command
   ``fit stat chi`` before doing another fit.

#. Fit the spectrum using ``fit stat chi``. Are the abundances the same
   as before? Calculate the errors. Are the new values consistent with
   solar abundances? Switch back to C-statistics after this step.

#. Fix all abundances and free the ion temperature. Fit the spectrum and
   calculate the error on the ion temperature. Is it well constrained?
   Find out what the ion temperature does with the lines for values 1,
   10, 100, and 1000 (change the value in the model and calculate the
   model by typing ``calc``. Do not fit!). What happens?

#. Plot the spectrum from 21 Å to 23 Å. These lines are called the
   oxygen triplet. The lines depend strongly on electron density. Play
   around with the electron density in the same way as you did with the
   broadening (ion temperature). What happens with these lines?
   Calculate the error. Can you give an upper limit for the density of
   the plasma?

#. There are a lot of lines in this spectrum. You can learn also which
   lines belong to a certain element by putting its abundance to 0 and
   calculate. Do this for O, Ne and Fe. If you like, you can also try it
   out for other elements. Finally, SPEX can also provide a list with
   all the present ions: ``asc ter 1 1 icon``.

Note: SPEX can provide a lot of information about the plasma or an
absorber through the command ``asc ter``. See the SPEX manual for more
output options.

**Learning goals:**

After having done this spectrum, you should know:

-  How to plot a spectrum in wavelength units.

-  How to identify spectral lines.

-  How to get physical parameters from a thermal X-ray spectrum.

-  How to measure abundances from an X-ray spectrum.

-  How to measure electron density from an X-ray spectrum.

-  How to use the "asc" command in SPEX (:ref:`sec:ascdump`).
