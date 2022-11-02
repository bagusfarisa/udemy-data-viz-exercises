library(ggplot2)
library(dplyr)

# store the mpg dataset to a new object (just to be safe)
mpg
data_mpg <- mpg

# Set the default theme to minimal
theme_set(theme_minimal())

# plot1 <- ggplot(mpg, aes(x=displ)) + geom_histogram(aes(y=stat(count)), bins = 10, fill="darkmagenta", alpha=0.75) + stat_bin(bins=10, geom="text",vjust=-1, color="darkmagenta", aes(label=stat(count))) + ylim(c(0,50))

# Create a plain histogram
plot1 <- ggplot(mpg, aes(x=displ)) + geom_histogram(bins = 10, fill="darkmagenta", alpha=0.75)
plot1

# Add count label, set its position based on the count value, and change the scale of the x-axis
plot2<- plot1 + geom_text(stat="bin", bins=10, aes(label=stat(count), y=stat(count)), nudge_y = 1.5, color="darkmagenta", size=3.5) + scale_x_continuous(breaks=1:7)
plot2