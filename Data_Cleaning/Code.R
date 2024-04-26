library(lubridate)

source("C:/Users/Keitaro Ninomiya/Box/REAL/IAR/Data_Cleaning/Adjustment/Code.R")
source("C:/Users/Keitaro Ninomiya/Box/REAL/IAR/Data_Cleaning/GraphNum/Code.R")

IndexData=read.csv("C:/Users/Keitaro Ninomiya/Box/REAL/IAR/Esteban index/monthly report/OPENindex_REAL.csv")
PriceData=read.csv("C:/Users/Keitaro Ninomiya/Box/REAL/IAR/Working Folder/sales/OPENprice.csv")
SalesData=read.csv("C:/Users/Keitaro Ninomiya/Box/REAL/IAR/Working Folder/sales/OPENsales.csv")
ForeCData=read.csv("C:/Users/Keitaro Ninomiya/Box/REAL/IAR/Working Folder/sales/OPENfratio.csv")
PendHData=read.csv("C:/Users/Keitaro Ninomiya/Box/REAL/IAR/Working Folder/pending/OPENpending.csv")
ForeIData=read.csv("C:/Users/Keitaro Ninomiya/Box/REAL/IAR/Foreclosure report(till sep)/new data_xian/in_out_inventory.csv")

IndexData = Adjustment(Current_Date,IndexData,"Index")
PriceData = Adjustment(Current_Date,PriceData,"Price")
SalesData = Adjustment(Current_Date,SalesData,"Sales")
ForeCData = Adjustment(Current_Date,ForeCData,"ForeC")
PendHData = Adjustment(Current_Date,PendHData,"Pend")
ForeIData = Adjustment(Current_Date,ForeIData,"ForeI")
print("Adjustment is done!!")
