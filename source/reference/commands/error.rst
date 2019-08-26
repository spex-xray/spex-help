.. _sec:error:

Error: Calculate the errors of the fitted parameters
====================================================

Overview
~~~~~~~~

This command calculates the error on a certain parameter or parameter
range, if that parameter is free (thawn). Standard the 1\ :math:`\sigma`
error is calculated, which is equivalent to a 68 % confidence level. So
:math:`\Delta\chi^2` is equal to 1 for a single parameter error. The
:math:`\Delta\chi^2` value can be set, such that for instance 90 %
errors are determined (see `the table of delta-chi squared <#tab:deltachi>`__
for :math:`\Delta\chi^2` values with their corresponding confidence
levels).

SPEX determines the error bounds by iteratively modifying the parameter
of interest and calculating :math:`\chi^2` as a function of the
parameter. During this process the other free parameters of the model
may vary. The iteration stops when
:math:`\chi^2 = \chi_{\min}^2 + \Delta \chi^2`, where
:math:`\Delta \chi^2` is a parameter that can be set separately. The
iteration steps are displayed. It is advised to check them, because
sometimes the fit at a trial parameter converges to a different solution
branch, therefore creating a discontinuous jump in :math:`\chi^2`. In
those situations it is better to find the error bounds by varying the
search parameter by hand.

Note that SPEX remembers the parameter range for which you did your lat
error search. This saves you often typing in sector numbers or component
numbers if you keep the same spectral component for your next error
search.

If the error search reveals a new minimum in :math:`\chi^2` space that
was not found in the fit, SPEXwill save the parameters of this new
minimum in the file ``spex_lower_chi.com``. After the error search these
parameters can be set through the command ``log exe spex_lower_chi``, in
order to direct the model to the new minimum. Note that in the file
``spex_lower_chi.com`` the parameter for which the error was calculated
is "frozen".

.. warning:: A parameter must have the status "thawn" in order to be
   able to determine its errors.

.. warning:: The first time that you use the error command, you need to
   provide the sector number before it is remembered by SPEX. For example,
   error 1 1 norm.

Syntax
~~~~~~

The following syntax rules apply:

| ``error [[[#i1:] #i2:] #a:]`` : Determine the error bars for the
  parameters specified by the sector range #i1: (optional), component
  range #i2 (optional) and parameter range #a: (optional). If not
  specified, the range for the last call will be used. On startup, this
  is the first parameter of the first component of the first sector.
| ``error dchi #r`` : This command changes the :math:`\Delta\chi^2`, to
  the value #r. Default at startup and recommended value to use is 1,
  for other confidence levels see `the Table below <#tab:deltachi>`__.
| ``error start #r`` : This command gives an initial guess of the error
  bar, from where to start searching the relevant error. This can be
  helpful for determining the errors on normalization parameters, as
  otherwise SPEX may from a rather small value. To return to the initial
  situation, put #r=0 (automatic error search).

Examples
~~~~~~~~

| ``error norm`` : Find the error for the normalization of the current
  component
| ``error 2:3 norm:gamm`` : determines the error on all free parameters
  between "norm" and "gamm" for components 2:3
| ``error start 0.01`` : Start calculating the error beginning with an
  initial guess of 0.01
| ``error dchi 2.71`` : Calculate from now onwards the 90 % error, for 1
  degree of freedom. (Not recommended, use standard 68 % errors
  instead!)

.. table:: Table of :math:`\Delta\chi^2` as a function of confidence level,
   P, and degrees of freedom, :math:`\nu`.

   ====== ==== ==== ==== ==== ==== ====
   P      1    2    3    4    5    6
   ------ ---- ---- ---- ---- ---- ----
   68.3%  1.00 2.30 3.53 4.72 5.89 7.04
   90%    2.71 4.61 6.25 7.78 9.24 10.6
   95.4%  4.00 6.17 8.02 9.70 11.3 12.8
   99%    6.63 9.21 11.3 13.3 15.1 16.8
   99.99% 15.1 18.4 21.1 13.5 25.7 27.8
   ====== ==== ==== ==== ==== ==== ====
