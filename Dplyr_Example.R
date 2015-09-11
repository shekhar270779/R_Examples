#Dplyr Exmaple

#dplyr example

#Basic manipulation in R
#http://www3.nd.edu/~steve/computing_with_data/24_dplyr/dplyr.html
#https://cran.rstudio.com/web/packages/dplyr/vignettes/introduction.html
library(dplyr)
library(hflights)
hflights_df <- tbl_df(hflights)
hflights_df

#filter
f_df <- filter(hflights_df, Month ==1, UniqueCarrier == "AA")
f_df
f_df <- filter(hflights_df, Month ==1 | Month == 2, UniqueCarrier == "AA")
glimpse(f_df)
summary(f_df)
glimpse(f_df)
slice(f_df,1:3)
f_df[3:5,]
slice(f_df,3:5)
arrange(f_df,desc(ArrTime))
names(f_df)
slice(
  arrange(
    select(f_df,UniqueCarrier,FlightNum,Year:DayOfWeek)
    ,desc(FlightNum),DayOfWeek)
  ,1:3)

names(f_df)[order(names(f_df))]

slice(arrange(select(mutate(f_df,FlightNum,speed= Distance/AirTime),FlightNum,Distance,AirTime,speed),desc(speed)),1:5)
names(f_df)[order(names(f_df))]

sample_n(f_df,20)
sample_frac(f_df,0.05)

distinct(select(f_df,TailNum))
by_TailNum <- group_by(f_df,TailNum)
names(by_TailNum)
glimpse(by_TailNum)
filter(by_TailNum, TailNum == "N251AA")
summarise(by_TailNum,count = n(),distance = mean(Distance, na.arm = TRUE ))

daily <- group_by(f_df, Year, Month, DayofMonth)
per_day <-summarise(daily, DailyFlightCount = n())
per_day
per_month <- summarise(per_day, MonthlyFlightCount = sum(DailyFlightCount))
per_month
per_year <- summarise(per_month,YearlyCount = sum(MonthlyFlightCount))
per_year
names(f_df)

f_df %>% 
  group_by(Year, Month, DayofMonth) %>% 
  summarise(dailyFlightCount = n()) %>%
  summarise(monthlyFlightCount=sum(dailyFlightCount)) %>%
  summarise(YearlyFlightCount=sum(monthlyFlightCount) )
##########
#https://www.datacamp.com/courses/dplyr-data-manipulation-r-tutorial
rm(list=ls())
library(dplyr)
library(hflights)
str(hflights)
hflights <- tbl_df(hflights)
hflights
glimpse(hflights)
#https://campus.datacamp.com/courses/dplyr-data-manipulation-r-tutorial/chapter-one-introduction-to-dplyr-and-tbls?ex=5
unique(hflights$CancellationCode)
CanCodelookup <- c("A" = "carrier", "B" = "weather", "C" = "FFA", "D" = "security", "E" = "not cancelled")
CanCodelookup
hflights$CancellationCode <- CanCodelookup[hflights$CancellationCode]
unique(hflights$CancellationCode)
glimpse(hflights)

select(hflights, ActualElapsedTime,AirTime, ArrDelay,DepDelay)

#dplyr detailes examples
#http://www.rdocumentation.org/packages/dplyr/functions/select
iris <- tbl_df(iris)
iris
select(iris, Petal.Length )
select (iris, starts_with ("Petal"))
select (iris, ends_with ("Width"))
select (iris, contains("etal"))
select (iris, matches(".t.", ignore.case = TRUE))
petal_v <- c("Petal.Length","Petal.Width")
petal_v
select (iris, one_of(petal_v))
select(iris, -starts_with("Petal"))

df <- as.data.frame(matrix(runif(100),nrow = 10))
df <- tbl_df(df)
df
glimpse(df)
select(df, V4:V9)
select(df, num_range("V",4:9))

select(df,Version_1=V1)
df
rename(df,Version_1 = V1)

glimpse(mtcars)
mtcars <-tbl_df(mtcars)
arrange(filter(mtcars, cyl ==6 | cyl == 4, hp >=80),desc(disp),mpg)
summarise(group_by(mtcars,gear),numofVechiles=n(),mean(mpg))
rm(list=ls())
######
hflights <- tbl_df(hflights)
glimpse(hflights)
hflights %>% 
  filter(DayOfWeek %in% c(6,7)) %>%
  filter(Distance >1000) %>%
  filter((TaxiIn + TaxiOut) <15)
nrow(hflights)
###

