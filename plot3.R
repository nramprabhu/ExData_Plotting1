#
# plot3.R
# Build plot3 
#

plot3 <- function(pdata,imageName) {
        
        #Open a png device with 480x480 size
        png(filename = imageName,
            width = 480,
            height=480)
        # Get a base plot
        plot(cacheplotData$DateTime,
             cacheplotData$Submetering1,
             type="l",
             xlab = "",
             ylab = "Energy sub metering")
        # Add the line for Sub metering 1
        points(cacheplotData$DateTime,
               cacheplotData$Submetering1,
               type="l",
               col="black")
        # Add the line for Sub metering 2
        points(cacheplotData$DateTime,
               cacheplotData$Submetering2,
               type="l",
               col="red")
        # Add the line for Sub metering 3
        points(cacheplotData$DateTime,
               cacheplotData$Submetering3,
               type="l",
               col="blue")
        # Add Legend Entries
        legend(x="topright",
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty = 1,
               col = c("black","red","blue")
               )
        # Close the png device
        dev.off()
}

source("prepData.R")
pdata <- prepData()
if (! file.exists("./png")) { dir.create("./png") }
plot3(pdata, "./png/plot3.png")