library(dplyr)
library(tidyr)

getwd()
setwd("C:/Users/whe001/Documents")
clean <- read.csv("~/DataToClean.csv",header = TRUE)
class(clean)
dim(clean)
names(clean)
str(clean)
summary(clean)
glimpse(clean)
head(clean)
tail(clean)

data(mtcars)
mtcars$car <- rownames(mtcars)
mtcars <- mtcars[,c(12,1:11)]
mtcars_gather <- gather(mtcars,attributes,value,-car)
mtcars_spread <- spread(mtcars_gather,attributes,value)



stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocksm <- stocks %>% gather(stock, price, -time)

stocks
stocksm
stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)
stocksm %>% spread(time, price)


date <- as.Date('2017-04-29') + 0:14
hour <- sample(1:24,15)
min <- sample(1:60,15)
second <- sample(1:60,15)

data <- data.frame(date, hour, min, second)

data_unite <- unite(data,datehour,date,hour,sep='')
unite(data_unite,datetime,datehour,min,second)


unite_(mtcars,"vs_am",c("vs","am"))
mtcars %>% 
  unite(vs_am,vs,am) %>% 
  separate(vs_am, c("vs","am"))

install.packages("lubridate")
library(lubridate)
ymd("2017-04-01")
ymd("2017-04-01 UTC")
mdy("April 1,2017")
hms("23:52:19")
ymd_hms("2015/04/01 13.33.09")


install.packages("stringr")
library(stringr)
myString <- "  Harrisburg University of Science and Technology is in Harrisburg,Pennysylvania  "
str_trim(myString)
str_pad(myString, 30,"left")
tolower(myString)
toupper(myString)

rbind(
  str_pad("hadley", 30, "left"),
  str_pad("hadley", 30, "right"),
  str_pad("hadley", 30, "both")
)




myText <- c("I had one apple in the afternoon, and then I sold
             seventy Apple computers at work") 

myPattern <- "[aA]pple"
gsub(myPattern,"orange", myText)

is.na(clean)
any(is.na(clean))
sum(is.na(clean))
which(is.na(clean))
is.na(x) <- which(x == 7)
is.na(x)


mydata1 <- as.data.frame(matrix(c(1:5,NA)),ncol = 2)
mydata2 <- c(99,15,99)

mydata <- cbind(mydata1,mydata2)
mydata

mydata$mydata2[mydata$mydata2 == 99] <- NA
mydata

str(airquality)
x<-airquality[complete.cases(airquality),]
str(x)

x <- na.exclude(airquality)
aq_new <- na.omit(airquality)

sort(airquality$Ozone,na.last = T)
mean(airquality$Ozone,na.rm=T)
table(airquality$Ozone,useNA = "ifany")
table(1:3,useNA = "always")

getwd()
t1 <- read.csv("titanic3.csv",header=T,na.strings ="")
install.packages("Amelia")
library(Amelia)

missmap(t1, main = "Missing Values vs observed")

?zoo
library(zoo)

data(iris)
select(iris,Species)

data(mtcars)
mutate(mtcars,displ_l = disp/61.0237)
filter(mtcars, mpg > mean(mpg))
arrange(mtcars,cyl,disp)


by_cyl <- group_by(mtcars,cyl)
by_vs_am <- group_by(mtcars,vs,am)
group_by(mtcars,vsam = vs + am)

group_by(mtcars,vs2 = vs)
group_by(mtcars,"vs")

?group_by

by_cyl <- group_by(mtcars, cyl)
summarise(by_cyl, mean(disp), mean(hp))
filter(by_cyl, disp == max(disp))

by_vs_am <- group_by(mtcars, vs, am)
by_vs <- summarise(by_vs_am, n = n())
by_vs
summarise(by_vs, n = sum(n))
