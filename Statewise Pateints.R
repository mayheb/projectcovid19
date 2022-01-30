data=read.csv(file.choose())
data=na.omit(data)
attach(data)
data
comb=rbind(Deceased,Hospitalized,Recovered)
comb
name=State.Codes
par(mfrow=c(1,1))
bplot=barplot(height=comb , names=name, col=c("Red","Yellow","Green"),beside=T,yaxt="n",main="Histogram",xlab="States",ylab="Count")
axis(side=2,at=seq(0,80000,1000))
