      program locxspec
      use moduser
      implicit none
      
      integer             :: i
      
      ! Get input and output filenames
      call getfilenames(fin,fout,ier)
      
      ! Read input file
      call readprm(trim(fin))
      
      ! Allocate output arrays
      call allopar()
      
      ! Call local XSPEC model
      call ismabs(ipar%eg,ipar%neg,ipar%par,1,opar%sener)      
      
      ! Do not use wener values for now
      do i=1,opar%neg
        opar%wener(i)=0.0
      enddo
      
      ! Write result to output file
      call writespc(fout)
      
      ! Clean up memory
      call deallpar()
      
      end program
