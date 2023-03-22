df = read.csv("mtcars.csv")
View(df)
str(df) #Gives structure of the dataframe
dim(df) #Get Dimension of dataframe
names(df) #gives column names as vector
row.names(df) = df$model #assign variable name as row name 
row.names(df)
df= df[,-1]
library("dplyr")
#SELECT FUNCTION
#dh1 = select(df, mpg:hp)
df1 = df %>% select(mpg:hp)
View(df1)
df1 = df %>% select(c(mpg,hp, wt))
View(df1)
##FILTER FUNCTION
df1 = df %>% filter(gear==4 |mpg>20) %>% select(c(mpg,hp,wt,gear))
View(df1)
##ARRANGE FUNCTION
df1 = df %>% arrange(cyl, desc(mpg))
View(df1)
#RENAME FUNCTION
df1 = df %>% rename(MilesPerGallon = mpg, Displacement = disp)
View(df1)
#MUTATE FUNCTION
df1 = df %>% mutate(Power = hp*wt)
View(df1)
#GROUP BY AND SUMMARISE FUNCTION
df$cyl = as.factor(df$cyl)
df1 = df %>% group_by(df$cyl) %>% summarise(n=n(), mean_mpg = mean(mpg))
View(df1)

# group df by year and summarise meanofmpg, dispacemnet, weight
df$gear = as.factor(df$gear)
df1 = df %>% group_by(df$gear) %>% summarise(n=n(), mean_mpg = mean(mpg), mean_disp = mean(disp), mean_wt = mean(wt))
View(df1)

#DataVisualization
#Histogram
hist(df$mpg) #Gives histogram graph for the specified column
hist(df$mpg, main="Histogram of MPG(mtcars)", col="lightgreen", border="darkorange", xlab="Miles per Gallon") #Main is for title, col for colour, border is for border color and xlab is used to set label for x-axis

#Barplot
df$cyl=as.factor(df$cyl)
table(df$cyl)
barplot(table(df$cyl))

#BoxPlot
summary(df$mpg)
boxplot(df$mpg)

#Scatterplot
plot(df$mpg~df$disp) #df$mpg~df$disp means => The effect of Displacement on MPG