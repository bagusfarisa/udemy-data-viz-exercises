# Load the necessary library
library(ggplot2)
library(viridis)
library(dplyr)

# Set the default theme to minimal
theme_set(theme_minimal())

# Store the mpg dataset to dedicated variable (just to be safe)
data_mpg <- mpg

# Create a box plot with transparent fill and a viloin plot behind it
plot1 <- ggplot(data_mpg, aes(x=hwy, y=class)) + 
  #Don't forget to hide the legend of the violin plot
  geom_violin(aes(fill=class), color=NA, alpha=0.4, show.legend=F) + 
  geom_boxplot(width=0.2, fill=NA)
plot1

# Change the labels
plot2 <- plot1 +
  labs(title = "Highway Fuel Consumption per Class of Vehicle", y="Class", x="Highway fuel consumption")
plot2

# Change the color palette to viridis and set it to discrete 
plot3 <- plot2 + scale_fill_viridis(discrete = T)
plot3