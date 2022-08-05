# Calculating Excess M1 Balances by Deflating M1 by Consumer Price Indices (CPI) in STATA

This hsows how to determine Excess M1 balances: 

Determined by deflating M1 (IFS line 34) by consumer prices (IFS line 64) and then subtracting an estimated demand for money from it. 

The demand for money, in turn, is estimated from a regression of real M1 balances on real GDP, consumer price inflation, and a linear time trend.


The illustration is made in ference to the following article: https://www.researchgate.net/publication/256667285_Assessing_Indicators_of_Currency_Crisis_in_Ethiopia_Signals_Approach

The data used in this study was gathered from the IMF’s International Financial Statistics (IFS)

![image](https://user-images.githubusercontent.com/74916045/183055451-ce5bdcd2-0e51-4272-bd31-83edd874c305.png)


## Stata Codes Used in Analysis
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

## Data Files for the Analysis

1. Real M1.xlsx ------------------This is the original data used for analysis  
2. Calculating Excess M1.log------The STATA .log file of codes used in the analysis
3. Calculating Excess M1.do----------The STATA .do file of codes used in the analysis
4. Excess M1 Data Output.dta---------The Data Output
