
library(zoo)

clean <- read.csv("~/DataClean.csv",header = TRUE)
clean$Area <- sub("^$", NA, clean$Area)
clean$Area <- na.locf(clean$Area)


clean$Street <- str_replace_all(clean$Street,"????"," ")
clean$Street.2 <- str_trim(clean$Street.2)


