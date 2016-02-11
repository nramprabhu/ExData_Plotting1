
prepData <- function ()
{
         # Check if the Data been already extacted and available 
         # in Variable cacheplotdata in Global Environment
         # If Available and Not Null Return the Value from Cache
         # Else calculate the Variable and Store it in cachepolotData in Global Env
         # and return It
        
         if (exists("cacheplotData",envir=.GlobalEnv)) {
                if (!is.null(cacheplotData)) { 
                        return(cacheplotData)
                        }
                }
        
# Download the Zip file exdata_data_household_power_consumption.zip into the Working Directory
# Extract the Zip file into a Directory called exdata
# use read.csv2 to read the ; separated file as a data frame

plotData <- read.table("./data/exdata/household_power_consumption.txt",
           header = TRUE, sep=";", na.strings="?",
           col.names = c("Date", "Time", "GlobalActivePower",
                         "GlobalReactivePower", "Voltage", "GlobalIntensity",
                         "Submetering1", "Submetering2", "Submetering3"),
           colClasses = c( "character", "character", "numeric",
                           "numeric", "numeric", "numeric", "numeric",
                           "numeric", "numeric"))

# Take a subset of Rows corresponding to Dates 01/02/2007 & 02/02/2007 
plotData <- subset(plotData,
                   plotData$Date == "1/2/2007" | plotData$Date == "2/2/2007")

# Concat Date & Time and convert it to Date Time 
plotData$DateTime <- paste(plotData$Date,
                           plotData$Time)

# Add a new Column with the new Date Time Object
plotData$DateTime <- as.POSIXct(strptime(plotData$DateTime,
                                         "%d/%m/%Y %H:%M:%S"))

#Cache it in the Global environment 
#All plots in this session can use this variable instead of creating again
assign("cacheplotData", 
       plotData, 
       envir = .GlobalEnv)

# return the Data for Plotting
plotData

}

