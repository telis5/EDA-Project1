## Read the data
df1 <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
## Select the data
df <- df1[df1$Date == "1/2/2007" | df1$Date == "2/2/2007",]
rm("df1")
## Convert the Date and Time variables to Date/Time classes
df <- mutate(df, CompDate = paste(df$Date, df$Time, sep = " "))
df$CompDate <- strptime(df$CompDate, "%d/%m/%Y %H:%M:%S")
df<- df[3:10]
## Convert the other variables to the numeric class
for (i in 1:7) df[,i] <- as.numeric(df[,i])
## Construct the plot
png(file="plot3.png", width=480, height=480)
with(df, plot(CompDate, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black"))
with(df, points(CompDate, Sub_metering_2, type = "l", col = "red"))
with(df, points(CompDate, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty=c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()