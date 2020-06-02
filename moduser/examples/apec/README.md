# APEC to SPEX interface

Needed files:

- **apec-xspec.f90:** Fortran program to run APEC in SPEX.
- **moduser.f90:** Fortran module providing the user model interface. 

## How to use APEC in SPEX

1. Optional: Download APEC model files from ATOMDB website.

2. Optional: Set the ATOMDB environment variable to point to the path 
   where ATOMDB is installed, for example:
   ```
   export ATOMDB=/path/to/atomdb/atomdb_v3.0.9
   ```
   
3. Optional: Change the TCL script if you want to run a model other than bvvapec 
   (line 68-93 in ``apec-xspec.f90``).

4. Compile the fortran program by running:
   ```
   gfortran -g -c -o moduser.o moduser.f90
   gfortran -g -c -o apec-xspec.o apec-xspec.f90
   gfortran -g -o apec-xspec apec-xspec.o moduser.o
   ```
   
5. Run SPEX >= 3.01.00 and give at least the following commands:
   ```
   com user
   par 1 exec av ./apec-xspec
   par 1 npar v 34
   ```

6. Set user model parameters to APEC parameters:
   ```
   p01      temperature
   p02:p31  abundances (H-Zn)
   p32      redshift (fixed to zero; SPEX redshift used)
   p33      turbulence velocity (sigma; km/s)
   p34      APEC normalization
   ```
  
