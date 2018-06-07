# loading the dataset
raw_df <- read.csv("household_power_consumption.txt", sep=";")


# subsetting df for the 2007-02-01 and 2007-02-02
df <- subset(raw_df, Date=="1/2/2007" | Date=="2/2/2007")

# Converting Global active power to numeric
df[, "Global_active_power"] <- as.numeric(as.character(df$Global_active_power))

png("plot1.png",)
par(xaxs= "i", yaxs= "i")
hist(df$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
