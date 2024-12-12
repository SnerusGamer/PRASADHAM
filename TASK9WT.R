# Load necessary libraries
library(caret)

# Load the Wine dataset (Replace with the correct path to your dataset)
wine <- read.csv("C:/Users/mamid/Downloads/wineQT.csv")

# Check the structure of the dataset
head(wine)

# Select a feature from the dataset (e.g., alcohol content)
alcohol_data <- wine$alcohol




# 1. dnorm: Probability density function (PDF)

# Calculate the probability density for a specific alcohol value (e.g., 13)
alcohol_value <- 13
mean_alcohol <- mean(alcohol_data)
sd_alcohol <- sd(alcohol_data)

pdf_value <- dnorm(alcohol_value, mean = mean_alcohol, sd = sd_alcohol)
cat("PDF value for alcohol value", alcohol_value, ":", pdf_value, "\n")




# 2. pnorm: Cumulative distribution function (CDF)

# Calculate the cumulative probability for alcohol value 13
cdf_value <- pnorm(alcohol_value, mean = mean_alcohol, sd = sd_alcohol)
cat("CDF value for alcohol value", alcohol_value, ":", cdf_value, "\n")



# 3. qnorm: Quantile function (Inverse CDF)

# Find the alcohol value corresponding to the 95th percentile
quantile_95 <- qnorm(0.95, mean = mean_alcohol, sd = sd_alcohol)
cat("95th percentile alcohol value:", quantile_95, "\n")



# 4. rnorm: Generate random samples from a normal distribution

# Generate 10 random samples of alcohol content with the same mean and sd
random_samples <- rnorm(10, mean = mean_alcohol, sd = sd_alcohol)
cat("Random samples of alcohol content:", random_samples, "\n")



# Additional: Visualizing the distribution of alcohol data
hist(alcohol_data, breaks = 30, col = "skyblue", main = "Histogram of Alcohol Content",
     xlab = "Alcohol Content", ylab = "Frequency")

# Add a normal curve over the histogram for visualization
curve(dnorm(x, mean = mean_alcohol, sd = sd_alcohol), add = TRUE, col = "red", lwd = 2)
