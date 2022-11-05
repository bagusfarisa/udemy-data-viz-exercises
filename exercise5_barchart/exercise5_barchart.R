# Load the necessary library
library(ggplot2)

# Define the dataframe
candidates <- c("Biden", "Trump")
results <- c(306,232)
election <- c("2020 Election", "2020 Election")
df <- data.frame(candidates, results, election)

# Map election to y aes (so the bars are stacked)
# Map results to x aes (to show the ratio)
# Map candidates to fill aes (to distinguish between the bar)
# Add geom_col because we don't need stat transformation for the x-axis of the geom_bar
plot1 <- ggplot(df, aes(y=election, x=results, fill=candidates)) + 
  geom_col(position = position_fill(reverse = T), width = 0.04)



# Add geom segment, and define the line slicing the stacked bars right in the middle
plot2 <- plot1 + 
  geom_segment(aes(x=0.5, xend=0.5, y=0.95, yend=1.05))


# --- This is an alternative approach if you want to show the x-axis as
# the results' nominal values (not normalized)
# --->
# plot2 <- plot1 + 
#  geom_segment(aes(x=after_stat(sum(results)/2), xend=after_stat(sum(results)/2), y=0.95, yend=1.05))


# Define the colors to be assigned to each candidate
us_colors = c("Biden"="midnightblue", "Trump"="firebrick")

# Change the fill values to the defined colors
plot3 <- plot2 + scale_fill_manual(values = us_colors)

# Change the theme to theme_void() to remove everything other than the geoms
# Add text indicating the 50% threshold
plot4 <- plot3 + theme_void() + geom_text(aes(x=0.5, y=0.92), label="  50%")

# Show the final result
plot4