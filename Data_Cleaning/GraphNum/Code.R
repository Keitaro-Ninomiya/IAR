SaleRate=function(ILC,ILP,CHC,CHP){
  df=tibble("Date"=c(Current_Date%m-%months(1),Current_Date),
            "IL"=c(ILC,ILP),
            "CH"=c(CHC,CHP))
  return(df)
}
