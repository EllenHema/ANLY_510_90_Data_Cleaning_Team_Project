###Updates & Package Installation

install.packages("installr")
require(installr)
updateR()

install.packages("stringr")
library(stringr)
install.packages("zoo")
library(zoo)


###Task1 
#Done by Ellen

#Populate the missing values in the Area variable with an appropriate values 
#(Birmingham, Coventry, Dudley, Sandwell, Solihull, Walsall or Wolverhampton) 

clean <- read.csv("dirty_data.csv",header = TRUE)
clean$Area <- sub("^$", NA, clean$Area)
clean$Area <- na.locf(clean$Area)


###Task2 
#Done by Yimin

#Remove special characters from Street 1 and Street 2
clean$Street <- str_replace_all(clean$Street,"[^[:alnum:]]","")
clean$Street <- str_replace_all(clean$Street,"[^a-zA-Z0-9]"," ")
clean$Street.2 <- str_replace_all(clean$Street.2,"[^[:alnum:]]"," ")

#Remove padding (the white space before and after the text) from Street 1 and Street 2.
clean$Street <- trimws(clean$Street)
clean$Street.2 <- trimws(clean$Street.2)

#Make sure the first letters of street names are capitalized
clean$Street <- tolower(clean$Street)
clean$Street.2 <- tolower(clean$Street.2)

simpleCap <- function(x) 
              {s <- strsplit(x, " ")[[1]]
                paste(toupper(substring(s, 1,1)), 
              substring(s, 2),
              sep="", collapse=" ")}

clean$Street <- sapply(clean$Street,simpleCap)
clean$Street.2 <- sapply(clean$Street.2,simpleCap)

#Make sure the street denominations are following the same standard. 
#For example, all streets are indicated as "str.", avenues as "ave.", etc.

clean$Street <- str_replace_all(clean$Street,"Rd","Rd.")
clean$Street <- str_replace_all(clean$Street,"Road","Rd.")
clean$Street.2 <- str_replace_all(clean$Street.2,"Rd","Rd.")
clean$Street.2 <- str_replace_all(clean$Street.2,"Road","Rd.")

clean$Street <- str_replace_all(clean$Street,"Street","St.")
clean$Street.2 <- str_replace_all(clean$Street.2,"Street","St.")

clean$Street <- str_replace_all(clean$Street,"Lane","Ln.")
clean$Street.2 <- str_replace_all(clean$Street.2,"Lane","Ln.")


###Task3 
#If the value in Street 2 duplicates the value in Street 1, remove the value in Street 2

#Done by Qi Zhang
#If the value in Street 2 duplicates the value in Street 1, remove the value in Street 2

i <- 1

while(i < NROW(clean)) 
{
  if(clean$Street[i] == clean$Street.2[i]) 
  {
    clean$Street.2[i] = ""
  }
  i <- i+1
}

#Remove the "Strange HTML column"
clean$Strange.HTML <- NULL
