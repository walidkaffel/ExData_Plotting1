# loading the dataset
raw_df <- read.csv("household_power_consumption.txt", sep=";")


# subsetting df for the 2007-02-01 and 2007-02-02
df <- subset(raw_df, Date=="1/2/2007" | Date=="2/2/2007")

# Date and Time conversion
Sys.setlocale("LC_TIME", "English")


library(lubridate)
df[, "Date_Time"] <- paste(df$Date, df$Time, sep = " ")
df[, "Date_Time"] <- dmy_hms(df$Date_Time)

# Converting submetering to numeric
df[, "Sub_metering_1"] <- as.numeric(as.character(df$Sub_metering_1))
df[, "Sub_metering_2"] <- as.numeric(as.character(df$Sub_metering_2))
df[, "Sub_metering_3"] <- as.numeric(as.character(df$Sub_metering_3))

png("plot3.png",)
plot(df$Date_Time, df$Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering")
lines(df$Date_Time, df$Sub_metering_1)
lines(df$Date_Time, df$Sub_metering_2, col="red")
lines(df$Date_Time, df$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1, 1, 1))
dev.off()
