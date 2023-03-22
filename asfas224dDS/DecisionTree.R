titanic = read.csv("train.csv")  
View(titanic)  
dim(titanic) 

library(dplyr)  
clean_titanic = titanic %>% select(-c("Cabin","Ticket","Fare","Name"))  
dim(clean_titanic)  
View(clean_titanic) 
str(clean_titanic)  

clean_titanic = clean_titanic %>% mutate(Pclass=factor(Pclass,levels = c(1,2,3),labels=c("Upper","Middle","Lower")),Survived=factor(Survived,levels = c(0,1),labels = c("Not survived","Survived")))  
View(clean_titanic)  

clean_titanic = na.omit(clean_titanic)  
dim(clean_titanic)  

dt = sort(sample(nrow(clean_titanic),nrow(clean_titanic)* 0.7))  
train_titanic = clean_titanic[dt,] 
test_titanic = clean_titanic[-dt,]  
dim(train_titanic) 
dim(test_titanic) 

library(rpart)  
library(rpart.plot) 
titanic_model = rpart(Survived~.,data = train_titanic,method="class")  
rpart.plot(titanic_model,extra=106) 

predict_unseen = predict(titanic_model,test_titanic,type="class") 
predict_unseen 

library(caret) 
con_mat = confusionMatrix(test_titanic$Survived,predict_unseen) 
con_mat 
