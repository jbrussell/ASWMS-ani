      SUBROUTINE GAUSLV(R1,R2,IQ,FINT,NINT)
c
c23456789012345678901234567890123456789012345678901234567890123456789012
c
C*** FIFTH ORDER GAUSS-LEGENDRE INTEGRATION ***
c
c    calls: INTGDS
c
      IMPLICIT REAL*8(A-H,O-Z)
c
      SAVE
      DIMENSION FINT(1),VALS(4),VALS1(4),SUM(4),W(2),X(2)
      DATA W,X/.478628670499366D0,.236926885056189D0,
     +         .538469310105683D0,.906179845938664D0/
      DATA VALS/4*0.D0/,VALS1/4*0.D0/,SUM/4*0.D0/
c
      Y1=.5D0*(R2+R1)
      Y2=.5D0*(R2-R1)
c
      CALL INTGDS(Y1,IQ,VALS)
c
      DO 5 J=1,NINT
    5 SUM(J)=.568888888888889D0*VALS(J)
      DO 10 I=1,2
      T1=X(I)*Y2
c
      CALL INTGDS(Y1+T1,IQ,VALS)
      CALL INTGDS(Y1-T1,IQ,VALS1)
c
      DO 10 J=1,NINT
   10 SUM(J)=SUM(J)+W(I)*(VALS(J)+VALS1(J))
      DO 15 J=1,NINT
   15 FINT(J)=FINT(J)+Y2*SUM(J)
c
      RETURN
      END
