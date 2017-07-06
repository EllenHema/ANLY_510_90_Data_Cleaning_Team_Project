
library(zoo)

clean <- read.csv("~/DataClean.csv",header = TRUE)
clean$Area <- sub("^$", NA, clean$Area)
clean$Area <- na.locf(clean$Area)


clean$Street <- str_replace_all(clean$Street,"????"," ")
clean$Street.2 <- str_trim(clean$Street.2)

# Assignment-7-collaboration-on-repository-and-data-cleanup
# Remove special characters, padding from Street 1 and Street 2 variables,etc.
DataClean<-read.csv("~/Downloads/DataClean.csv")
clean<-read.csv("~/Downloads/DataClean.csv")
View(clean)
clean$Street <- gsub("[^A-Za-z ]", " ", clean$Street)
clean$Street <- gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", clean$Street, perl=TRUE)


clean$Street.2 <- gsub("[^A-Za-z ]", " ", clean$Street.2)
clean$Street.2 <- gsub("(?<=[\\s])\\s*|^\\s+|\\s+$", "", clean$Street.2, perl=TRUE)
clean$Street <- gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", clean$Street, perl=TRUE)
clean$Street.2 <- gsub("(^|[[:space:]])([[:alpha:]])", "\\1\\U\\2", clean$Street.2, perl=TRUE)
install.packages('gsubfn')
install.packages('proto')
patterns     <- c("Lane", "Road", "Avenue", "Green", "Hospital", "Village", "Center", "Drive", "Circle", "Park","Street")
replacements <- c("Lan.",  "Rd.", "Ave.", "Gr.","Hosp.","Vil.","Ctr.", "Dr.", "Cr.","Pk.","Str.")
library('proto)
library('gsubfn')
clean$Street <- gsubfn("\\b\\w+\\b", as.list(setNames(replacements, patterns)), clean$Street)
clean$Street.2 <- gsubfn("\\b\\w+\\b", as.list(setNames(replacements, patterns)), clean$Street.2)
View(clean)

