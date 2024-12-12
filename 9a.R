                        #DNORM#
# Create a sequence of numbers between -10 and 10 incrementing by 0.1.

x <- seq(-10, 10, by = .1)
# Choose the mean as 2.5 and standard deviation as 0.5.
y <- dnorm(x, mean = 2.5, sd = 0.5)

# Give the chart file a name.
png(file = "C:/Users/mamid/Downloads/dnorm.png")
plot(x,y)
# Save the file.

#dev.off()










# NOtes
#dev. off shuts down the specified (by default the current) device. 
#If the current device is shut down and any other devices are open, the next open device is made current. 
#It is an error to attempt to shut down device 1.

