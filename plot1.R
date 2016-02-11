#
# plot1.R
# Build a plot1 of Global Active Power
#

plot1 <- function(pdata,imageName) {
     
        #Open a png device with 480x480 size          
        png(filename = imageName,
                width = 480,
                height=480)
        #draw the base plot
        hist(pdata$GlobalActivePower,
             col="red", 
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)") 
        # Close the png device
        dev.off()
 }

source("prepData.R")
pdata <- prepData()
if (! file.exists("./png")) { dir.create("./png") }
plot1(pdata, "./png/plot1.png")