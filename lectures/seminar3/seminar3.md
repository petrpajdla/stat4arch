stat4arch
========================================================
author: Petr Pajdla & Peter Tkáč
autosize: true
width: 1920
height: 1080

AES_707: *Statistics seminar for archaeologists*

<!-- <https://support.rstudio.com/hc/en-us/articles/200486468> -->

<!-- =============================================== -->

Seminar 3
========================================================
type: section



`17. 3. 2022`

## Today:
<ul style='color:white;'>
  <li>Organizing projects in R (moved from previous session).
  <li>Reading data into R (readr package, moved from previous session).
  <li>Data visualization, plots for one variable.
  <li>Descriptive stats (mean, sd, median, IQR etc.)
  <li>Data manipulation basics (base R and dplyr package).
  <li>Plotting in ggplot2.
</ul>

<!-- =============================================== -->

Deskriptivní statistika
========================================================
type: section

<!-- ----------------------------------------------- -->

Characterizing centrality
=====================================================
(charakteristika centrální polohy dat)  

**Mean** (průměr)  
   
  > mean(x)
  
   $$\overline{x} = \frac{x_1 + x_2 + \cdots + x_n}{n} = \frac{1}{n} (\sum^n_{i=1}x_i)$$

**Median** (medián)  
  
   > median(x)  
    
- *robustní vůči odlehlým hodnotám*  
- Pro lichý počet hodnot je medián prostřední hodnota, pro sudý počet je medián průměr dvou středních hodnot.

***

<img src="./fig/mean_median.png" style='width:80%;'>

<!-- ----------------------------------------------------------------------- -->
Characterizing dispersion or spread
===================================================
(charakteristika variability dat)  

**Range** (rozpětí)  
   `max(x) - min(x)` nebo `range(x)`

Variance (rozptyl) and **Standard deviation** (směrodatná odchylka)  
   `sd(x)`  
   $$s = \sqrt{s^2} = \sqrt{\frac{\sum(x_i-\overline{x})^2}{n-1}}$$

**Interquartile range** (midspread, IQR)  
   `IQR(x)`  
   *robustní vůči odlehlým hodnotám*

<!------------------------------------------------------------------------- -->

Why look at data then?
=======================================================
*Anscombe's quartet*



```
# A tibble: 4 × 6
  set    `mean(x)` `sd(x)` `mean(y)` `sd(y)` `cor(x, y)`
  <chr>      <dbl>   <dbl>     <dbl>   <dbl>       <dbl>
1 set  1         9    3.32      7.50    2.03       0.816
2 set  2         9    3.32      7.50    2.03       0.816
3 set  3         9    3.32      7.5     2.03       0.816
4 set  4         9    3.32      7.50    2.03       0.817
```

Čtyři sety dat, kdy všechny mají téměř totožné hodnoty popisné statistiky a korelace.

<!------------------------------------------------------------>

Why look at data then?
======================================================
![plot of chunk unnamed-chunk-4](seminar3-figure/unnamed-chunk-4-1.png)

<!------------------------------------------------------------------>

Let's practice?!
========================================================
type: section

<!-- ----------------------------------------------- -->

Practice
=======================================================
- Ukliďte si v Rstudiu
- Stáhněte si dataset ze studijních materiálů (`sem2_datasaurus.csv`);  
   (příp. zde: <https://tinyurl.com/sj5khba>).  
- Vytvořte si nový skript pro následující cvičení.
- Z knihovny načtěte package `tidyverse`.
- Mrkněte na dokumentaci funkce `read_csv()`.
- Jak načíst csv soubor do R?




<!-- ----------------------------------------------------------------------- -->

Visualizing data
========================================================
type: section

<!-- ----------------------------------------------- -->

Data viz
=======================================================

<img src="./fig/minard.png", style='width:80%;'>

(Minard)

<!-- ------------------------------------------------------------------------- -->

Data viz
=======================================================

<img src="./fig/snow.jpg", style='width:40%;'>

(Snow)

Data viz
=======================================================

<img src="./fig/pay_gap.jpg", style='width:40%;'>

(Paygap)

Types of graphs
===========================================================
type: section
<!-- ----------------------------------------------------------------------- -->

Bar chart (sloupcový graf)
===============================================================
Distribuce počtu hodnot kvalitativní proměnné,  
případně diskrétní kvantitativní proměnné.

![plot of chunk unnamed-chunk-6](seminar3-figure/unnamed-chunk-6-1.png)

<!-- ----------------------------------------------------------------------- -->

Histogram
=================================================================================
Distribuce hodnot kvantitativní proměnné.

![plot of chunk unnamed-chunk-7](seminar3-figure/unnamed-chunk-7-1.png)

<!-- ----------------------------------------------------------------------- -->

Density plot
=================================================================

Podobnost s histogramem, vhodný pro porovnávání.

![plot of chunk unnamed-chunk-8](seminar3-figure/unnamed-chunk-8-1.png)

<!-- ----------------------------------------------------------------------- -->

Boxplot (krabicový graf)
==================================================================
Porovnávání dvou a více kvantitativních proměnných  

<img src="./fig/boxplot.png" height="420">

<!-- ----------------------------------------------------------------------- -->

Boxplot (krabicový graf)
==================================================================

![plot of chunk unnamed-chunk-9](seminar3-figure/unnamed-chunk-9-1.png)

<!-- ------------------------------------------------------------------------ -->
ggplot
===================================================================
type: section

<!-- ------------------------------------------------------------------------- -->

ggplot - syntax
=============================================================

<!-- ----------------------------------------------------- -->

Barplot - použité dáta
============================================
incremental: false

```r
library(archdata)
data(EWBurials)
hroby<-data.frame(EWBurials)
head(hroby)
```

```
     Group  North  West         Age  Sex Direction Looking   Goods
011      2  96.96 90.32 Young Adult Male        42     283 Present
014      2 100.20 90.61 Young Adult Male        28     272 Present
015      2 101.74 91.62   Old Adult Male       350     219 Present
016a     2 101.00 90.47 Young Adult Male       335      60  Absent
018      2 101.65 90.46   Old Adult Male         3      86 Present
020      1  95.17 90.53 Young Adult Male       142      21  Absent
```

## Otázky
- aký je pomer mužských a ženských hrobov?
- aké je zastúpenie vekových kategórií medzi pohlaviami?
- líšila sa prítommosť milodarov (1) v závislosti na pohlaví alebo (2) v závislosti na veku?
- sú rozdiely medzi skupinami?

<!-- ----------------------------------- -->

Grafy
===============================================================
incremental: false

```r
p <- ggplot(hroby, aes(x=Sex))
p + geom_bar()
```

![plot of chunk unnamed-chunk-11](seminar3-figure/unnamed-chunk-11-1.png)

<!-- --------------------------------------- -->

Title
========================================================

First column.

***

Second column.

<!-- ----------------------------------------------- -->

Some basics
========================================================

- Two **spaces** at the end of the line break the line.
- HTML can be used to achieve practically anything.

```
<!-- comment -->
*italics*
**bold**
# Header 1 to #### Header 4
![alt  text](fix/path) - inserts figure
<url link> or (alt text)[url link]
`single line/word code`
```

<!-- ----------------------------------------------- -->

Section slide
========================================================
type: section

<!-- ----------------------------------------------- -->

Prompt slide
========================================================
type: prompt

<!-- ----------------------------------------------- -->

Alert slide
========================================================
type: alert
<!-- ----------------------------------------------- -->

