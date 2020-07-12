exdata <- "exdata-data-NEI_data.zip"
if (!file.exists(exdata)) {
        download_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        download.file(download_url, destfile = exdata)
        unzip(zipfile = exdata)
}

if (!exists("NEI")) {
        NEI <- readRDS("summarySCC_pm25.rds")
}

if (!exists("SCC")) {
        SCC <- readRDS("Source_Classification_Code.rds")
}

head(NEI)

head(SCC[,c("SCC", "Short.Name")])

## Using base plotting system - Have total emissions from PM2.5 decreased in the US from 1998-2008?

total_annual_emissions <- aggregate(Emissions ~ year, NEI, FUN = sum)
color_range <- 2:(length(total_annual_emissions$year)+1)
with(total_annual_emissions,
     barplot(height = Emissions/1000, names.arg = year, col = color_range,
             xlab = "Year", ylab = expression('PM'[2.5]*' in Kilotons'),
             main = expression('Annual Emission PM'[2.5]* 'from 1999 to 2008')))
png("plot.1.png")
dev.off()
