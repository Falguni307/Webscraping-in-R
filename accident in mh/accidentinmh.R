# Loading Libraries
library(XML)

# Webscraping
con=url("https://highwaypolice.maharashtra.gov.in/en/reports/")
htmlCode = readLines(con)
close(con)

# Reading Tables into R
recentyears <- readHTMLTable(htmlCode, which =1)

# Reading Data
head(recentyears)
class(recentyears)

# Saving Data into csv
write.csv(recentyears, "D:\\Data Science\\R\\accident in mh\\recentyears.csv")

# Analysing Data
summary(recentyears)
hist(recentyears)

# Checking missing values
is.na(recentyears)

# Plotting Data
hist(recentyears$Years)
plot(recentyears$Years, recentyears$Total.Accidents)

# Reading others tables into R 
year2016 <- readHTMLTable(htmlCode, which=2)
year2017 <- readHTMLTable(htmlCode, which=3)
year2018 <- readHTMLTable(htmlCode, which=4)
year2019 <- readHTMLTable(htmlCode, which=5)

# Saving the data into csv
write.csv(year2016, "D:\\Data Science\\R\\accident in mh\\years2016.csv")
write.csv(year2017, "D:\\Data Science\\R\\accident in mh\\years2017.csv")
write.csv(year2018, "D:\\Data Science\\R\\accident in mh\\years2018.csv")
write.csv(year2019, "D:\\Data Science\\R\\accident in mh\\years2019.csv")

# installing & loading package
install.packages("ggplot2")
library(ggplot2)

# Plotting the data
qplot(Total.Accidents, year2016$total.accident, data = recentyears, geom="smooth")
qplot(Total.Accidents, Years, data = recentyears, geom="smooth")

# getting a table into R
merged <- read.csv("D:\\Data Science\\R\\accident in mh\\merged.csv")
