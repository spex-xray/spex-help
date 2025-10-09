SSd: Shakura-Sunyaev disk model
=========================

This model performs on-the-fly exact calculations for a standard Shakura-Sunyaev
accretion disk. It distinguishes itself from the dbb model, which utilizes a 
solution based on analytic approximation.

Solving the energy balance in the vertical direction relies on the total weighted
mean absorption cross-section as a function of temperature and mass density. 
We incorporate the Rosseland opacity obtained from the Opacity project (Badnell
2005, MNRAS 360 2 458).

We calculate the self-gravity of the disk in the vertical direction. While in
the radial direction, this effect is negligible.

There is no radiative allowed below the plasma frequency calculated at each radius.
The frequencies are shown in the info file.

The coherence frequency serves as the critical point where Compton scattering becomes
important, causing photons to undergo significant energy changes through scattering
before leaving the disk. Utilizing the ``comp`` flag enables the option to calculate
the Comptonization spectrum above the coherence frequency, while below this frequency,
scattering is coherent and represented by a modified blackbody.

We incorporate the Compton kernel developed in Sunyaev and Titarchuk (1980).
The local disk spectrum are convolved with the kernel when the ``comp`` flag is turned on. 

Apart from the Compton kernel, the local energy spectrum of the modified blackbody is characterized by,

.. math:: B(T) = \frac{2 h \nu^3}{ c^2 (e^{h \nu / kT} - 1) } \frac{2}{1+\sqrt{1+\frac{\kappa_{\rm es}}{\kappa_{\rm ff}}}},

where :math:`\kappa_{\rm es}` and :math:`\kappa_{\rm ff}` are the opacities of scattering and free-free
absorption. We can transform the above form into a photon spectrum by 

.. math:: S(E) dE = 2 \pi c \left( 10^3 e / hc \right)^3  \frac{E^2}{e^{E/kT}-1} \frac{2}{1+\sqrt{1+\frac{\kappa_{\rm es}}{\kappa_{\rm ff}}}} dE \\
	  = 1.97395 \times 10^{36} \frac{1}{1+\sqrt{1+\frac{\kappa_{\rm es}}{\kappa_{\rm ff}}}} \frac{E^2}{e^{E/kT}-1} dE.

The total spectrum of the disk is obtained by integrating,

.. math:: L = 8 \pi^2 {\rm cos}i \int_{R_{i}}^{R_{o}} B(R) RdR.

By numerically summing over radius range :math:`R_{i}` and :math:`R_{o}`, we obtain the photon spectrum

.. math:: N(E) = 1.55857 \times 10^{38} {\rm cos}i \sum_{R_{i}}^{1000 R_{i}} \frac{1}{1+\sqrt{1+\frac{\kappa_{\rm es}}{\kappa_{\rm ff}}}} \frac{E^2}{e^{E/kT}-1} R \delta R

in the unit of photons per second per keV.

The parameters of the model are:

| ``cosi`` : Cos inclination. Default value: 1.
| ``alfa`` : Viscosity alpha. Default value: 0.1
| ``mass`` : Log blackhole mass. Default value: 8.
| ``mdot`` : Mass accretion Eddington ratio. Default value: 1.
| ``rin`` : Inner radius in Schwarzschild radius. Default value: 3.
| ``rout`` : Outermost radius in Schwarzschild radius. Default value: 1000.
| ``comp`` : 1 turns on Comptonization. 0 turns off. Default value: 0.
| ``info`` : 1 Disk diagnostics saved in ssd_info.txt. Default value: 1.

*Recommended citation:* `Shakura & Sunyaev (1973) <https://ui.adsabs.harvard.edu/abs/1973A%26A....24..337S/abstract>`_.


