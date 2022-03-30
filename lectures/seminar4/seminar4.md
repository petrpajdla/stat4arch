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
[1] 0.08644273
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

Scatterplots
========================================================
type: sub-section

<!-- ----------------------------------------------- -->

<!-- =============================================== -->

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

![plot of chunk unnamed-chunk-10](seminar4-figure/unnamed-chunk-10-1.png)

<!-- ----------------------------------------------------------------------- -->

Mean and median in normal distribution
========================================================
left: 40%

![plot of chunk unnamed-chunk-11](seminar4-figure/unnamed-chunk-11-1.png)

***

![plot of chunk unnamed-chunk-12](seminar4-figure/unnamed-chunk-12-1.png)

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

![plot of chunk unnamed-chunk-13](seminar4-figure/unnamed-chunk-13-1.png)

***


```r
ggplot(nd, aes(sample = x)) + 
  geom_qq(alpha = 0.4)
```

![plot of chunk unnamed-chunk-14](seminar4-figure/unnamed-chunk-14-1.png)

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
W = 0.99914, p-value = 0.9346
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
