stat4arch
========================================================
author: Petr Pajdla & Peter Tkáč
autosize: true
width: 1920
height: 1080

AES_707: *Statistics seminar for archaeologists*

<!-- <https://support.rstudio.com/hc/en-us/articles/200486468> -->

<!-- =============================================== -->

Seminar 1
========================================================
type: section

`17. 2. 2022`

Today:
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
   `mean(x)`  
   $$\overline{x} = \frac{x_1 + x_2 + \cdots + x_n}{n} = \frac{1}{n} (\sum^n_{i=1}x_i)$$

**Median** (medián)  
   `median(x)`  
    *robustní vůči odlehlým hodnotám*  
    Pro lichý počet hodnot je medián prostřední hodnota, pro sudý počet je medián průměr dvou středních hodnot.

<!-- ----------------------------------------------------------------------- -->



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

