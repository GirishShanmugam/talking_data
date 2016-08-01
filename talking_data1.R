unique_categories=sort(unique(cat_count_eachdev$X))
unique_device_id=unique(cat_count_eachdev_test$device_id)

result=data.frame(matrix(NA, nrow = 6735, ncol = 156))

columnnames=c("device_id",category_columns)
colnames(result) = columnnames

result$device_id=unique_device_id

for (i in 1:6735) {
  temp_df=cat_count_eachdev_test[which(cat_count_eachdev_test$device_id==result$device_id[i]),]
  for(j in 1:nrow(temp_df)) {
    result[i,temp_df$X[j]]=temp_df$category[j]
  }
}

result[is.na(result)] <- 0
result = result[category_columns]
entire_set_nanremoved <- read.csv("~/anaconda3/entire_set_nanremoved_train.csv",numerals = 'no.loss',stringsAsFactors = FALSE)
entire_set_nanremoved1 = entire_set_nanremoved1[!duplicated(entire_set_nanremoved1$device_id), ]
entire_set_nanremoved$X=NULL


to_merge =entire_set_nanremoved1[,c(1:6)]

result_bak=result
result= merge(x=result ,y=to_merge ,by=c("device_id"),all.x =TRUE)

twelve_class = result[,c(1:143)]
twelve_class=cbind(twelve_class,result[,c(145)])


twelve_class=cbind(twelve_class,result[,c(146)])
colnames(twelve_class)[144]="is_popular"

colnames(twelve_class)[145]="Group"

write.csv(twelve_class,"~/anaconda3/twelve_class_test.csv")

for( i in 1:28)  {
  coll=paste("result",to_remove[i],sep = '$')
  coll=NULL
}

counts <- table(gender_age_train$age)
barplot(counts, main="Age Distribution") 


