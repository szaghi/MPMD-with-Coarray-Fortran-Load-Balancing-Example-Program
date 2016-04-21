! This file is part of:
! MPMD with Coarray Fortran Load Balancing – Example Program
! copyright 2016 by Michael Siehl
! www.mpmd-with-coarray-fortran.de
! http://www.mpmd-with-coarray-fortran.de/MPMD_Load_Balancing_example.pdf

!< Definition of global parameters/variables.
MODULE OOOGglob_Globals
!< Definition of global parameters/variables.

  IMPLICIT NONE
  PUBLIC
  !> Application Main Directory Path:
  CHARACTER(KIND=1,LEN=240) :: OOOGglob_chrAppPath = ''
  !
  ! upper bound declarations for the static components of
  ! derived type coarrays:
  INTEGER, PARAMETER :: OOOGglob_TeamManagers_UpperBound = 5 !< max number of TeamManagers
  INTEGER, PARAMETER :: OOOGglob_TeamMembers_UpperBound = 10 !< max number of TeamMembers per team
  INTEGER, PARAMETER :: OOOGglob_NumImages_UpperBound = 100  !< max number of images
  !
  !********************************************************
  !********************************************************
  ! Stack Trace:
  CHARACTER(KIND=1,LEN=35), DIMENSION (1:50) :: OOOGglob_chrStackTrace !< Stack trace.
  INTEGER(KIND=4) :: OOOGglob_intStackTraceCounter = 0                 !< Stack trace counter.
  !
  !********************************************************
  !********************************************************
  ! KIND values:
  INTEGER, PARAMETER :: OOOGglob_kint = 4       !< KIND for INTEGER
  INTEGER, PARAMETER :: OOOGglob_krea = 4       !< KIND for REAL
  INTEGER, PARAMETER :: OOOGglob_kcom = 4       !< KIND for COMPLEX
  INTEGER, PARAMETER :: OOOGglob_klog = 4       !< KIND for LOGICAL
  INTEGER, PARAMETER :: OOOGglob_kcha = 1       !< KIND for CHARACTER, 1=ASCII
  INTEGER, PARAMETER :: OOOGglob_Len40 = 40     !< LEN for CHARACTER
  INTEGER, PARAMETER :: OOOGglob_Len200 = 200   !< LEN for CHARACTER
  INTEGER, PARAMETER :: OOOGglob_Len240 = 240   !< LEN for CHARACTER
  INTEGER, PARAMETER :: OOOGglob_Len2400 = 2400 !< LEN for CHARACTER
  !
  !**********************************************************
  ! Input/Output-constants
  ! FILE UNITs:
  INTEGER(KIND=4), PARAMETER :: OOOGglob_FileUnitA = 1 !< File unit A.
  INTEGER(KIND=4), PARAMETER :: OOOGglob_FileUnitB = 2 !< File unit B.
  ! for Tracing und Error-Handling:
  INTEGER(KIND=4), PARAMETER :: OOOGglob_TracingFileUnit = 3     !< Trace file unit.
  INTEGER(KIND=4), PARAMETER :: OOOGglob_StackTraceFileUnit = 4  !< Stack trace file unit.
  INTEGER(KIND=4), PARAMETER :: OOOGglob_ErrorLogFileUnit = 7    !< Error log file unit.
  !
  !**********************************************************
  ! Error-Handling
  CHARACTER(KIND=1,LEN=40) :: OOOGglob_chrCurrentProcedure = "Main" !< Error-handling, current procedure name.
  CHARACTER(KIND=1,LEN=40) :: OOOGglob_chrCallingProcedure = "User" !< Error-handling, calling procedure name.
  CHARACTER(KIND=1,LEN=40) :: OOOGglob_chrReturningProcedure = ''   !< Error-handling, returning procedure name.
  CHARACTER(KIND=1,LEN=40) :: OOOGglob_chrTempCallingProcedur = ''  !< Error-handling, temporary calling procedure name.

  !**********************************************************
  ! Error-Handling
  REAL(KIND=4) :: OOOGglob_reaNaN              !< Error-handling, real NaN occurrence.
  REAL(KIND=4) :: OOOGglob_reaPositiveInfinity !< Error-handling, real positive infinity occurrence.
  REAL(KIND=4) :: OOOGglob_reaNegativeInfinity !< Error-handling, real negative infinity occurrence.

  !**********************************************************
  ! Error-Handling
  INTEGER(KIND=4), PARAMETER :: OOOGglob_warning = 1     !< Error-handling, *warning* code.
  INTEGER(KIND=4), PARAMETER :: OOOGglob_error = 2       !< Error-handling, *error* code.
  INTEGER(KIND=4), PARAMETER :: OOOGglob_NoErrNumber = 0 !< Error-handling, *not an error* code.
  !

!**********************************************************
CONTAINS

! Public-Subroutines:
!__________________________________________________________

!***********************************************************

SUBROUTINE OOOGglob_subSetProcedures (chrCurrentProcedure)
  !< Error-Handling and Tracing
  CHARACTER(KIND=OOOGglob_kcha,LEN=*), INTENT(IN) :: chrCurrentProcedure !< Current procedure name.
  ! refresh the Stack Trace:
  OOOGglob_intStackTraceCounter = OOOGglob_intStackTraceCounter + 1
  OOOGglob_chrStackTrace (OOOGglob_intStackTraceCounter) = chrCurrentProcedure
  OOOGglob_chrCurrentProcedure = OOOGglob_chrStackTrace (OOOGglob_intStackTraceCounter)
  OOOGglob_chrCallingProcedure = OOOGglob_chrStackTrace (OOOGglob_intStackTraceCounter - 1)
  OOOGglob_chrReturningProcedure = ''
  !
END SUBROUTINE OOOGglob_subSetProcedures
!_____________

SUBROUTINE OOOGglob_subResetProcedures
  !< Error-Handling and Tracing
  ! refresh the Stack Trace:
  OOOGglob_intStackTraceCounter = OOOGglob_intStackTraceCounter - 1
  OOOGglob_chrCurrentProcedure = OOOGglob_chrStackTrace (OOOGglob_intStackTraceCounter)
  OOOGglob_chrReturningProcedure = OOOGglob_chrStackTrace (OOOGglob_intStackTraceCounter + 1)
  IF (OOOGglob_intStackTraceCounter > 1) THEN
    OOOGglob_chrCallingProcedure = OOOGglob_chrStackTrace (OOOGglob_intStackTraceCounter - 1)
  END IF
  !
END SUBROUTINE OOOGglob_subResetProcedures
!__________________________________________________________

!**********************************************************
!**********************************************************
!**********************************************************

END MODULE OOOGglob_Globals
