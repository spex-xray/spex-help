!   -*- f90 -*-
    module moduser

    type inppar
      integer              :: npar        ! Number of parameters
      real, allocatable    :: par(:)      ! Parameter values
      integer              :: neg         ! Number of model bins
      real, allocatable    :: egb(:)      ! Bin upper boundary (keV)
      real, allocatable    :: eg(:)       ! Bin centroid (keV)
      real, allocatable    :: deg(:)      ! Bin width (keV)
    end type inppar

    type outpar
      integer              :: neg         ! Number of model bins
      real, allocatable    :: sener(:)    ! Spectrum in ph/s/bin
      real, allocatable    :: wener(:)    ! if Delta E = average photon energy within the bin (keV) minus the bin centroid
                                          ! then wener = sener * Delta E
    end type outpar

    character*16           :: fin, fout
    integer                :: ier

    type(inppar), pointer  :: ipar
    type(outpar), pointer  :: opar

    contains

    ! =================================
    ! Read file names from command line
    ! =================================
    subroutine getfilenames(fin,fout,ier)
    implicit none

    character*16, intent(out)   :: fin, fout
    integer, intent(out)        :: ier
    integer                     :: i

    ier=0

    call get_command_argument(1,fin)
    call get_command_argument(2,fout)

    fin=trim(adjustl(fin))//char(0)
    fout=trim(fout)

    open(unit=11,file=trim(fin),iostat=ier,status='old')

    if (ier.gt.0) then
      write(*,*) 'Error reading input file.'
      stop
    endif
    close(11)

    end subroutine getfilenames


    ! =================================
    ! Read parameter file
    ! =================================
    subroutine readprm(fin)
    implicit none

    character*16, intent(in)  :: fin
    integer                    :: ier, i

    ier=0
    allocate(ipar)

    ! Open input file
    open(unit=11,file=trim(fin),iostat=ier,status='old')

    ! Read number of parameters
    read(11,*) ipar%npar

    ! Allocate parameter array & read it
    allocate(ipar%par(ipar%npar))
    read(11,*) ipar%par

    ! Read number of model bins
    read(11,*) ipar%neg

    ! Allocate model bin array & read it
    allocate(ipar%egb(ipar%neg))
    allocate(ipar%eg(ipar%neg))
    allocate(ipar%deg(ipar%neg))
    do i=1,ipar%neg
      read(11,*) ipar%egb(i), ipar%eg(i), ipar%deg(i)
    enddo

    close(11)
    end subroutine readprm


    ! =================================
    ! Write output model file
    ! =================================
    subroutine writespc(fout)
    implicit none

    character*16, intent(in)  :: fout
    integer                    :: ier, i

    if (associated(opar)) then
      ! Open output file
      open(unit=11,file=trim(fout),iostat=ier,status='replace')

      ! Write number of model bins
      write(11,*) opar%neg

      ! Write spectrum
      do i=1,opar%neg
        write(11,*) opar%sener(i), opar%wener(i)
      enddo

      close(11)
    else
      write(*,*) 'Error: output array not allocated'
    endif

    end subroutine writespc


    ! =================================
    ! Allocate memory for output array
    ! =================================
    subroutine allopar()
    implicit none

    allocate(opar)
    opar%neg=ipar%neg
    allocate(opar%sener(opar%neg))
    allocate(opar%wener(opar%neg))

    end subroutine allopar


    ! =================================
    ! Clean up memory
    ! =================================

    subroutine deallpar()
    implicit none

    if (associated(ipar)) then
      deallocate(ipar%par)
      deallocate(ipar%eg)
      deallocate(ipar%egb)
      deallocate(ipar%deg)
      deallocate(ipar)
    endif

    if (associated(opar)) then
      deallocate(opar%sener)
      deallocate(opar%wener)
      deallocate(opar)
    endif

    end subroutine deallpar

    end module moduser
