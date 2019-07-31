Comt: comptonisation model
==========================

This is the model for Comptonisation of soft photons in a hot plasma,
developed by :raw-latex:`\citet{titarchuk1994}`. See the XSPEC manual
for more details. The code was substantially improved and brought to the
SPEX standards.

Some modifications
------------------

Titarchuk (1994) gives an analytical approximation for
:math:`\beta(\tau`) to the exact calculations as provided by
:raw-latex:`\citet{sunyaev1985}` for :math:`0.1<\tau<10`. Their
approximation has the proper asymptotic behaviour for small and large
values of :math:`\tau`, but unfortunately has deviations up to 7 % over
the :math:`0.1-10` range for :math:`\tau`. The approximation by
Titarchuk is given in their equations (27) and (28) by

.. math::

   \begin{aligned}
   \mbox{disk:} \beta &=& 
   \frac{\pi^2}{12(\tau+2/3)^2} (1-{\mathrm e}^{\displaystyle{-1.35\tau}})
   +0.45{\mathrm e}^{\displaystyle{-3.7\tau}}\ln \frac{10}{3\tau}, \\
   \mbox{sphere:} \beta &=& 
   \frac{\pi^2}{ 3(\tau+2/3)^2} (1-{\mathrm e}^{\displaystyle{-0.7\tau}})
   +{\mathrm e}^{\displaystyle{-1.4\tau}}\ln \frac{4}{3\tau}.\end{aligned}

We found an approximation that is better than 1 % using a slight
modification of the above equations. We use these new approximations in
our calculations:

.. math::

   \begin{aligned}
   \mbox{disk:} \beta &=& 
   \frac{0.8351}{(\tau+0.867)^2}(1-{\mathrm e}^{\displaystyle{-3.876\tau}})
   +0.572{\mathrm e}^{\displaystyle{-3.75\tau}}\ln \frac{1.06}{\tau}, \\
   \mbox{sphere:} \beta &=& 
   \frac{3.504}{(\tau+1.2)^2}(1-{\mathrm e}^{\displaystyle{-2.09\tau}})
   +1.013{\mathrm e}^{\displaystyle{-2.2\tau}}\ln \frac{1.6}{\tau}.\end{aligned}

**Warning:** *For the physically valid range of parameters, consult the
XSPEC manual; see also :raw-latex:`\citet{hua1995}`, their Fig. 7.*

The parameters of the model are:

| ``norm`` : Normalisation :math:`A` of the power law, in units of
  :math:`10^{44}` ph s:math:`^{-1}\,`\ keV\ :math:`^{-1}`. Due to the
  way the model is calculated, this is not the flux at 1 keV! Default
  value: 1.
| ``t0`` : The temperature :math:`T` of the seed photons in keV. Default
  value: 1 keV.
| ``t1`` : The plasma temperature :math:`T` in keV. Default value: 100
  keV.
| ``tau`` : The optical depth. Default value: 3.
| ``type`` : The type of geometry. Allowed values are 0 for a disk
  (default) or 1 for a sphere. This is a frozen parameter (cannot be
  fitted).
| *Recommended citation:* :raw-latex:`\citet{titarchuk1994}`
