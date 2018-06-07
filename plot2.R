# loading the dataset
raw_df <- read.csv("household_power_consumption.txt", sep=";")


# subsetting df for the 2007-02-01 and 2007-02-02
df <- subset(raw_df, Date=="1/2/2007" | Date=="2/2/2007")

# Date and Time conversion
Sys.setlocale("LC_TIME", "English")

library(lubridate)
df[, "Date_Time"] <- paste(df$Date, df$Time, sep = " ")
df[, "Date_Time"] <- dmy_hms(df$Date_Time)

# Converting Global active power to numeric
df[, "Global_active_power"] <- as.numeric(as.character(df$Global_active_power))

png("plot2.png",)
plot(df$Date_Time, df$Global_active_power, type="n", xlab = "", ylab="Global Active Power")
lines(df$Date_Time, df$Global_active_power)
dev.off()
