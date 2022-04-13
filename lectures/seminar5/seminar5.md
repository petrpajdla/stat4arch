stat4arch
========================================================
author: Petr Pajdla & Peter Tkáč
autosize: true
width: 1920
height: 1080

AES_707: *Statistics seminar for archaeologists*

<!-- <https://support.rstudio.com/hc/en-us/articles/200486468> -->

<!-- =============================================== -->

Seminar 5
========================================================
type: section

`14. 4. 2022`

Today:
<ul style='color:white;'>
  <li>Reproducibility
  <li>Rmarkdown
  <li>Your datasets
</ul>


<!-- =============================================== -->

RMarkdown
=========================================================
type: section

Balíky / Packages
========================================================

```r
install.packages("rmarkdown")
library(rmarkdown)

install.packages("knitr")
library(knitr)
```
<!-- je potreba tam dávať ten knitr? --> 

Rmarkdown - what is it?
================================================

<img src<img src="./fig/fig1.png" style='width:100%;'>


Rmarkdown - what is it?
================================================

<img src="./fig/fig2.png" style='width:100%;'>



Types of content
======================================================
- __YAML__ header separated by: `---` and bearing info about author, date, type of output,...

<img src="./fig/fig6.png" style='width:30%;'>

- __code "chunk"__ separated by: ` ```{r}` and ` ``` ` 

<img src="./fig/fig7.png" style='width:30%;'>

- __plain text__

<img src="./fig/fig8.png" style='width:30%;'>

<!-- nefunguje vyznačenie chunku --> 

Chunks - place for your code
========================================================
key shortcut: `ctrl + left alt + i`

## imput:
<img src ="./fig/fig3.png" style='width:50%'>

## output:

```r
a <- 10+5
a
```

```
[1] 15
```

Chunks - options I.
==================================================
- deauflty, both code and result are shown in the result file. You can change this by adding options into the chunk -  `{r, <option>}`

## Options (examples):
- `echo = FALSE` 
  - __result is shown__ but the __code is not shown__ in the result file
  - suitable for e.g. codes of graphs, when you just want to show the graph,...

- `include = FALSE`
  - __neither result nor code are shown__ in result file
  - suitable for e.g. loading packages, basic manipulation of the data,...

Chunks - options II.
====================================================
- `fig.cap = "..."` adds caption to the graphics 

- see the rest of the options at https://rmarkdown.rstudio.com/lesson-3.html

Inline codes
============================================================
## input:
<img src ="./fig/fig4.png" style='width:70%'>

##  output:
<img src ="./fig/fig5.png" style='width:70%'>

Tables using `knitr::kable`
=========================================




```r
library(knitr)
kable(sipky[1:5,1:10], caption = "DartPoints dataset")
```



Table: DartPoints dataset

|Name |Catalog |TARL     |Quad  | Length| Width| Thickness| B.Width| J.Width| H.Length|
|:----|:-------|:--------|:-----|------:|-----:|---------:|-------:|-------:|--------:|
|Darl |41-0322 |41CV0536 |26/59 |   42.8|  15.8|       5.8|    11.3|    10.6|     11.6|
|Darl |35-2946 |41CV0235 |21/63 |   40.5|  17.4|       5.8|      NA|    13.7|     12.9|
|Darl |35-2921 |41CV0132 |20/63 |   37.5|  16.3|       6.1|    12.1|    11.3|      8.2|
|Darl |36-3487 |41CV0594 |10/54 |   40.3|  16.1|       6.3|    13.5|    11.7|      8.3|
|Darl |36-3321 |41CV1023 |12/58 |   30.6|  17.1|       4.0|    12.6|    11.2|      8.9|


Markdown syntax
=========================================
- presented during live coding
- see for https://www.rstudio.com/wp-content/uploads/2015/03/rmarkdown-reference.pdf futher details



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

