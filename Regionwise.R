#Region wise
data=read.csv(file.choose())
data=na.omit(data)
data
library(dplyr)
#WEST
WEST_Zones = data %>% filter(State.Codes %in% c("RJ","MP","DN","GJ","MH","GA"))
WEST_Zones
wh=rbind(WEST_Zones$Deceased,WEST_Zones$Hospitalized,WEST_Zones$Recovered)
wh
a=WEST_Zones$State.Codes
a
par(mfrow=c(2,2))
barplot(height=wh,names.arg=a,beside=T, col=c("red","yellow","green"),yaxt="n",main="West Zone States")
axis(side=2,at=seq(0,15000,500))
par(mfrow=c(1,1))
#SOUTH
SOUTH_Zones = data %>% filter(State.Codes %in% c("AP","KA","KL","TN","PY","AN"))
SOUTH_Zones
sh=rbind(SOUTH_Zones$Deceased,SOUTH_Zones$Hospitalized,SOUTH_Zones$Recovered)
barplot(height=sh,names.arg=SOUTH_Zones$State.Codes,beside=T, col=c("red","yellow","green"),yaxt="n",main="South Zone states")
axis(side=2,at=seq(0,80000,1000))
#NORTH
NORTH_Zones = data %>% filter(State.Codes %in% c("JK","HP","PB","CH","UT","HR","DL","UP"))
NORTH_Zones
nh=rbind(NORTH_Zones$Deceased,NORTH_Zones$Hospitalized,NORTH_Zones$Recovered)
barplot(height=nh,names.arg=NORTH_Zones$State.Codes,beside=T, col=c("red","yellow","green"),yaxt="n",main="North Zone Sates")
axis(side=2,at=seq(0,8000,500))
#EAST
EAST_Zones = data %>% filter(State.Codes %in% c("BR","SK","AR","NL","MN","TR","ML","AS","WB","JH","OR","CT"))
EAST_Zones
eh=rbind(EAST_Zones$Deceased,EAST_Zones$Hospitalized,EAST_Zones$Recovered)
barplot(height=eh,names.arg=EAST_Zones$State.Codes,beside=T, col=c("red","yellow","green"),yaxt="n",main="East Zone States")
axis(side=2,at=seq(0,12000,500))

#Pie Chart
#Deceased
death=c(sum(WEST_Zones$Deceased),sum(EAST_Zones$Deceased),sum(NORTH_Zones$Deceased),sum(SOUTH_Zones$Deceased))
label=c("WEST","EAST","NORTH","SOUTH")
pie(death,label,col=c("Yellow","Green","Pink","Grey"),main="Total pateints deceased in the respective zones of India")

#Recovered
rec=c(sum(WEST_Zones$Recovered),sum(EAST_Zones$Recovered),sum(NORTH_Zones$Recovered),sum(SOUTH_Zones$Recovered))
label=c("WEST","EAST","NORTH","SOUTH")
pie(rec,label,col=c("Yellow","Green","Pink","Grey"),main="Total pateints recovered in the respective zones of India")

#Hospitalized
hosp=c(sum(WEST_Zones$Hospitalized),sum(EAST_Zones$Hospitalized),sum(NORTH_Zones$Hospitalized),sum(SOUTH_Zones$Hospitalized))
label=c("WEST","EAST","NORTH","SOUTH")
pie(hosp,label,col=c("Yellow","Green","Pink","grey"),main="Total pateints hospitalized in the respective zones of India")
