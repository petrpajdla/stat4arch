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
[1] -0.1651106
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

Data transformation
===========================
type: section

## Package
- `dplyr`

## Functions
- `select`
- `arrange`
- `filter`
- `summarise`
- `%>%`
- `mutate`

Select
====================================
Lets create a smaller dataframes from _selected_ variables

`select`























































```
Error in select(sipky, Name, Catalog, Length, Width, Weight) : 
  could not find function "select"
```
