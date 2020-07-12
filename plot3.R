##  Of the four types of sources indicated by the (point, nonpoint, onroad, nonroad) variable, 
## which of these four sources have seen decreases in emissions from 19992008 for Baltimore City? 
## Which have seen increases in emissions from 19992008? 
## Use the ggplot2 plotting system to make a plot answer this question.

baltcitymary.emissions.byyear<-summarise(group_by(filter(NEI, fips == "24510"), year,type), Emissions=sum(Emissions))

ggplot(baltcitymary.emissions.byyear, aes(x=factor(year), y=Emissions, fill=type,label = round(Emissions,2))) +
        geom_bar(stat="identity") +
        #geom_bar(position = 'dodge')+
        facet_grid(. ~ type) +
        xlab("year") +
        ylab(expression("total PM"[2.5]*" emission in tons")) +
        ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
                                           "City by various source types", sep="")))+
        geom_label(aes(fill = type), colour = "white", fontface = "bold")
