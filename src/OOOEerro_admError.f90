! This file is part of:
! MPMD with Coarray Fortran Load Balancing – Example Program
! copyright 2016 by Michael Siehl
! www.mpmd-with-coarray-fortran.de
! http://www.mpmd-with-coarray-fortran.de/MPMD_Load_Balancing_example.pdf

!< *OOOEerro_admError* definition.
MODULE OOOEerro_admError
!< *OOOEerro_admError* definition.

USE OOOGglob_Globals

IMPLICIT NONE
!___________________________________________________________
!
PRIVATE
!
PUBLIC :: OOOEerroc_AddObject
!___________________________________________________________
!
TYPE, PUBLIC :: OOOEerroc_colError
  !< Errors handler class.
  PRIVATE
  !
END TYPE OOOEerroc_colError
!___________________________________________________________

CONTAINS
!
!___________________________________________________________
!
SUBROUTINE OOOEerroc_AddObject (Collection, chrErrorDescription, &
  intErrorType)
  TYPE (OOOEerroc_colError),           INTENT(INOUT) :: Collection          !< Error collection.
  CHARACTER(KIND=OOOGglob_kcha,LEN=*), INTENT(IN)    :: chrErrorDescription !< Error description.
  INTEGER(KIND=OOOGglob_kint),         INTENT(IN)    :: intErrorType        !< Error code.
  CHARACTER(KIND=OOOGglob_kcha,LEN=OOOGglob_Len200)  :: chrSelection        !< Dummy string for handling user's input.
  !< Handle errors occurrence.
  !<
  !< @note Prompt user for errors-handling choice.
  !
  !
Write(*,*) "CurrentProc: ", OOOGglob_chrCurrentProcedure
!
write(*,*) "ErrDescr: ", TRIM(chrErrorDescription)
!
write(*,*)  "ErrTyp: ", intErrorType
!
Write(*,*)
Write(*,*) "CallingProc: ", TRIM(OOOGglob_chrCallingProcedure)
!
Write(*,*) "ReturningProc: ", TRIM(OOOGglob_chrReturningProcedure)
!
PRINT *
Write(*,*) "     *** An error occured ! *** "
PRINT *, ' Please select: '
PRINT *
PRINT *, ' x  - Exit Program, or'
PRINT *, ' c  - Continue Execution'
PRINT *
!
PRINT *, ' -> '
READ *, chrSelection
PRINT *
chrSelection = TRIM(chrSelection)
SELECT CASE (chrSelection)
  CASE ('x', 'X')
  !
      ERROR STOP ! end of execution
  !
END SELECT
!
END SUBROUTINE OOOEerroc_AddObject
!___________________________________________________________
!
END MODULE OOOEerro_admError
