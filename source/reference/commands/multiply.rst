.. _sec:multiply:

Multiply: scaling of the response matrix
========================================

Overview
~~~~~~~~

This command multiplies (a component of) the response matrix by a
constant.

**Warning:** *If this command is repeated for the same component then
the original response matrix is changed by the multiplication of the
constants. For example, after multiplying the response matrix by a
factor of 2, the original matrix is recovered by multiplying the
intermediate result by 0.5.*

**Warning:** *The instrument number must be given in this command even
if you use only a single instrument.*

Syntax
~~~~~~

The following syntax rules apply:

| ``multiply #i1 [component #i2] #r`` : Multiplies the response matrix
  of component #i2 of instrument #i1 by a constant #r.

Examples
~~~~~~~~

| ``multiply 1 3.5`` : Multiplies the response matrix from instrument 1
  by a factor of 3.5.
| ``multiply 1 component 2 3.5`` : Multiplies the second component of
  instrument 1 by the constant 3.5.
