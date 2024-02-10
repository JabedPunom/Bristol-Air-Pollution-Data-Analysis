library(readr)
library(base)
library(tidyr)
library(dplyr)

# Load the dataset

data <- read.csv("data/Air_Quality_Continuous.csv")

# 1. Crop the data

# Filter the data to include only the dates from 2015-01-01 to the end 

data_cropped <- subset(data, as.Date(Date_Time) >= as.Date("2015-01-01 00:00:00+00"))

# 2.Cleanse the cropped data

#Filter the data to include only the dates from 2015-01-01 to 22nd october 2023

data_cleansed <- subset(data_cropped, as.Date(Date_Time) >= as.Date("2015-01-01 00:00:00+00")  & as.Date(Date_Time) <= as.Date("2023-10-22 24:00:00+00"))


# create new column with merge datetime and site id.

data_cleansed$new <- paste(data_cleansed$Date_Time, data_cleansed$Site_ID, sep = "-") 

#now checking the new column there is any duplicate value using distinct function from the dplyr library

data_cleansed <-  data_cleansed %>%
  distinct(new,.keep_all = TRUE)

# again checking there is any null value at new column what I create just
sum(is.na(data_cleansed$new))

# checking is there any null value at Site_ID column: 
sum(is.na(data_cleansed$Site_ID))


#dropping the null values from the Site_ID column.
data_cleansed <- data_cleansed %>%
  drop_na(Site_ID)


# Replace the negative value with NaN :

data_cleansed$NOx[data_cleansed$NOx <0 ] <- NaN
data_cleansed$NO2[data_cleansed$NO2 <0 ] <- NaN
data_cleansed$NO[data_cleansed$NO <0 ] <- NaN
data_cleansed$PM10[data_cleansed$PM10 <0 ] <- NaN
data_cleansed$O3[data_cleansed$O3 <0 ] <- NaN
data_cleansed$NVPM10[data_cleansed$NVPM10 <0 ] <- NaN
data_cleansed$VPM10[data_cleansed$VPM10 <0 ] <- NaN
data_cleansed$NVPM2_5[data_cleansed$NVPM2_5 <0 ] <- NaN
data_cleansed$PM2_5[data_cleansed$PM2_5 <0 ] <- NaN
data_cleansed$VPM2_5[data_cleansed$VPM2_5 <0 ] <- NaN

#Now checking there is any negative values or not then remove it:

summary(data_cleansed)

#now delete the creating new column to make it same

data_cleansed <- data_cleansed %>%
  select(-new)

#again create new column for Reading ID generating consecutive number

data_cleansed <- data_cleansed %>%
  mutate(Reading_id = 1:n()) %>% 
  select(Reading_id, everything())

#cheking the datatype:

sapply(data_cleansed,class)

#convert the datatype of Date_Time from char to DateTime format

data_cleansed$Date_Time <- as.POSIXct(data_cleansed$Date_Time, format="%Y/%m/%d %H:%M:%S+%S") 

# Save the cropped and cleansed dataset

write.csv(data_cleansed, "Cropped and Cleansed Data.csv", row.names =FALSE)

