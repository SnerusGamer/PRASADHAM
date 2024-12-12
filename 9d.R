# Create a sample of 50 numbers which are normally distributed.
y <- rnorm(150)
# Give the chart file a name.
png(file = "rnorm.png")
# Plot the histogram for this sample.
hist(y, main = "Normal DIstribution")
# Save the file.
dev.off()
