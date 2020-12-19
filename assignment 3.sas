data assign3;
set STUPIDRATIO;
lagemratio2= lag2(EMRATIO_CHG);
lagemratio4= lag4(EMRATIO_CHG);

PROC AUTOREG data=assign3;
model TDSP_CHG = lagemratio2 lagemratio4/ nlag=(1) method=ml;
run;
