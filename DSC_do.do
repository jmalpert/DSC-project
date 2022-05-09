********************Table 1*************************************
gen log_GDP=log(GDP)
gen log_GNI=log(GNI)
gen log_PCE=log(PCE)
gen lag_GDP = L.log_GDP
gen lag_GNI = L.log_GNI
gen lag_PCE = L.log_PCE
gen FDifflog_GDP = d.log_GDP
gen FDifflog_GNI = d.log_GNI
gen FDifflog_PCE = d.log_PCE
sum
*********************Figure 1**********************************
twoway (scatter log_GDP Gini, mcolor(gold)) (scatter log_GNI Gini, mcolor(purple)) (scatter log_PCE Gini, mcolor(lavender))
*********************Table 2************************************
tsset year
newey FDifflog_GDP Gini inflation lag_GDP, lag(1)
newey FDifflog_GNI Gini inflation lag_GNI, lag(1)
newey FDifflog_PCE Gini inflation lag_PCE, lag(1)
dfuller GDP, lags(1)
dfuller GNI, lags(1)
dfuller PCE, lags(1)