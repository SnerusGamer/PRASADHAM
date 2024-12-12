
# Install required libraries if not already installed
if (!requireNamespace("bnlearn", quietly = TRUE)) {
  install.packages("bnlearn")
}
if (!requireNamespace("ggm", quietly = TRUE)) {
  install.packages("ggm")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}
if (!requireNamespace("readr", quietly = TRUE)) {
  install.packages("readr")
}

# Load libraries
library(bnlearn)
library(ggm)
library(dplyr)
library(readr)

# Step 1: Load the dataset from a CSV file (replace with your actual file path)
data <- read.csv("D:\\G drive\\GRIET\\GRIET Teaching\\3. AY 2022-2026\\III-I\\CSBS\\MLRP Lab\\Task12\\HDdataset.csv")

# Inspect the first few rows of the dataset
head(data)

# Step 2: Preprocess the Data

# Convert columns to factors where applicable
data$sex <- as.factor(data$sex)
data$cp <- as.factor(data$cp)
data$fbs <- as.factor(data$fbs)
data$restecg <- as.factor(data$restecg)
data$exang <- as.factor(data$exang)
data$slope <- as.factor(data$slope)
data$ca <- as.factor(data$ca)
data$thal <- as.factor(data$thal)
data$target <- as.factor(data$target)

# Discretize continuous variables into categories (convert to factor)
data$age <- cut(data$age, breaks = c(20, 30, 40, 50, 60, 70, 80), 
                labels = c("20-30", "30-40", "40-50", "50-60", "60-70", "70-80"),
                include.lowest = TRUE)
data$trestbps <- cut(data$trestbps, breaks = c(90, 110, 130, 150, 170, 190), 
                     labels = c("90-110", "110-130", "130-150", "150-170", "170-190"),
                     include.lowest = TRUE)
data$chol <- cut(data$chol, breaks = c(100, 150, 200, 250, 300, 350, 400), 
                 labels = c("100-150", "150-200", "200-250", "250-300", "300-350", "350-400"),
                 include.lowest = TRUE)
data$thalach <- cut(data$thalach, breaks = c(60, 100, 140, 180), 
                    labels = c("60-100", "100-140", "140-180"),
                    include.lowest = TRUE)
data$oldpeak <- cut(data$oldpeak, breaks = c(-1, 1, 2, 3, 4, 5), 
                    labels = c("0-1", "1-2", "2-3", "3-4", "4-5"),
                    include.lowest = TRUE)

# Handle missing data (if any)
data <- na.omit(data)  # Remove rows with missing values

# Step 3: Construct a Bayesian Network
# Define the structure of the Bayesian network using the provided parameters
bn_structure <- model2network("[age][sex][cp][trestbps][chol][fbs][restecg][thalach][exang][oldpeak][slope][ca][thal][target|age:sex:cp:trestbps:chol:fbs:restecg:thalach:exang:oldpeak:slope:ca:thal]")

# Fit the Bayesian network to the data
bn_fit <- bn.fit(bn_structure, data)

# Display the learned network structure
plot(bn_structure)

# Step 4: Inference