stat4arch
========================================================
author: Petr Pajdla & Peter Tkáč
autosize: true
width: 1920
height: 1080

AES_707: *Statistics seminar for archaeologists*

<!-- <https://support.rstudio.com/hc/en-us/articles/200486468> -->

<!-- =============================================== -->

Seminar 4
========================================================
type: section

`31. 3. 2022`

Today:
<ul style='color:white;'>
  <li>Relationship of two variables (correlation, scatterplots).
  <li>Data manipulation basics (base R and dplyr package).
  <li>Normal distribution.
  <li>Your data sets for the project?
</ul>

<!-- =============================================== -->

Relationship of two variables
========================================================
type: section

<!-- ----------------------------------------------- -->

Correlation
========================================================
incremental: false

- A statistic describing a relationship between two 
**continuous** variables.
- To what degree is a variable *y* explained by *x*?
- Correlation coefficient *r*, from -1 to +1.
- Correlation does **not** imply causation!

- r = 1 -- *strong positive correlation*
- r = 0.5 -- *moderately strong positive correlation*
- r = 0 -- *variables are not correlated*
- r = -0.2 -- *weak negative correlation*
- r = -1 -- *strong negative correlation*

***

- Function `cor(x, y)`


```r
x <- 1:100
```

```r
cor(x, y = 1:100)
```

```
[1] 1
```

```r
cor(x, y = 100:1)
```

```
[1] -1
```

```r
cor(x, y = rnorm(100))
```

```
[1] -0.1134987
```


<!-- ----------------------------------------------- -->

Scatter plot
========================================================

- Plot displying two continuous variables, *x* and *y*.

- *x axis*: explanatory variable, independent, predictor
- *y axis*: dependent variable, response

![plot of chunk unnamed-chunk-5](seminar4-figure/unnamed-chunk-5-1.png)

<!-- ----------------------------------------------- -->

Correlation
========================================================


![plot of chunk unnamed-chunk-7](seminar4-figure/unnamed-chunk-7-1.png)

<!-- ----------------------------------------------- -->

Spurrious correlations 
========================================================

**Correlation does not imply causality!**

<http://www.tylervigen.com/spurious-correlations>

![plot of chunk unnamed-chunk-8](seminar4-figure/unnamed-chunk-8-1.png)

<!-- ----------------------------------------------- -->

Guess the correlation game...
========================================================

<http://guessthecorrelation.com/>

<!-- =============================================== -->

Plots for 2 continuous variables
========================================================
type: section

## Packages

```r
library(archdata)
library(ggplot2)
```

## Data

```r
data(DartPoints)
sipky <- data.frame(DartPoints)
head(sipky,4)
```

```
  Name Catalog     TARL  Quad Length Width Thickness B.Width J.Width H.Length
1 Darl 41-0322 41CV0536 26/59   42.8  15.8       5.8    11.3    10.6     11.6
2 Darl 35-2946 41CV0235 21/63   40.5  17.4       5.8      NA    13.7     12.9
3 Darl 35-2921 41CV0132 20/63   37.5  16.3       6.1    12.1    11.3      8.2
4 Darl 36-3487 41CV0594 10/54   40.3  16.1       6.3    13.5    11.7      8.3
  Weight Blade.Sh Base.Sh Should.Sh Should.Or Haft.Sh Haft.Or
1    3.6        S       I         S         T       S       E
2    4.5        S       I         S         T       S       E
3    3.6        S       I         S         T       S       E
4    4.0        S       I         S         T       S       E
```


Distribution
=========================================================

## Length

```r
p <- ggplot(sipky, aes(Length))
p + geom_histogram(binwidth=5)
```

![plot of chunk unnamed-chunk-11](seminar4-figure/unnamed-chunk-11-1.png)
***
## Width

```r
p <- ggplot(sipky, aes(Width))
p + geom_histogram(binwidth=5)
```

![plot of chunk unnamed-chunk-12](seminar4-figure/unnamed-chunk-12-1.png)

Correlation - 2 variables
===============================================================
Correlation between length and width

```r
p <- ggplot(sipky, aes(Length, Width))
p + geom_point()
```

![plot of chunk unnamed-chunk-13](seminar4-figure/unnamed-chunk-13-1.png)

Correlation - 3 variables
=================================================================
Adding 3th variable (weight) and adjusting size

```r
p <- ggplot(sipky, aes(Length, Width, color=Weight))
p + geom_point(size=3)
```

![plot of chunk unnamed-chunk-14](seminar4-figure/unnamed-chunk-14-1.png)

Observing trend
=======================================================

```r
p <- ggplot(sipky, aes(Length, Width, color=Weight))
p + geom_point(size=3) +
  geom_smooth()
```

![plot of chunk unnamed-chunk-15](seminar4-figure/unnamed-chunk-15-1.png)

Correlation - different models
=====================================
`method = "loess"`

```r
p <- ggplot(sipky, aes(Length, Width, color=Weight))
p + geom_point(size=3) + 
  geom_smooth(method = "loess")
```

![plot of chunk unnamed-chunk-16](seminar4-figure/unnamed-chunk-16-1.png)

***
`method = "lm"`

```r
p <- ggplot(sipky, aes(Length, Width, color=Weight))
p + geom_point(size=3) + 
  geom_smooth(method = "lm")
```

![plot of chunk unnamed-chunk-17](seminar4-figure/unnamed-chunk-17-1.png)
<!-- --------------------------------
Correlation - logarithmic scale
======================================================

```r
p <- ggplot(sipky, aes(Length, Width, color=Weight))
p + geom_point(size=3) +
  geom_smooth() +
  scale_x_log10()+
  scale_y_log10()
```

![plot of chunk unnamed-chunk-18](seminar4-figure/unnamed-chunk-18-1.png)
----------------------------------------------->

Small multiples - 4th variable
====================================================


```r
p <- ggplot(sipky, aes(Length, Width, color=Weight))
p + geom_point(size=3) +
    facet_wrap(~Name, nrow=1)
```

![plot of chunk unnamed-chunk-19](seminar4-figure/unnamed-chunk-19-1.png)

Manipulating data
========================================================
type: section

<!-- ----------------------------------------------- -->

<!-- =============================================== -->

Normal distribution
========================================================
type: section



<!-- ----------------------------------------------- -->

Normal distribution
========================================================

(*bell-shaped curve, Gaussian distribution*)

<img src="./fig/nd_ideal.jpg" height="600">

<!-- ----------------------------------------------------------------------- -->

One sigma
========================================================
<img src="./fig/nd_1sigma.png" height="700">

<!-- ----------------------------------------------------------------------- -->

Two sigma
========================================================
<img src="./fig/nd_2sigma.png" height="700">

<!-- ----------------------------------------------------------------------- -->

Tree sigma
========================================================
<img src="./fig/nd_3sigma.png" height="700">

<!-- ----------------------------------------------------------------------- -->

Normal distribution in different plots
========================================================

![plot of chunk unnamed-chunk-21](seminar4-figure/unnamed-chunk-21-1.png)

<!-- ----------------------------------------------------------------------- -->

Mean and median in normal distribution
========================================================
left: 40%

![plot of chunk unnamed-chunk-22](seminar4-figure/unnamed-chunk-22-1.png)

***

![plot of chunk unnamed-chunk-23](seminar4-figure/unnamed-chunk-23-1.png)

<!-- =============================================== -->

Is my distribution normal?
========================================================
type: sub-section

<!-- ----------------------------------------------------------------------- -->

Is my distribution normal?
========================================================

## Visual aids

- Density plot
- Q-Q plot (quantile-quantile plot)  
   `qqnorm(x)` nebo  
   `ggplot(data, aes(sample = x)) + geom_qq()`
   
## Statistical hypothesis test

- Shapiro-Wilk test  
   `shapiro.test()`
- Kolmogorov-Smirnov normality test

<!-- ----------------------------------------------------------------------- -->

Q-Q plot
========================================================


```r
ggplot(nd, aes(x)) + 
  geom_density()
```

![plot of chunk unnamed-chunk-24](seminar4-figure/unnamed-chunk-24-1.png)

***


```r
ggplot(nd, aes(sample = x)) + 
  geom_qq(alpha = 0.4)
```

![plot of chunk unnamed-chunk-25](seminar4-figure/unnamed-chunk-25-1.png)

<!-- ----------------------------------------------------------------------- -->

Shapiro-Wilk normality test
========================================================

- $H_0$ (null hypothesis): *Values fit normal distribution.*  
- $H_A$ (alternative hypothesis): *Values do not fit normal distribution.*

- **p-value**: *probability* of the event that observed values fit normal distribution 
- p > 0.05: Fail to reject null hypothesis.  
- *Significance level* = 0.05 -- Event occurs in less than 5% of cases


```r
shapiro.test(nd$x)
```

```

	Shapiro-Wilk normality test

data:  nd$x
W = 0.99922, p-value = 0.9598
```

<!-- ----------------------------------------------------------------------- -->

Data distribution shapes
========================================================

<img src="fig/distributions2.png" height=700>

<!-- ----------------------------------------------- -->

Transforming data
========================================================
incremental: false

- Many (!) statistical methods suppose the distribution of data is normal.
- **Parametric** vs **non-parametric** statistical methods.
- Most of (our) real world data is not normal.
- Data are transformed using various methods...

- Natural/Base 10 logarithms: `log10(x)`
- Square root: `sqrt(x)`

- Multimodal distributions?

<!-- ----------------------------------------------- -->

Transformations
========================================================
title: false

<img src="fig/transformations3.png" height=800>

<!-- ----------------------------------------------- -->

Relative position of a data point in a data set
========================================================
type: sub-section

<!-- ----------------------------------------------- -->

Z--Score
========================================================
incremental: false

- Recall what is standard deviation?
- How many **standard deviations** is the data point from the **mean**?

$$z-score = \frac{x_i-\overline{x}}{s}$$

- Why is this useful?
- What if we count z-scores for the whole dataset?

<!-- ----------------------------------------------- -->

Z--Score
========================================================
title: false

<img src="fig/normal_dist.png" height=1000>

<!-- ----------------------------------------------- -->
