data mod3;
set Assign3;
RGDP = EMRATIO_CHG PAYEMS_CHG;
run;

proc arima data=Assign3;
identify var=RGDP(1) Stationarity=(adf=(1));
run;

proc arima data=Assign3;
identify var=RGDP(1) stationarity=(adf=(1));
estimate p=(1 2 3 4); 
forecast lead=4;
run;

