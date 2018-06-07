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

# Converting Global active power to numeric
df[, "Global_active_power"] <- as.numeric(as.character(df$Global_active_power))

# Converting Global reactive power to numeric
df[, "Global_reactive_power"] <- as.numeric(as.character(df$Global_reactive_power))

# Converting voltage to numeric
df[, "Voltage"] <- as.numeric(as.character(df$Voltage))


png("plot4.png",)
par(mfrow=c(2,2))
# first plot
plot(df$Date_Time, df$Global_active_power, type="n", xlab = "", ylab="Global Active Power")
lines(df$Date_Time, df$Global_active_power)
# second plot
plot(df$Date_Time, df$Voltage, type="n", xlab = "datetime", ylab="Voltage")
lines(df$Date_Time, df$Voltage)
# third plot
plot(df$Date_Time, df$Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering")
lines(df$Date_Time, df$Sub_metering_1)
lines(df$Date_Time, df$Sub_metering_2, col="red")
lines(df$Date_Time, df$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1, 1, 1), bty = "n")
# fourth plot
plot(df$Date_Time, df$Global_reactive_power, type="n", xlab = "datetime", ylab="Global_reactive_power")
lines(df$Date_Time, df$Global_reactive_power)
dev.off()
