# Load the necessary library
library(ggplot2)
library(viridis)
library(dplyr)

# Set the default theme to minimal
theme_set(theme_minimal())

# Store the mpg dataset to dedicated variable (just to be safe)
data_mpg <- mpg

# Create a plain box plot
plot1 <- ggplot(data_mpg, aes(x=hwy, y=class)) + geom_boxplot(width=0.4)

# Add a calculated aesthetic showing the mean of the hwy
plot2 <- plot1 + stat_summary(geom="point",fun=mean, shape=15)

# Change the label in the plot
plot3 <- plot2 + 
  labs(title = "Highway Fuel Consumption per Class of Vehicle", y="Class", x="Highway fuel consumption")
plot3