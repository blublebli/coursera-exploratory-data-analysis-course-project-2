## Using the base plotting system - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland ( fips == "24510") from 1999 to 2008?

b_total_emissions <- NEI %>%
        filter(fips == "24510") %>%
        group_by(year) %>%
        summarise(Emissions = sum(Emissions))


with(b_total_emissions,
     barplot(height=Emissions/1000, names.arg = year, col = color_range,
             xlab = "Year", ylab = expression("PM"[2.5]* "in Kilotons"),
             main = expression("Baltimore, Maryland Emissions from 1999 to 2008"))
     )
png("plot2.png")
dev.off()
