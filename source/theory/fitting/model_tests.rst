Testing model significance
==========================

When searching spectra for subtle signals, it can be very helpful to have a good test to see if
a certain signal is potentially significant. On this page, we discuss a couple of approaches that
one may take for certain hypotheses.

Testing the presence of an absorber
-----------------------------------

Suppose you want to test whether there is anywhere material in between the X-ray source and the observer.
In this case you take a relevant *physical* absorption model from SPEX, e.g. slab, xabs, pion, hot, or
similar, and add it to your source emission model.

Key to testing the presence of such gas is then the significance of the component, e.g. to be tested
by exploring the relation between the adopted column density and Delta C-stat.

More concrete, the difference in C-stat between the best-fit model with absorption included and the
model with column density zero (equivalent to a model without absorption).

Since you are testing here the presence of additional material in the line of sight, negative values
of column density are *not* allowed, and indeed the model cannot have emission, as it should be, because
you test the presence of intervening (absorbing) material.

Alternatively, you might want to test the presence of hot emitting material somewhere in the line
of sight. Then you could use e.g. the CIE model of SPEX, again a *physical* emission model, and then
you would have the model normalization replacing the absorbing column as key parameter (somewhat
simplified here, other model parameters like temperature of course also play a role).

Essentially, in both cases you *must* have one-sided tests (not allowing absorption to have negative
column density, or emission to have negative emission measure).

Testing whether the model is describing the data sufficiently well
------------------------------------------------------------------

You observe the spectrum of a source, but are not sure whether you have the right model. There may be
excess emission or absorption that you want to explore. Maybe your ideal blazar emits weak spectral
lines, or there is a WHIM filament in between the source and us that gives absorption dips.

You have no clue what is the case, you just want to explore if the simple power-law (or a more complex
emission model) is sufficient to describe the observed spectrum.

If you find some spectral deviations, then you may attempt more physical models (emission, absorption)
to physically model these deviations. But that is the next step, after having assessed whether there is
something going on in the spectrum.

In this case, if you are exploring line-like features (rather than broad-band things like soft
excesses), I would recommend using the “line” model in SPEX to determine significances. The line
model is a multiplicative model that can handle both emission and absorption. It is simply a
Voigt profile, and the optical depth parameter tau0 determines whether it is describes emission
(tau0 < 0, note the sign) or absorption (tau0 > 0, note the sign). When you do a fit, it can swap
across tau0=0 easily. For simplicity, the Lorenzian broadening can be put to 0 as a first estimate.

The significance of tau0 simply tells you if you have significant emission or absorption.
