# Load necessary packages
library(babynames)
library(ggplot2)
library(viridis)
library(dplyr)

# Store the babynames dataset to new object
baby <- babynames

# Define the plain line and dot plot
plot1 <- ggplot(selectedBabyNames, aes(x=year, y=n, group=name)) + geom_line() + geom_point()

# Set the color by the name and set the scale_color_viridis to discrete
plot2 <- ggplot(selectedBabyNames, aes(x=year, y=n, group=name, color=name)) + geom_line() + geom_point() + scale_color_viridis(discrete=T)

# Change the line type to dashed, set the alpha, and change theme to minimal
plot3 <- ggplot(selectedBabyNames, aes(x=year, y=n, group=name, color=name)) + geom_line(linetype="dashed") + geom_point(size=3, alpha=0.6) + scale_color_viridis(discrete=T) + theme_minimal()

# Change the title and labels in x & y-axis
plot4 <- plot3 + ggtitle("Number of Female Babies Named with Specific Names") + xlab("Birth Year") + ylab("Number of Babies")
plot4


