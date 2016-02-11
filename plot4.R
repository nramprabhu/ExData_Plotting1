#
# plot4.R
# Build plot4 
#

plot4 <- function(pdata,imageName) {
        
        #Open a png device with 480x480 size
        png(filename = imageName,
            width = 480,
            height=480)
        # set the par for 2 * 2 
        par(mfrow=c(2,2))
        # Draw the Left Top Plot
        plot(pdata$DateTime,
             pdata$GlobalActivePower,
             type="l",
             xlab="",
             ylab="Global Active Power")
        # Draw the Right Top Plot
        plot(pdata$DateTime,
             pdata$Voltage,
             type="l",
             xlab="datetime",
             ylab="Voltage")
        # Draw the Left Bottom Plot
                plot(pdata$DateTime,
                     pdata$Submetering1,
                     type="l",
                     xlab = "",
                     ylab = "Energy sub metering")
                # Add the line for Sub metering 1
                points(pdata$DateTime,
                       pdata$Submetering1,
                       type="l",
                       col="black")
                # Add the line for Sub metering 2
                points(pdata$DateTime,
                       pdata$Submetering2,
                       type="l",
                       col="red")
                # Add the line for Sub metering 3
                points(pdata$DateTime,
                       pdata$Submetering3,
                       type="l",
                       col="blue")
                # Add Legend Entries
                legend(x="topright",
                       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                       lty = 1,
                       col = c("black","red","blue"),
                       bty = "n"
                       )
        # Draw the Right Bottom plot
                plot(pdata$DateTime,
                     pdata$GlobalReactivePower,
                     type="h",
                     ylab="Global_reactive_power",
                     xlab="datetime")
                
        # Close the png device
        dev.off()
}

source("prepData.R")
pdata <- prepData()
if (! file.exists("./png")) { dir.create("./png") }
plot4(pdata, "./png/plot4.png")