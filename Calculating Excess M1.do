import excel "C:\Users\sam\Desktop\Real M1.xlsx", sheet("Real M1") firstrow
gen Trend=_n
regress RealM1 RGDP Inflation Trend
predict MDemand
twoway (line RealM1 Trend)
twoway (line RealM1 Trend) (line MDemand Trend)
**Defalting M1
** JAN-12 IS THE BASE PERIOD
gen CPI_Index = (CPI/109.06528886801)
gen Def_M1 = (M1/CPI_Index)
twoway (line M1 Trend) (line Def_M1 Trend)
**Calcuating Excess M1
gen Excess_M1 = (Def_M1-MDemand)

