library(lubridate)
Current_Date=ymd("2023/01/01")
Month="January"
PreMonth="December"
Year=2023

source("C:/Users/Keitaro Ninomiya/Box/IAR_nino/Data_Cleaning/Adjustment/Code.R")
source("C:/Users/Keitaro Ninomiya/Box/IAR_nino/Data_Cleaning/GraphNum/Code.R")

IndexData=read.csv("C:/Users/Keitaro Ninomiya/Box/IAR_nino/Esteban index/monthly report/OPENindex_REAL.csv")
PriceData=read.csv("C:/Users/Keitaro Ninomiya/Box/IAR_nino/Working Folder/sales/OPENprice.csv")
SalesData=read.csv("C:/Users/Keitaro Ninomiya/Box/IAR_nino/Working Folder/sales/OPENsales.csv")
ForeCData=read.csv("C:/Users/Keitaro Ninomiya/Box/IAR_nino/Working Folder/sales/OPENfratio.csv")
PendHData=read.csv("C:/Users/Keitaro Ninomiya/Box/IAR_nino/Working Folder/pending/OPENpending.csv")
ForeIData=read.csv("C:/Users/Keitaro Ninomiya/Box/IAR_nino/Foreclosure report(till sep)/new data_xian/in_out_inventory.csv")

IndexData = Adjustment(Current_Date,IndexData,"Index")
PriceData = Adjustment(Current_Date,PriceData,"Price")
SalesData = Adjustment(Current_Date,SalesData,"Sales")
ForeCData = Adjustment(Current_Date,ForeCData,"ForeC")
PendHData = Adjustment(Current_Date,PendHData,"Pend")
ForeIData = Adjustment(Current_Date,ForeIData,"ForeI")
print("Adjustment is done!!")
