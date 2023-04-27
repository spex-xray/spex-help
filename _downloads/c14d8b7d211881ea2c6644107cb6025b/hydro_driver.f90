	parameter(nz=30,nz1=nz+1,neg=1000)
	real con(nz1,nz),eg(0:neg),spec(neg)
	real it
!	con = 0	
!	open(unit=11,file='dumcon.asc',status='old')
!	do i = 1,78
!	  read (11,*) iz,jz,c
!	  jz = jz + 1
!	  con(jz,iz) = c
!	enddo
!	con(1,1) = 0.
!	close(11)
	con = 0.
	do iz = 1,nz
	  con(iz,iz) = 1.
	enddo
	do i = 0,neg
	  eg(i) = i * 0.01
	enddo
	hden = 1.e-14
	t = 1.
	it = 1.
	vmic = 0.
	volume = 1.e28
	call hydro_driver(hden,t,it,vmic,volume,con,neg,eg,spec)
	do i = 1,neg
	  write (12,*) 0.5*(eg(i-1) + eg(i)),spec(i)
	enddo
	end
	
	subroutine hydro_driver(hden,t,it,vmic,volume,con,neg,eg,spec)
	
!-- driver subroutine that can be used with externally calculated
!-- ion concentrations & plasma parameters to calculate the spectrum
!-- of the plasma
!
	implicit none
	
	integer, parameter :: nz = 30    !number of elements (do not change this number!)
	integer, parameter :: nz1= nz+1  !max number of ions (do not change this number!)
	integer, parameter :: lu = 10    !scratch logical unit number that will be used here

!-- input parameters
	
	real, intent(in) :: hden    !hydrogen density in 1e20 m**-3 (1e14 cgs)
	real, intent(in) :: t       !electron temperature in keV
	real, intent(in) :: it      !ion temperature in keV (used only for line broadening)
	real, intent(in) :: vmic    !microturbulent velocity (km/s)
	real, intent(in) :: volume  !the emitting volume in units of 1e24 m**3 (1e30 cgs)
	real, dimension(nz1,nz), intent(in) :: con(nz1,nz)  !the array con contains the ion concentrations
	  !relative to hydrogen (number densities). The abundances of the metals should be taken into
	  !account in this; thus, for example, for cosmic abundances, oxygen has a number density of
	  !about 0.001 per hydrogen atom, hence the sum of all oxygen ion concentrations should be 0.001.
	  !The array con(jz,iz) contains for each element (labeled with atomic number iz, H=1, He=2 etc.)
	  !the concentration; jz indicates the ionisation stage (1=I=neutral, 2=II=singly ionized, etc.;
	  !do not forget to include the bare nucleus as the last one. Array elements with jz>iz+1 will
	  !be ignored
	  !Note that as things are normalised to hydrogen, con(1,1) + con(2,1) = 1 is obligatory! 
	integer, intent(in)                :: neg          !number of energy bins
	real, dimension(0:neg), intent(in) :: eg           !energy bin boundaries in keV; the boundaries of the first bin
	   !are stored in eg(0) and eg(1); the second bin in eg(1) and eg(2); etc.
	
!-- output parameters

	real, dimension(neg), intent(out)  :: spec        !The emitted spectrum in units of 1e44 photons/s/keV
	   !divide this number by 4 * pi * distance**2 to get the flux at Earth.
	   
!-- scratch variables

	character*128 s,icon
	real elden,ed,e,cont,line,y
	integer i,j,iz,jz
	
!-------------------------------------------------------------------------------
!-- first step: create the command file for SPEX
!-------------------------------------------------------------------------------

!-- sanity checks

	if (con(1,1)+con(2,1).ne.1.0) stop 'Error: the hydrogen concentration must be 1 by default'
	
	open(unit=lu,file='spexicon.dat',status='replace')
	do iz = 1,nz
	  do jz = 1,iz+1
	    if (con(jz,iz).lt.0.) stop 'Error: concentrations must be non-negative'
	    write (lu,*) con(jz,iz)
	    ed = ed + con(jz,iz) * (jz - 1)
	  enddo
	enddo
	close(lu)
	elden = hden * ed               !electron density in 1E20 m**-3
	y     = volume * hden * elden   !emission measure in 1E64 m**-3
	
	open(unit=lu,file='spexgrid.egr',status='replace')
	do i = 0,neg
	  write (lu,*) eg(i)
	enddo
	close(lu)
	
	open(unit=lu,file='spexdriver.com',status='replace')
	
!	write (lu,'("spex <<STOP")')
	write (lu,'("$SPEX90/bin/spex <<STOP")')
	write (lu,'("com hyd")')
	write (s,'("par 1 1 hden v ",1pe14.5)') hden  ; write (lu,'(a)') trim(s)
	write (s,'("par 1 1 t    v ",1pe14.5)') t     ; write (lu,'(a)') trim(s)
	write (s,'("par 1 1 it   v ",1pe14.5)') it    ; write (lu,'(a)') trim(s)
	write (s,'("par 1 1 vmic v ",1pe14.5)') vmic  ; write (lu,'(a)') trim(s)
	write (s,'("par 1 1 norm v ",1pe14.5)') y     ; write (lu,'(a)') trim(s)
	write (lu,'("egrid read spexgrid")')
	write (lu,'("asc file spexoutput 1 1 tcl")')
	write (lu,'("quit")')
	write (lu,'("STOP")')
	close (lu)
	
!-------------------------------------------------------------------------------
!-- second step: run SPEX
!-------------------------------------------------------------------------------

	call system("chmod +x spexdriver.com")
	call system("spexdriver.com")
	
!-------------------------------------------------------------------------------
!-- third step: read the output from SPEX
!-------------------------------------------------------------------------------
		
	open(unit=lu,file='spexoutput.asc',status='old')
	do i = 1,4
	  read (lu,'(a)') s
	enddo
	do i = 1,neg
	  read (lu,*) j,e,cont,line,spec(i)
	enddo
	close(lu)
	
	end
	
