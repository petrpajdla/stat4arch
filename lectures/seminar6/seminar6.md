stat4arch
========================================================
author: Petr Pajdla & Peter Tkáč
autosize: true
width: 1920
height: 1080

AES_707: *Statistics seminar for archaeologists*

<!-- <https://support.rstudio.com/hc/en-us/articles/200486468> -->

<!-- =============================================== -->

Seminar 6
========================================================
type: section

`28. 4. 2022`

Today:
<ul style='color:white;'>
<li>Multivariate statistics
<li>Dimensionality reduction
<li>Clustering
</ul>




<!-- =============================================== -->

Multivariate data & methods
========================================================
type: section

<!-- ----------------------------------------------- -->

Multivariate data
========================================================

### Division based on number of studied variables

- Univariate  
(one variable per observation);
- Bivariate  
(two variables);
- **Multivariate**  
(also *multidimensional*, multiple variables).

***

<img src="fig/mvn.png" style='box-shadow:none; width:100%;'>

<!-- ----------------------------------------------- -->

Dimensionality reduction
========================================================
type: sub-section

<!-- ----------------------------------------------- -->

The curse of higher dimensions
========================================================
title: false
left: 60%

<img src="fig/curse.png" style="width:100%; box-shadow:none;">

***

The *curse* of higher dimensions...

- Computational ineffectivity;
- Low data density in higher dimensions;
- Problematic visualization, we do not easily cope with more than 3D;
- Difficult interpretation *and much more*.


<!-- ----------------------------------------------- -->

Principal components analysis
========================================================

**Goal:** Find low-dimensional representation of the observations that explain a good fraction of the variation.

- First principal component is a direction that maximizes the 
variance of the projected data.

<img src='fig/pca.png' style="width:100%; box-shadow:none;">

<!-- ----------------------------------------------- -->

PCA I: Data
========================================================
left: 60%

### Data preparation
- Works with numeric data only.
- Format the input as a **matrix**...


```r
# load data set
data("DartPoints", package = "archdata")
dp <- DartPoints %>% 
  select(Length, Width) %>% # select columns
  as.matrix() # format as a matrix
# set row names with IDs
rownames(dp) <- DartPoints$Catalog
head(dp)
```

```
        Length Width
41-0322   42.8  15.8
35-2946   40.5  17.4
35-2921   37.5  16.3
36-3487   40.3  16.1
36-3321   30.6  17.1
35-2959   41.8  16.8
```

***

### Plot the original data

```r
plot(dp)
```

![plot of chunk pca2](seminar6-figure/pca2-1.png)

<!-- ----------------------------------------------- -->

PCA II
========================================================
left: 60%

### Do the PCA


```r
dp_pca <- prcomp(dp)
dp_pca
```

```
Standard deviations (1, .., p=2):
[1] 13.377206  3.138274

Rotation (n x k) = (2 x 2):
             PC1        PC2
Length 0.9492163 -0.3146243
Width  0.3146243  0.9492163
```

```r
summary(dp_pca)
```

```
Importance of components:
                           PC1     PC2
Standard deviation     13.3772 3.13827
Proportion of Variance  0.9478 0.05217
Cumulative Proportion   0.9478 1.00000
```

***


```r
plot(dp_pca)
```

![plot of chunk pca4](seminar6-figure/pca4-1.png)

*Scree* plot

- Shows the amount of variation explained by each PC.

<!-- ----------------------------------------------- -->

PCA III: Biplot
========================================================


```r
biplot(dp_pca)
```

![plot of chunk pca5](seminar6-figure/pca5-1.png)

***


```r
ggbiplot::ggbiplot(dp_pca)
```

![plot of chunk pca6](seminar6-figure/pca6-1.png)

<!-- ----------------------------------------------- -->

PCA IV: The details
========================================================


```r
# structure of the prcomp object
str(dp_pca)
```

```
List of 5
 $ sdev    : num [1:2] 13.38 3.14
 $ rotation: num [1:2, 1:2] 0.949 0.315 -0.315 0.949
  ..- attr(*, "dimnames")=List of 2
  .. ..$ : chr [1:2] "Length" "Width"
  .. ..$ : chr [1:2] "PC1" "PC2"
 $ center  : Named num [1:2] 49.3 22.1
  ..- attr(*, "names")= chr [1:2] "Length" "Width"
 $ scale   : logi FALSE
 $ x       : num [1:91, 1:2] -8.17 -9.85 -13.05 -10.45 -19.35 ...
  ..- attr(*, "dimnames")=List of 2
  .. ..$ : chr [1:91] "41-0322" "35-2946" "35-2921" "36-3487" ...
  .. ..$ : chr [1:2] "PC1" "PC2"
 - attr(*, "class")= chr "prcomp"
```

***


```r
# extract the coordinates
dp_pca_x <- dp_pca$x
head(dp_pca_x)
```

```
               PC1       PC2
41-0322  -8.173985 -3.903419
35-2946  -9.853784 -1.661037
35-2921 -13.047519 -1.761302
36-3487 -10.452638 -2.832093
36-3321 -19.345412  1.168979
35-2959  -8.808577 -2.639578
```

```r
class(dp_pca_x)
```

```
[1] "matrix" "array" 
```

```r
dp_pca_x <- as.data.frame(dp_pca_x)
class(dp_pca_x)
```

```
[1] "data.frame"
```

<!-- ----------------------------------------------- -->

PCA V: Custom plot
========================================================
left: 65%



<img src="fig/pca_dp.png">

***


```r
dp_pca_x %>% 
  bind_cols(
    type = DartPoints$Name
  ) %>% 
  ggplot(
    aes(PC1, PC2, 
        color = type)
  ) +
  geom_point()
```

<!-- =============================================== -->

Clustering
========================================================
type: section

<!-- ----------------------------------------------- -->

Clustering
========================================================
left: 76%

- Broad set of techniques for finding **subgroups**.
- Observations **within groups are quite similar to each other** and observations **in different groups quite different from each other**.

### Clustering methods

- Partitioning: **k-means clustering**
- Agglomerative: **herarchical clustering**
- Model-based: mixture models

***

<img src="fig/kmeans.jpeg">  
<img src="fig/hierarchical_clust.png">

<!-- ----------------------------------------------- -->

K-means partitioning
========================================================
type: sub-section

<!-- ----------------------------------------------- -->

K-means partitioning
========================================================

- Simple approach to partitioning a data set into **K** distinct,
non-overlapping clusters.
- **K** is specified beforehand.

<img src="fig/kmeans_nr_K.png" style="width:76%;">  
<p style="font-size:60%;">(James et al. 2013)</p>

<!-- ----------------------------------------------- -->

K-means algorithm
========================================================
left: 42%
title: false

## K-means algorithm

- *K* ... number of clusters.  

### The process: 

1. **Randomly** assign each observation to groups 1 to *K*;
2. For each of *K* clusters, derive its **centroid** (midpoint);
3. **Reassign** each observation into a cluster whose centroid is 
the **closest**;
4. Iterate until stability in cluster assignments is reached (*local optima*).

***

<img src="fig/kmeans_algorithm.png" style="width:80%;">  
<p style="font-size:60%;">(James et al. 2013)</p>

<!-- ----------------------------------------------- -->

Some properties of k-means
========================================================

- The need to determine the **number of clusters** beforehand.
- Different **local optima** (stability) can be reached.

<img src="fig/kmeans_optima.png" style="box-shadow:none;">

<!-- ----------------------------------------------- -->

K-means I: Data
========================================================


```r
# load data
data(Fibulae, package = "archdata")
# create matrix
fib <- Fibulae %>% 
  select(
    tot.len = Length, 
    bow.hei = BH
  ) %>% 
  as.matrix()
head(fib)
```

```
     tot.len bow.hei
[1,]     114      24
[2,]      35       7
[3,]      60      15
[4,]      74      26
[5,]      68      23
[6,]      55      15
```
***

```r
plot(fib)
```

![plot of chunk km2](seminar6-figure/km2-1.png)

<!-- ----------------------------------------------- -->

K-means II: Reduce dimensions (PCA)
========================================================


```r
# scale + PCA
fib_pca <- prcomp(scale(fib))
# summary of a PCA
summary(fib_pca)
```

```
Importance of components:
                          PC1    PC2
Standard deviation     1.2183 0.7182
Proportion of Variance 0.7421 0.2579
Cumulative Proportion  0.7421 1.0000
```

***


```r
plot(fib_pca$x)
```

![plot of chunk km4](seminar6-figure/km4-1.png)

<!-- ----------------------------------------------- -->

K-means III
========================================================


```r
fib_km <- kmeans(fib_pca$x, centers = 3)
fib_km
```

```
K-means clustering with 3 clusters of sizes 20, 7, 3

Cluster means:
         PC1          PC2
1  0.6969273  0.004226385
2 -1.0427863  0.565269331
3 -2.2130138 -1.347137671

Clustering vector:
 [1] 3 1 1 2 2 1 1 1 1 1 2 2 1 1 1 1 1 1 1 1 3 2 1 1 2 1 2 1 1 3

Within cluster sum of squares by cluster:
[1] 10.333237  5.144665  2.822428
 (between_SS / total_SS =  68.4 %)

Available components:

[1] "cluster"      "centers"      "totss"        "withinss"     "tot.withinss"
[6] "betweenss"    "size"         "iter"         "ifault"      
```

<!-- ----------------------------------------------- -->

K-means IV:
========================================================


```r
# cluster assignment
fib_km$cluster
```

```
 [1] 3 1 1 2 2 1 1 1 1 1 2 2 1 1 1 1 1 1 1 1 3 2 1 1 2 1 2 1 1 3
```

```r
# create a data frame with clusters
fib_df <- fib_pca$x %>% 
  as.data.frame() %>% 
  bind_cols(
    clust = fib_km$cluster)

head(fib_df, 4)
```

```
         PC1        PC2 clust
1 -2.9817772 -0.3841488     3
2  2.2637725 -1.0265568     1
3  0.1500255 -0.3695002     1
4 -2.1627753  1.1275540     2
```

***


```r
fib_df %>% 
  ggplot(
    aes(PC1, PC2, 
        color = factor(clust))) +
  geom_point(size = 4) +
  theme_minimal()
```

![plot of chunk km7](seminar6-figure/km7-1.png)

<!-- ----------------------------------------------- -->

K-means IV:
========================================================
title: false



<img src="fig/kmeans_out.png">

<!-- ----------------------------------------------- -->

Hierarchical clustering
========================================================
type: sub-section

<!-- ----------------------------------------------- -->

<!-- ----------------------------------------------- -->

<!-- ----------------------------------------------- -->
