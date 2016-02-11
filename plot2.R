#
# plot2.R
# Build plot3 
#

plot2 <- function(pdata,imageName) {
        
        #Open a png device with 480x480 size
        png(filename = imageName,
            width = 480,
            height=480)
        # draw the base plot
        plot(pdata$DateTime,
             pdata$GlobalActivePower,
             type="l",
             xlab="",
             ylab="Global Active Power (kilowatts)")
        # Close the png device
        dev.off()
}

source("prepData.R")
pdata <- prepData()
if (! file.exists("./png")) { dir.create("./png") }
plot2(pdata, "./png/plot2.png")