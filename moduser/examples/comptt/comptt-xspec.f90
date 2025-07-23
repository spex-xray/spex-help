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
     
     open(12,file="energies.txt",status="new")
     write(12,*) ipar%eg(1) - abs(ipar%egb(1)-ipar%eg(1))
     do i=1,ipar%neg
       write(12,*) ipar%egb(i)
     enddo
     close(12)
     
     ! Create Xspec tcl
     open(11,file="comptt.tcl",status="unknown")
     write(11,*) "model comptt & ", ipar%par(1), " & ", &
          ipar%par(2), " & ", ipar%par(3), " & ",      &
          ipar%par(4), " & ", ipar%par(5), " & ",      &
          ipar%par(6)
     write(11,*) "energies energies.txt"
     write(11,*) "set ff [open user.dat a]"
     write(11,*) "tclout plot model x"
     write(11,*) "puts $ff $xspec_tclout"
     write(11,*) "tclout plot model y"
     write(11,*) "puts $ff $xspec_tclout"
     write(11,*) "quit"
     close(11)

     ! Run Xspec tcl
     call system("rm -rf user.dat")
     call system("xspec comptt.tcl >> /dev/null")
     
     ! Read Xspec output
     open(11,file="user.dat",status="old")
     read(11,*)
     read(11,*) opar%sener
     close(11)

     ! Do not use wener values for now and correct spectrum for bin width
     do i=1,opar%neg
        opar%sener(i)=opar%sener(i) * 2. * abs(ipar%egb(i)-ipar%eg(i))
        opar%wener(i)=0.0
     enddo
     
     ! Write result to output file
     call writespc(fout)
      
     ! Clean up memory and remove temporary files 
     call deallpar()
     call system("rm -rf user.dat")
     call system("rm -rf comptt.tcl")
     call system("rm -rf energies.txt")
     
   end program compttxspec
   
     
