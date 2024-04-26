library(dplyr)
library(hms)
library(lubridate)

Adjustment=function(Current_Date,Data,Type){
  if(Type %in% c("ForeC","Pend")){
    DateSequence=seq(ymd("2008/01/01"),Current_Date,"months")
    
    DataC=Data %>%
      cbind(.,DateSequence) %>%
      rename(Date=DateSequence) %>%
      relocate(Date)
  }
  if(Type=="ForeI"){
    DateSequence=seq(ymd("2006/01/01"),Current_Date,"months")
    DataC=Data %>%
      cbind(.,DateSequence) %>%
      rename(Date=DateSequence) %>%
      relocate(Date)
  }
  if(Type %in% c("Sales","Price","Index")){
    Date_Col=Current_Date %m+% months(3)
    DateSequence=seq(ymd("2008/01/01"),Date_Col,"months")
    Data=Data %>%
      cbind(.,DateSequence) %>%
      rename(Date=DateSequence) %>%
      relocate(Date)
  }
  
  if (Type=="Sales"){
    Data=Data %>%
      mutate(MGrowthIL=(IL.forecast_SIL-lag(IL.forecast_SIL))/lag(IL.forecast_SIL) *100,
             AGrowthIL=(IL.forecast_SIL-lag(IL.forecast_SIL,12))/lag(IL.forecast_SIL,12) *100,

             MGrowthCH=(CH.forecast_SCH-lag(CH.forecast_SCH))/lag(CH.forecast_SCH) *100,
             AGrowthCH=(CH.forecast_SCH-lag(CH.forecast_SCH,12))/lag(CH.forecast_SCH,12) *100,
             
             MGrowthIL_UB=MGrowthIL*1.15,
             MGrowthIL_LB=MGrowthIL*0.85,
             MGrowthCH_UB=MGrowthCH*1.15,
             MGrowthCH_LB=MGrowthCH*0.85,
             
             AGrowthIL_UB=AGrowthIL*1.15,
             AGrowthIL_LB=AGrowthIL*0.85,
             AGrowthCH_UB=AGrowthCH*1.15,
             AGrowthCH_LB=AGrowthCH*0.85,
             
             TAGrowthIL=(IL.forecast_SIL+lag(IL.forecast_SIL,1)+lag(IL.forecast_SIL,2))/(lag(IL.forecast_SIL,12)+lag(IL.forecast_SIL,13)+lag(IL.forecast_SIL,14))-1,
             TAGrowthCH=(CH.forecast_SCH+lag(CH.forecast_SCH,1)+lag(CH.forecast_SCH,2))/(lag(CH.forecast_SCH,12)+lag(CH.forecast_SCH,13)+lag(CH.forecast_SCH,14))-1,

             TAGrowthIL_UB=1.15*TAGrowthIL,
             TAGrowthIL_LB=0.85*TAGrowthIL,

             TAGrowthCH_UB=1.15*TAGrowthCH,
             TAGrowthCH_LB=0.85*TAGrowthCH,

             TMGrowthIL=(IL.forecast_SIL+lag(IL.forecast_SIL,1)+lag(IL.forecast_SIL,2))/(lag(IL.forecast_SIL,1)+lag(IL.forecast_SIL,2)+lag(IL.forecast_SIL,3))-1,
             TMGrowthCH=(CH.forecast_SCH+lag(CH.forecast_SCH,1)+lag(CH.forecast_SCH,2))/(lag(CH.forecast_SCH,1)+lag(CH.forecast_SCH,2)+lag(CH.forecast_SCH,3))-1,

             TMGrowthIL_UB=1.15*TMGrowthIL,
             TMGrowthIL_LB=0.85*TMGrowthIL,

             TMGrowthCH_UB=1.15*TMGrowthCH,
             TMGrowthCH_LB=0.85*TMGrowthCH
             )
    return(Data)

  }
  if (Type=="Price"){
    Data=Data %>%
      mutate(MGrowthIL=(forecast_IL-lag(forecast_IL))/lag(forecast_IL) *100,
             AGrowthIL=(forecast_IL-lag(forecast_IL,12))/lag(forecast_IL,12) *100,

             MGrowthCH=(forecast_CH-lag(forecast_CH))/lag(forecast_CH) *100,
             AGrowthCH=(forecast_CH-lag(forecast_CH,12))/lag(forecast_CH,12) *100,

             TAGrowthIL=(forecast_IL+lag(forecast_IL,1)+lag(forecast_IL,2))/(lag(forecast_IL,12)+lag(forecast_IL,13)+lag(forecast_IL,14))-1,
             TAGrowthCH=(forecast_CH+lag(forecast_CH,1)+lag(forecast_CH,2))/(lag(forecast_CH,12)+lag(forecast_CH,13)+lag(forecast_CH,14))-1,

             TAGrowthIL_UB=1.15*TAGrowthIL,
             TAGrowthIL_LB=0.85*TAGrowthIL,

             TAGrowthCH_UB=1.15*TAGrowthCH,
             TAGrowthCH_LB=0.85*TAGrowthCH,

             TMGrowthIL=(forecast_IL+lag(forecast_IL,1)+lag(forecast_IL,2))/(lag(forecast_IL,4)+lag(forecast_IL,5)+lag(forecast_IL,6))-1,
             TMGrowthCH=(forecast_CH+lag(forecast_CH,1)+lag(forecast_CH,2))/(lag(forecast_CH,4)+lag(forecast_CH,5)+lag(forecast_CH,6))-1,

             TMGrowthIL_UB=1.15*TMGrowthIL,
             TMGrowthIL_LB=0.85*TMGrowthIL,

             TMGrowthCH_UB=1.15*TMGrowthCH,
             TMGrowthCH_LB=0.85*TMGrowthCH
             )
    
    Data=left_join(Data,IndexData,by=c("Date","forecast_IL","forecast_CH","CH_price","IL_price")) %>%
      mutate(AIndexIL=forecast_IL/lag(forecast_IL,12)-1,
             AIndexCH=forecast_CH/lag(forecast_CH,12)-1
             )

    return(Data)

  }
  if(Type=="ForeC"){
    DataC=DataC %>%
      mutate(Regular_Sale=all-fhistory,
             RS_MGrowth=(Regular_Sale-lag(Regular_Sale))/lag(Regular_Sale) *100,
             RS_AGrowth=(Regular_Sale-lag(Regular_Sale,12))/lag(Regular_Sale,12) *100,

             ForeCProp=fhistory,
             FCP_MGrowth=(ForeCProp-lag(ForeCProp))/lag(ForeCProp) *100,
             FCP_AGrowth=(ForeCProp-lag(ForeCProp,12))/lag(ForeCProp,12) *100,

             MedianPrice=mpricereg,
             MP_MGrowth=(MedianPrice-lag(MedianPrice))/lag(MedianPrice) *100,
             MP_AGrowth=(MedianPrice-lag(MedianPrice,12))/lag(MedianPrice,12) *100,

             MedianPrice_FC=mpricef,
             MPFC_MGrowth=(MedianPrice_FC-lag(MedianPrice_FC))/lag(MedianPrice_FC) *100,
             MPFC_AGrowth=(MedianPrice_FC-lag(MedianPrice_FC,12))/lag(MedianPrice_FC,12) *100,

             )
    return(DataC)

  }
  if(Type=="Pend"){
    YearSumIL=DataC %>%
      filter(Date>=ymd("2019/01/01") & Date<=ymd("2019/12/31")) %>%
      select(IL) %>% as.list()
    YearSumIL = mean(YearSumIL$IL)

    YearSumCH=DataC %>%
      filter(Date>=ymd("2019/01/01") & Date<=ymd("2019/12/31")) %>%
      select(Chi) %>% as.list()
    YearSumCH = mean(YearSumCH$Chi)

    DataC=DataC %>%
      mutate(ILpending=100*IL/YearSumIL,
             CHpending=100*Chi/YearSumCH,

             pendingGrowthIL=(ILpending-lag(ILpending,12))/lag(ILpending,12) *100,
             pendingGrowthCH=(CHpending-lag(CHpending,12))/lag(CHpending,12) *100
             )
    return(DataC)
  }
  if(Type=="Index"){
    Data=Data %>%
      mutate(GrowthIL=forecast_IL/lag(forecast_IL,12)-1,
             GrowthCH=forecast_CH/lag(forecast_CH,12)-1)
    return(Data)
  }
  if(Type=="ForeI"){
    return(DataC)
  }
  else{
  }
}
