# Install required packages if not already installed
if(!require(FNN)) install.packages("FNN")
if(!require(caret)) install.packages("caret")

# Load necessary libraries
library(FNN)  # For nearest neighbor search
library(caret)  # For data handling

# Load your dataset (replace with the correct path to your dataset)
wine <- read.csv("C:/Users/mamid/Downloads/wineQT.csv")

# Check the dataset structure
head(wine)

# For simplicity, let's use the 'alcohol' and 'pH' columns for anomaly detection
data <- wine[, c("alcohol", "pH")]

# Normalize the dataset
data_scaled <- scale(data)

# Distance-based Anomaly Detection using KNN
# k = number of nearest neighbors, let's use k = 5

k <- 5
knn_result <- get.knn(data_scaled, k = k)

# Calculate the average distance to the k-nearest neighbors for each point
distance_scores <- rowMeans(knn_result$nn.dist)

# Identify the top 5 anomalies based on distance (highest distances)
top_anomalies_distance <- order(distance_scores, decreasing = TRUE)[1:5]
cat("Top 5 anomalies (distance-based):", top_anomalies_distance, "\n")

# Plot the data with anomalies marked
plot(data_scaled, col = "blue", pch = 20, main = "KNN Distance-based Anomaly Detection")
points(data_scaled[top_anomalies_distance, ], col = "red", pch = 4, cex = 2)

# Density-based Anomaly Detection using LOF (Local Outlier Factor)
# LOF is based on density comparison, using the Rlof package
if(!require(Rlof)) install.packages("Rlof")
library(Rlof)

# Calculate the LOF score for each data point
lof_scores <- lof(data_scaled, k = k)

# Identify the top 5 anomalies based on LOF scores (highest LOF values)
top_anomalies_lof <- order(lof_scores, decreasing = TRUE)[1:5]
cat("Top 5 anomalies (density-based - LOF):", top_anomalies_lof, "\n")

# Plot the data with anomalies marked based on LOF scores
plot(data_scaled, col = "blue", pch = 20, main = "Density-based Anomaly Detection (LOF)")
points(data_scaled[top_anomalies_lof, ], col = "green", pch = 4, cex = 2)


