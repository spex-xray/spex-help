Optimization commands
---------------------

Once the data have been read in and the model has been set, the model parameters can be optimized
to fit the data. The methods in this section are used for the optimization and determination of
the uncertainties in the fit.

Fit
^^^

The SPEX command to fit is simply ``fit`` and this has been implemented as ``fit`` in PYSPEX
as well:

  .. automethod:: pyspex.spex.Session.fit

This method can be called without any arguments. Optionally, the number of iteration steps can
be given, but this is only useful in some particular cases. When done fitting, the values of the
fit statistics can be found in the object ``s.opt_fit``. See the Fit() class for details.

Examples::

    >>> s.fit()
    >>> s.fit(niter=50)

Fit results
"""""""""""
The resulting C-statistics/Chi-square value and degrees of freedom can be obtained with separate
commands:

  .. automethod:: pyspex.spex.Session.fit_cstat
  .. automethod:: pyspex.spex.Session.fit_chisq

These commands return a tuple with the latest statistics value and the degrees of freedom.

Examples::

    >>> cstat = s.fit_cstat()
    >>> print(cstat)
    (2979.7792968, 3000)
    >>> chisq = s.fit_chisq()
    >>> print(chisq)
    (2997.3247823, 3000)

Fit statistics
""""""""""""""
Although C-statistics is recommended for Poisson distributed data like X-ray spectra, sometimes
it may be better to switch to chi^2 statistics. This can be done using the ``fit_stat`` method:

  .. automethod:: pyspex.spex.Session.fit_stat

The statistics (``stat``) can be either ``csta`` (C-statistics), ``chi2`` (Chi-square statistics),
or ``wsta`` (W-statistics). The W-statistics is added to SPEX for reference, but is not recommended
for use in analysis.

Example::

    >>> s.fit_stat('chi2')

If you have more instruments or regions which require a different fit statistic (optical or UV spectra
for example), then it is possible to set a different statistic for specific regions with the
``fit_stat_inst`` command:

  .. automethod:: pyspex.spex.Session.fit_stat_inst

One needs to specify the instrument and region number for which the new statistics apply.

Example::

    >>> s.fit_stat_inst('chi2',2,1)

Fit method
""""""""""
Next to the default Levenberg-Marquardt algorithm, SPEX also offers Simplex and Simulated annealing
methods (see :ref:`sec:fit`). The method can be selected using the following command:

  .. automethod:: pyspex.spex.Session.fit_method

The simulated annealing method has a number of parameters that can be altered. This can be done
using the ``fit_set_ann`` method:

  .. automethod:: pyspex.spex.Session.fit_set_ann

The current parameters can also be found in the ``s.opt_fit`` object. See :ref:`sec:pyspex_optimize`
for more information.

Examples::

    >>> s.fit_method('ann')
    >>> s.fit_set_ann('rt', 0.85)

Fit verbosity
"""""""""""""
The intermediate results from the fit iterations can be shown in the terminal (and in a pgplot
window). In PYSPEX, this feature is on by default. If you want to turn it off, then call

  .. automethod:: pyspex.spex.Session.fit_print

with ``False`` as ``status``. The intermediate steps will not be printed anymore.

Example::

    >>> s.fit_print(False)

Error
^^^^^

The command for calculating errors on fitted parameters is ``error`` and has a direct equivalent
in PYSPEX:

  .. automethod:: pyspex.spex.Session.error

The method calculates the lower and upper error value for the parameter with name ``name`` in
sector ``isect`` and component ``icomp``. Optionally, the target delta-c-stat value can be set.
By default, ``dchi`` is set to 1.0, which results in 68% (1 sigma) errors.

The error command returns an object with the results of the error calculation. See the Error()
class definition elsewhere in this manual.

Examples::

    >>> err_si = s.error(1,1,'14')
    >>> err_fe = s.error(1,1,'26',dchi=2.71)
    >>> print(err_fe.value, err_fe.lerr, err_fe.uerr)
    1.023902 -0.119324 0.109223
