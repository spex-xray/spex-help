     program compttxspec
     use moduser
     implicit none
     
     integer                         :: i

     ! Get input and output filenames
     call getfilenames(fin,fout,ier)

     ! Read input file
     call readprm(trim(fin))

     ! Allocate output arrays
     call allopar()
     
     ! Create Xspec tcl
     open(1,file="comptt.tcl",status="unknown")
     write(1,*) "model comptt & ", ipar%par(1), " & ", &
          ipar%par(2), " & ", ipar%par(3), " & ",      &
          ipar%par(4), " & ", ipar%par(5), " & ",      &
          ipar%par(6)
     write(1,*) "dummyrsp", ipar%egb(1)-ipar%deg(1),   &
          ipar%egb(ipar%neg), ipar%neg
     write(1,*) "set ff [open user.dat a]"
     write(1,*) "tclout plot model x"
     write(1,*) "puts $ff $xspec_tclout"
     write(1,*) "tclout plot model y"
     write(1,*) "puts $ff $xspec_tclout"
     write(1,*) "quit"
     close(1)

     ! Run Xspec tcl
     call system("rm -rf user.dat")
     call system("xspec comptt.tcl >> /dev/null")
     
     ! Read Xspec output
     open(1,file="user.dat",status="old")
     read(1,*)
     read(1,*) opar%sener
     close(1)

     ! Do not use wener values for now
     do i=1,opar%neg
        opar%wener(i)=0.0
     enddo
     
     ! Write result to output file
     call writespc(fout)
      
     ! Clean up memory and remove temporary files 
     call deallpar()
     call system("rm -rf user.dat")
     call system("rm -rf comptt.tcl")
     
     end program compttxspec
   
     
