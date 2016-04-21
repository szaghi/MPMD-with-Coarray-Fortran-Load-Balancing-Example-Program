! This file is part of:
! MPMD with Coarray Fortran Load Balancing – Example Program
! copyright 2016 by Michael Siehl
! www.mpmd-with-coarray-fortran.de
! http://www.mpmd-with-coarray-fortran.de/MPMD_Load_Balancing_example.pdf

!< *Entry_Main_Sub* definition.
MODULE Main_Sub
!< *Entry_Main_Sub* definition.
!
CONTAINS
!
!**********
!
SUBROUTINE Entry_Main_Sub
  !< Main entry subroutine.
  !<
  !< @note Start the ImageManager on all images.
  !
  USE OOOPimma_admImageManager
  !
  IMPLICIT NONE
  !
  CALL OOOPimma_Start (OOOPimmaImageManager_1) ! start the ImageManager on all images
  !
END SUBROUTINE Entry_Main_Sub
!
!**********
!
END MODULE Main_Sub
