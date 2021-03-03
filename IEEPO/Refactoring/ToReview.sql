
select DISTINCT RFC,PNOMBRE NOMBRE, A.CURP,B.QnApli QNAPLIACEP,B.Concep,B.IMPORTE,B.DESDE,B.Hasta,B.FOLIO,B.TIP_MOV,B.NUM_QNAS,
C.QnApli QNAPLIRECH,C.Concep,C.IMPORTE,C.DESDE,C.Hasta,C.FOLIO,C.TIP_MOV,C.NUM_QNAS,RAZONRECHAZO
 from siahoy A
LEFT JOIN Deducsfijas_Aceptados B ON substring(A.RFC,1,10)=substring(B.Filiacion,1,10) AND B.Concep='03' 
LEFT JOIN DeducsFijas_Rechazos C ON  substring(A.RFC,1,10)=substring(C.Filiacion,1,10) AND C.CONCEP='03' 
and c.QNAPLI<=b.hasta and c.QNAPLI>=b.Desde
where substring(A.rfc,1,10) in
('MORV850218','SAJJ700308')

