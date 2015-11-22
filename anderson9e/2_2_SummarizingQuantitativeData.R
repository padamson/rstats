library(data.table)

table2_5<-read.xlsx("./anderson9edata/Excel Files/Ch 02 Descriptive/Audit.xls",1,colIndex = 1)
table2_5$Audit.Time

auditTime<-table2_5$Audit.Time
minClassValue<-10
maxClassValue<-35
widthOfClasses<-5
breaks = seq(minClassValue,maxClassValue,by=widthOfClasses)
auditTime.cut = cut(auditTime,breaks, right=FALSE)
table2_6<-as.data.frame(table(auditTime.cut))
names(table2_6)<-c("audittime","frequency")
table2_6

table2_7<-mutate(table2_6,
                 relativefrequency=frequency/sum(table2_6$frequency),
                 percentfrequency=relativefrequency*100)
table2_7

#the equivalent to dot plot in R is the stripchart
stripchart(table2_5$Audit.Time,method="stack",offset=1.25,xlab="Audit Time (days)",frame.plot = FALSE,xlim=c(10,35))

barplot(table2_6$frequency,names.arg=table2_6$audittime, axis.lty=0, xlab="Audit Time (days)", ylab="Frequency", ylim=c(0,8),plot=TRUE,space=c(0))

table2_8<-data.frame(cumsum(table(auditTime.cut)))
setDT(table2_8, keep.rownames = TRUE)[]
names(table2_8)<-c("audittime","cumfreq")
table2_8<-mutate(table2_8,
                 cumrelfreq=cumfreq/sum(table2_6$frequency),
                 cumpercentfreq=cumrelfreq*100)
table2_8

cumfreq0<-c(0,table2_8$cumfreq)
plot(breaks,cumfreq0,xlab="Audit Time (days)",ylab="Cumulative Frequency",xlim=c(0,35))
lines(breaks,cumfreq0)
     