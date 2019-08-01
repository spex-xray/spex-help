Calling SPEX from Fortran
=========================

Goal
----

Sometimes you may want to combine SPEX with some of your own code. For
instance, you may have a hydrodynamical code calculating the evolution
of a cluster of galaxies or a supernova remnant, and you want SPEX to
calculate the corresponding spectrum. Or you need to make realistic
simulations for a large sample of sources or a broad range of
parameters. In that case it can be useful to call SPEX from a fortran
program.

Solution
--------

The basic flow of the solution is as follows:

-  Start your fortran program and calculate whatever is needed

-  create a command file for SPEX

-  call SPEX through a system call

-  read the output of SPEX

-  continue with your program

To explain how you can do this, we give below a sample Fortran 90
program. The program first creates a command file called spex.com that
contains the input for the run with SPEX. In your case, you can replace
the "/usr/local/bin/spex" to whatever path is appropriate for you to
call SPEX. The ":math:`<<`\ STOP" is essential for linux to tell when
the input stream is finished.

In the command file, it tells how to read the pn spectrum of a cluster
of galaxies with roughly metallicity 0.3, temperature 2 keV, redshift
0.01 and Galactic foreground absorption of
:math:`10^{24} ~ \mathrm{m}^{-2}`. It ignores data at the lowest and
highest energies, sets the initial model and parameters for SPEX. It
will then perform a fit with SPEX. Next we tell SPEX to open an output
file named "spex.out", that will contain the results of the next part of
the SPEX run, an error search on the temperature. Note also that we have
set-up the plotting device to "null", to speed up the calculation (but
implying that you do not get to see the fit itself, so use with care).
After the error run, we stop SPEX, first by writing the "quit" command
for SPEX and then the end of input signal "STOP" for linux. Next we
simply close the command file spex.com.

The fortran program then continues by making spex.com executable, and
then by executing that file, thereby doing the run with SPEX. When SPEX
is finished, fortran takes over control again and reads the spex.out
file created by SPEX. The program grabs any info it needs from that file
(here the errors on the temperature) and then closes the file.

As a last step, the intermediate outputfile "spex.out" is deleted, as we
do not need it longer.

::

      real nh,z,t
      character*128 s

      z = 0.01    !redshift 0.01
      nh = 1e-4   !1E20 cm**-2 absorption column density (SPEX uses units of 1E28 m**-2)
      t = 2       !temperature 2 keV
         
      open(unit=12,file='spex.com',status='replace') !open a spex command file called spex.com
      write (12,'("/usr/local/bin/spex <<STOP")')    !call spex
      write (12,'("abu lodders")')                   !set abunances to Lodders scale
      write (s,'("dis ",f6.4," z")') z  
      write (12,'(a)') trim(s)                       !write the distance
      write (12,'("data pn pn)')                     !read some spex data set: pn.res & pn.spo
      write (12,'("ign in 1 r 1 1:60")')             !ignore first 60 channels
      write (12,'("ign in 1 12:10000 u kev")')       !ignore E>12 keV region
      write (12,'("com cie")')                       !define a CIE component
      write (12,'("com reds")')                      !define a redshift component                   
      write (12,'("com abs")')                       !define galactic absorption
      write (12,'("com rel 1 2,3")')                 !couple the components
      write (s,'("par 1 2 z v ",f6.4)') z  
      write (12,'(a)') trim(s)                       !set the redshift
      write (s,'("par 1 3 nh v ",1pe12.3)') nh  
      write (12,'(a)') trim(s)                       !set the galactic absorption
      write (12,'("par 1 3 nh s f")')                !freeze NH
      write (12,'("par 1 1 06:28 v 0.3")')           !set abundances of C to Ni to 0.3 time solar
      write (s,'("par 1 1 t v ",f5.2)') t  
      write (12,'(a)') trim(s)                       !set the temperature
      write (12,'("fit meth cstat")')                !use C-statistics for fitting          
      write (12,'("plot dev null")')                 !no visible plots
      write (12,'("plot type data")')                !plot type data
      write (12,'("fit prin 1")')                    !show each fitting step
      write (12,'("fit")')                           !do a fit
      write (12,'("err dchi 1.")')                   !for error search, do Delta chi**2 = 1
      write (12,'("log out spex o")')                !open a file for the SPEX output 
                                                     !file will be called "spex.out" 
                                                     !the option "o" means overwrite
      write (12,'("err 1 1 t")')                     !do an error search on T
      write (12,'("quit")')                          !done with the spex run, so quit
      write (12,'("STOP")')                          !last command needed to close the command file
      close (12)                                     !close the file spex.com and save

      call system("chmod +x spex.com")               !make file spex.com executable
      call system("spex.com")                        !execute the file spex.com

      open (unit=12,file='spex.out',status='old')    !open the outputfile spex.out
      do k = 1,100000                                !loop over all the lines in this file 
        read (12,'(a)',end=20) s                     !read the text of the line; put it in string s
        if (s(2:11).eq."Parameter:") then            !search for the line with text Parameter:
          read (s(34:),*) e1,e2                      !read from this line the errors on T
          err = 0.5 * (-e1 + e2)                     !calculate average pos and neg error
          !..... do further all you wish
        endif
      enddo                                          !close loop over lines file spex.out
   20 close(12)                                      !close spex.out
      call system("rm spex.out")                     !remove the file spex.out
      end
