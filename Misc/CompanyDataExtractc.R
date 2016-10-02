library(quantmod)
library(XML)
setwd("C:/Users/Anuranjan-PC/Documents/R/R Projects/Company Data")

## Read data


CompanyList=read.csv("CompanyList.csv")

getdata <- function(urlstr,cmp,cmptyp){
 # print("inside getdata")
  rawPMI <<- readHTMLTable(urlstr)
  rawPMI <<- as.data.frame(rawPMI[2])
  rawPMIt <- as.data.frame(t(rawPMI))
  names(rawPMIt) <-  as.vector(rawPMI[, 1])
  rawPMIt[,1] <- NULL
  rawPMIt=rawPMIt[2:6,]
  rawPMIt$Company <- rep(cmp,5)
  rawPMIt$Company_Type <- rep(cmptyp,5)
  rawPMIt$Year <- c("2016","2015","2014","2013","2012")
  rownames(rawPMIt) <- NULL
  ##CompDataSet <- rawPMIt
  CompDataSet<<-rbind(CompDataSet, rawPMIt)

}
CompDataSet=data.frame()
for (i in 1:nrow(CompanyList)){
 urlstr=paste('http://economictimes.indiatimes.com/',CompanyList[i,1], '/profitandlose/companyid-',CompanyList[i,2],'.cms',sep = "")
 print(urlstr)
  print(i)
  PnLDataset <<- getdata(urlstr,CompanyList[i,1],CompanyList[i,3])

}
CompDataSet=data.frame()
for (i in 1:nrow(CompanyList)){
 urlstr=paste('http://economictimes.indiatimes.com/',CompanyList[i,1], '/balancesheet/companyid-',CompanyList[i,2],'.cms',sep = "")
  #  print(urlstr)
print(i)
BalSheetDataset <<- getdata(urlstr,CompanyList[i,1],CompanyList[i,3])
}

CompDataSet=data.frame()
for (i in 1:nrow(CompanyList)){

 urlstr=paste('http://economictimes.indiatimes.com/',CompanyList[i,1], '/cashflow/companyid-',CompanyList[i,2],'.cms',sep = "")
print(i)
CashFlowSheet <<- getdata(urlstr,CompanyList[i,1],CompanyList[i,3])
}
