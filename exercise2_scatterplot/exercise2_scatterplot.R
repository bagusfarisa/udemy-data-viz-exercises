# Import the required libraries
library(ggplot2)
library(dplyr)
library(viridis)

# Summarize the number of vehicle per class and their means highway fuel consumption out of mpg
class_info <- summarise(group_by(mpg, class), n=n(), hwy=mean(hwy))

# Generate a basic scatter plot showing the jittered plots
plot1 <- ggplot(mpg, aes(x=class, y=hwy, color=class)) + geom_point(size=3, alpha=0.4, position = "jitter")

# Add dot plot of the mean highway fuel consumption of each class of vehicle
plot2 <- plot1 + geom_point(data = class_info, mapping = aes(y=hwy), size = 6)

# Add a Title and change the labels of x and y axis
plot3 <- plot2 + labs(title="Fuel Consumption per class of vehicle", x="Class of vehicle", y="Highway fuel consumption") + theme_minimal()

# Add text label to show the number of vehicle in each class (ex: n=41)
#y=5 is included in aes() so it will follow the mapping of the chart, which is in point "5" in the y-axis
plot4 <- plot3 + geom_text(mapping = aes(label=paste0("n=",n), y=5, color = NULL), size = 4, data = class_info)
plot4
