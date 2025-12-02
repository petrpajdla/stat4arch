
library(dplyr)
library(tidyr)
library(ggplot2)

# Data preparation ----
# Read data on dart points
dartpoints <- read.csv("lect/w05/data/dartpoints.csv")

# Filter to two types of dart points, select numeric columns
# and remove rows with missing values
dp <- dartpoints |>
  filter(Name %in% c("Darl", "Pedernales")) |>
  select(Name, where(is.numeric)) |>
  drop_na()

head(dp, 4)
tail(dp, 4)

# Scatter plot of Length vs Weight colored by Name
dp |>
  ggplot(aes(x = Length, y = Weight, color = Name)) +
  geom_point() +
  theme_minimal()

# PCA analysis ----
# Prepare data matrix for PCA
dp_matrix <- dp |>
  select(where(is.numeric)) |>
  as.matrix()

rownames(dp_matrix) <- dp |> pull(Name) # add rownames

# Scale data to remove effects of different units and magnitudes
scaled <- scale(dp_matrix, center = TRUE, scale = TRUE)

# PCA analysis
pca <- prcomp(scaled)
# alternatively prcomp(dp_matrix, center = TRUE, scale. = TRUE))

# Summary of PCA results
summary(pca)

# Biplot with color mapped to Name
biplot(pca)

# ggplot2 'biplot' visualization
pca_scores <- as.data.frame(pca$x)

# Add variation to biplot axis labels
var_explained <- round(100 * (pca$sdev^2) / sum(pca$sdev^2), 1)

pca_scores |>
  ggplot() +
  aes(x = PC1, y = PC2, color = dp$Name) +
  geom_point(size = 3) +
  theme_minimal() +
  coord_fixed() +
  labs(title = "PCA Biplot of Dart Points",
       x = paste0("PC1 (", var_explained[1], "%)"),
       y = paste0("PC2 (", var_explained[2], "%)"),
       color = "Dart point type")


# K-means clustering ----
# Set seed (random number generator) for reproducibility
set.seed(42)

# Elbow method to determine optimal number of clusters
factoextra::fviz_nbclust(pca_scores[, 1:2], kmeans, method = "wss")

# Caculate K-means
kmeans_result <- kmeans(pca_scores, centers = 2, nstart = 25)

kmeans_result

# Plot
pca_scores |>
  ggplot() +
  aes(x = PC1, y = PC2, color = factor(kmeans_result$cluster)) +
  geom_point(size = 3) +
  theme_minimal() +
  labs(title = "K-means Clustering on PCA Results",
       x = "PC 1",
       y = "PC 2",
       color = "Cluster")

# Compare clusters to original names, i.e., dart point types
pca_scores |>
  ggplot() +
  aes(
    x = PC1, y = PC2,
    color = dp$Name,
    shape = factor(kmeans_result$cluster)
  ) +
  geom_point(size = 3) +
  theme_minimal() +
  labs(title = "K-means Clustering on PCA Results",
       x = "PC 1",
       y = "PC 2",
       color = "Type of dartpoint",
       shape = "Cluster")

# Table of clusters vs original names
table(kmeans_result$cluster, dp$Name)

# Hierarchical clustering ----

pca_scores[1:5, 1:5]

# Calculate distance matrix
dist_matrix <- dist(pca_scores)

as.matrix(dist_matrix)[1:5, 1:5]

# Hierarchical clustering using complete linkage
hc <- hclust(dist_matrix, method = "ward.D2")

# Plot dendrogram
plot(hc, labels = dp$Name, main = "Hierarchical Clustering Dendrogram")
abline(h = 10, col = "green")
abline(h = 7.5, col = "red")


# Cut tree into 2 clusters
hc_clusters <- cutree(hc, k = 2)

# Compare clusters to original names
table(hc_clusters, dp$Name)
