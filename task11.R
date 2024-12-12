# Load necessary libraries
library(mclust)   # EM algorithm (Gaussian Mixture Model)
library(cluster)  # For silhouette analysis
library(factoextra) # For visualization
library(fpc) # For ARI

# Step 1: Load the dataset from a CSV file
data <- read.csv("D:\\G drive\\GRIET\\GRIET Teaching\\3. AY 2022-2026\\III-I\\CSBS\\MLRP Lab\\Task-10\\iris.csv")  # Replace with your dataset path

# Step 2: Clean the data (Remove or impute NA/NaN/Inf values)
data_clean <- na.omit(data)  # Remove rows with missing values
# Alternatively, you can impute missing values with the column mean:
# data_clean <- data
# data_clean[is.na(data)] <- apply(data, 2, function(x) mean(x, na.rm = TRUE))

# Ensure the data is numeric for clustering
data_numeric <- data_clean[, sapply(data_clean, is.numeric)]


# Step 3: Apply EM Algorithm using Mclust
em_model <- Mclust(data_numeric)

# Step 4: Apply K-means Algorithm (using number of clusters found by EM)
k_means_model <- kmeans(data_numeric, centers = em_model$G)

# Step 5: Compare the results using Adjusted Rand Index (ARI)
ari_em_kmeans <- adjustedRandIndex(em_model$classification, k_means_model$cluster)
cat("Adjusted Rand Index between EM and k-Means: ", ari_em_kmeans, "\n")

# Step 6: Visualize the clustering results for both methods
# EM clustering visualization
fviz_cluster(em_model, data = data_numeric, main = "EM Algorithm Clustering")

# k-Means clustering visualization
fviz_cluster(k_means_model, data = data_numeric, main = "K-Means Clustering")

# Step 7: Evaluate clustering performance using Silhouette Analysis
# Silhouette scores for EM clustering
sil_em <- silhouette(em_model$classification, dist(data_numeric))
fviz_silhouette(sil_em, main = "Silhouette Plot for EM Algorithm")

# Silhouette scores for k-Means clustering
sil_kmeans <- silhouette(k_means_model$cluster, dist(data_numeric))
fviz_silhouette(sil_kmeans, main = "Silhouette Plot for K-Means Algorithm")

# Step 8: Output additional performance metrics
# Calculate and display Within-cluster sum of squares for k-Means
wcss_kmeans <- k_means_model$tot.withinss
cat("Total within-cluster sum of squares for K-means: ", wcss_kmeans, "\n")

# Output number of components in EM model (clusters)
cat("Number of components in EM model: ", em_model$G, "\n")

# Step 9: Return clustering results
list(
  "EM Clustering" = em_model$classification,
  "K-Means Clustering" = k_means_model$cluster,
  "Adjusted Rand Index" = ari_em_kmeans
)
