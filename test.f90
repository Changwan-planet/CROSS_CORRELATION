PROGRAM test
USE md_cross_correlation

IMPLICIT NONE



INTEGER, PARAMETER :: S = 4096
!INTEGER, PARAMETER :: lag = 2000
REAL*8, DIMENSION(0:S-1) :: x
REAL*8, DIMENSION(0:S-1) :: h
REAL*8, DIMENSION(0:2*S) :: crrl

REAL*8 :: pi = ACOS(-1.0)

INTEGER :: f, t, i


OPEN(10, FILE = "/home/changwan/GPR/A_SCOPE_GPR.txt", STATUS="OLD", FORM="FORMATTED", ACTION="READ")

OPEN (20, FILE = "/home/changwan/CROSS_CORRELATION/x_h_signal.txt",  STATUS="REPLACE",ACTION="WRITE")
 OPEN (21, FILE =  "/home/changwan/CROSS_CORRELATION/crrl_output.txt",  STATUS="REPLACE",  ACTION="WRITE")


!read the RAW gpr data
READ(10,*) x
 x=x-SUM(x)/SIZE(x)
 PRINT*, SUM(x)/SIZE(x)
  DO i = 0,S-1
     PRINT*, x(i)
  END DO

!make a simple signal
f = 1

!DO t=0, S-1
!   x(t) = COS(2*pi*f*t/(S-1))
!END DO


!DO t=0, S-1
!   h(t) = SIN(2*pi*f*t/(S-1))
!END DO


CALL cross_corl(x,x,S,crrl)


DO i=0,S-1
   WRITE(20,*)  x(i), x(i)
END DO

DO i=-0,2*S
   WRITE(21,*) crrl(i)
END DO

END PROGRAM 
