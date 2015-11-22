library(dplyr)

table2_1<-read.xlsx("./anderson9edata/Excel Files/Ch 02 Descriptive/SoftDrink.xls",1)
table2_1$Brand.Purchased

table2_2<-as.data.frame(table(table2_1$Brand.Purchased))
names(table2_2)<-c("softdrink","frequency")
totalrow2_2<-data.frame(softdrink="Total",frequency=sum(table2_2$frequency))
rbind(table2_2,totalrow2_2)

table2_3<-mutate(table2_2,
                 relativefrequency=table2_2$frequency/sum(table2_2$frequency),
                 percentfrequency=relativefrequency*100)
totalrow2_3<-data.frame(softdrink="Total",
                        frequency=sum(table2_2$frequency),
                        relativefrequency=sum(table2_3$relativefrequency),
                        percentfrequency=sum(table2_3$percentfrequency))
rbind(table2_3,totalrow2_3)[,c(1,3,4)]

barplot(table2_2$frequency,names.arg=table2_2$softdrink, axis.lty=1, xlab="Soft Drink", ylab="Frequency", ylim=c(0,20),plot=TRUE)

table2_3Sorted<-arrange(table2_3,desc(percentfrequency),softdrink)
pieLabels<-paste0(table2_3Sorted$softdrink,"\n",table2_3Sorted$percentfrequency,"%")
pie(table2_3Sorted$relativefrequency,pieLabels,radius=1.0,
    clockwise = TRUE,init.angle=180,col=c("pink","lightblue","khaki","orange","lightgreen"))