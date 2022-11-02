# Load necessary packages
library(ggplot2)
library(ggridges)
library(dplyr)

#data
data_diamonds <- diamonds
plot1 <- ggplot(data_diamonds) + geom_density_ridges2(aes(x=price, y=cut, color=cut, fill=cut), alpha=0.4) + theme_minimal() + labs(title="Diamond\'s price distribution per cut type", x="Price (USD)", y="Cut type")
plot1
