data assign2;
set FEDCURTAX2;
ff_linear=FEDCURTAX2;
run;

proc esm data=assign2 out=fcstqtr4 lead=4;
id date interval=quarter; 

forecast ff_linear/model=linear;

proc print data=fcstqtr4; 
run;

proc arima data=FEDCURTAX2;
identify var=FEDCURTAX2 Stationarity=(adf=(1));
run;

proc arima data=FEDCURTAX2;
identify var=FEDCURTAX2(1) Stationarity=(adf=(1));
run;

proc arima data=FEDCURTAX2;
identify var=FEDCURTAX2(1) Stationarity=(adf=(1));
estimate p=(2,7,12,13);
forecast lead=4;
run;
