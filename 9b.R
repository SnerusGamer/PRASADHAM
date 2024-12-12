#PNORM#

# Create a sequence of numbers between -10 and 10 incrementing by 0.2.
x <- seq(-10,10,by = .2)
# Choose the mean as 2.5 and standard deviation as 2. 

y <- pnorm(x, mean = 2.5, sd = 2)

# Give the chart file a name.

png(file = "C:/Users/mamid/Downloads/pnorm.png")
# Plot the graph.
plot(x,y)
# Save the file.
#dev.off()