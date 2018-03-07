library(stringr)
ufo<-read.csv('ufo-complete-geocoded-time-standardized.csv',header = FALSE)
ufo[1:10]
colnames(ufo)<-c("datetime","city","state","country","shape","duration_seconds","duration_hours.min","comments","date.posted","latitude","longitude")
summary(ufo)
levels(ufo$state)
sum(is.na(ufo$state))
levels(ufo$country)
sum(is.na(ufo$state))
summary(ufo[ufo$state!=''&ufo$country!='',"country"])
cl<-ufo[,-9]

b<-c()
for(i in 1:ncol(cl)){
  if(class(cl[,i])!='numeric'&class(cl[,i])!='integer'){
    cl[,i]=as.character(cl[,i])
    b<-append(b,i)}
}
cl[,b]<-sapply(cl[,b],str_trim)
is.na(cl)<-cl==''
cl<-cl[complete.cases(cl[,c('datetime','state','country','latitude','longitude')]),]

write.csv(cl,file = 'ufos.csv',row.names=FALSE)

cl<-read.csv('ufos.csv')
summary(cl)
cl$datetime<-as.character(cl$datetime)
summary(nchar(cl$datetime))
cl[nchar(cl$datetime)==14,'datetime'][1:20]
cl$datetime[472] # 24:00 is not recognized in some software, such as Tableau
cl$state<-toupper(cl$state)
cl$city<-str_to_title(cl$city)

colnames(cl)
cl<-cl[,-c(4,7,8)]
levels(cl$duration_seconds)
cl$duration_seconds<-gsub("[^0-9.]", "", cl$duration_seconds)
summary(cl$duration_seconds)
is.na(cl$duration_seconds)<-cl$duration_seconds=='0'
is.na(cl$duration_seconds)<-cl$duration_seconds==''

cl<-cl[cl$country=='us',]
cl$ID<-1:nrow(cl)
write.csv(cl,file = 'ufos.csv',row.names=FALSE)