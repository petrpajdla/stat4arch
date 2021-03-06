<style>
.small-code pre code {
  font-size: 1.2em;
}

p.small-text {
  font-size: 0.8em;
}
</style>

stat4arch
========================================================
author: Petr Pajdla & Peter Tkáč
autosize: true
width: 1920
height: 1080

AES_707: *Statistics seminar for archaeologists*

<!-- <https://support.rstudio.com/hc/en-us/articles/200486468> -->

<!-- =============================================== -->

Course info
========================================================
type: prompt

- Course website: <https://petrpajdla.github.io/stat4arch/>

- To **pass** the course:  
    - be active (and present) during the bi-weekly on-site sessions,  
    - complete the semestral project assignment.

<!-- =============================================== -->

Seminar 1
========================================================
type: section

`17. 2. 2022`

Today:
<ul style='color:white;'>
  <li>Introduction to quantitative methods in archaeology.
  <li>Introduction to the R programming language and environment.
  <li>Data organization and tidy data.
</ul>

<!-- =============================================== -->

Quantitative methods in archaeology
========================================================
type: section

<!-- ----------------------------------------------- -->

<!-- místo pre Peťa -->

<!-- =============================================== -->

Maths and archaeology? Why?
========================================================
type: prompt
(brainstorming)

<!-- ------------------------------------------- -->

R programming language
========================================================
type: section

<!-- ----------------------------------------------- -->

What is R?
========================================================
left: 10%

<img src="./fig/Rlogo.png" style='box-shadow:none; width:100%;'>

***

- Scripting language and environment for statistical computing and graphics.
- Open source, free software.
- Alternatives: Python, SQL, JavaScript etc.
- *Clicking* alternatives: Statistica, PAST etc.  

<https://www.r-project.org/>  
<https://cran.r-project.org/>

<!-- ----------------------------------------------- -->

RStudio
========================================================
left: 20%

<img src="./fig/rstudio-logo.png" style='box-shadow:none; width:100%;'>

***

- IDE (Integrated Development Environment) for R (supports also other languages).

*RStudio is a set of integrated tools designed to help you be more productive with R. It includes a console, syntax-highlighting editor that supports direct code execution, and a variety of robust tools for plotting, viewing history, debugging and managing your workspace.*

<https://rstudio.com/>

<!-- ----------------------------------------------- -->

RStudio IDE
========================================================
right: 30%
title: false

<img src="./fig/rstudio-ide.png" style='width:100%;'> 

***

### RStudio IDE

- Editor is where you view and edit your scripts.
- Console shows the output after you execute the code.
- Environment lists available objects.

And much more...

<!-- ----------------------------------------------- -->

Console
========================================================
class: small-code

```r
R version 4.1.2 (2021-11-01) -- "Bird Hippie"
Copyright (C) 2021 The R Foundation for Statistical Computing
Platform: x86_64-pc-linux-gnu (64-bit)
*
R is free software and comes with ABSOLUTELY NO WARRANTY.
You are welcome to redistribute it under certain conditions.
Type 'license()' or 'licence()' for distribution details.

  Natural language support but running in an English locale

R is a collaborative project with many contributors.
Type 'contributors()' for more information and
'citation()' on how to cite R or R packages in publications.

Type 'demo()' for some demos, 'help()' for on-line help, or
'help.start()' for an HTML browser interface to help.
Type 'q()' to quit R.

> 
```

<!-- ----------------------------------------------- -->

R is a smart calculator
========================================================
class: small-code
incremental: false


```r
2 + 40
```

```
[1] 42
```


```r
((2022 * 2) - 1 / (40 + 2)^3) / 2
```

```
[1] 2022
```


```r
round(6.48^2)
```

```
[1] 42
```



```r
sqrt(1764)
```

```
[1] 42
```


```r
8 * 10^10
```

```
[1] 8e+10
```

<!-- ----------------------------------------------- -->

Console vs script
========================================================
title: false

### Console

<img src="./fig/console.png" style='width:68%;'>

- Console evaluates the input immediately after hitting **Enter** and returns the output.

***

### Script

<img src="./fig/script.png" style='width:68%;'>

- Script documents the code, i.e. the sequence of commands.
- Script is a *plain* text document.

<p class=small-text>
<b>ctrl + enter</b> send line of code from script to console
</p>

<!-- ----------------------------------------------- -->

Notion of functions and objects
========================================================
incremental: false

### Object

- *Everything* is an object.
- Contains data.
- Some objects are already populated with something...


```r
pi
```

```
[1] 3.141593
```


```r
pi + 1
```

```
[1] 4.141593
```


***

### Function

- Ends with parentheses.  
  `function-name(args...)`
- **Arguments** go in the parentheses.
- Does something.


```r
round(x = pi)
```

```
[1] 3
```


```r
round(x = pi, digits = Inf)
```

```
[1] 3.141593
```

<!-- =============================================== -->

Data, databases and data organization
========================================================
type: section

<!-- ----------------------------------------------- -->

What is database?
========================================================
type: prompt
(Brainstorming)
<!-- ----------------------------------------------- -->

Relational database - basic terms
========================================================
incremental: false
<img src="./fig/database_example_1.png" style='width:100%;'>
<!-- ----------------------------------------------- -->

Relational database - basic terms
========================================================
incremental: false
<img src="./fig/database_example.png" style='width:100%;'>

- __variable__ (_proměnná_ / _atribut_) - napr. hmotnosť keramického fragmentu
- __observation__ / __object__ (_entita_ / _záznam_) - napr. konkrétny keramický fragment
- __value__ (_hodnota_)
- __primary key__ / __unique ID__ (_primární klíč_)

<!-- ---------------------------------------------------- -->

Tidy data
========================================================

<img src="fig/tidy_data.png">

Types of variables
========================================================
## Categorical
- __dichotomies__ (_dichotomická_) - prítomnosť alebo neprítomnosť nejakého javu ("Y/N")
- __nominal__ (_nominální_) - archeologické datovanie ("neolit"), číslo objektu, keramický typ
- __ordinal__ / __rank__ (_ordinální, pořadová_) - tlupa / kmeň / náčelníctvo / štát, alebo: komponenta / sídelný areál / nadkomunitný areál  

## Numeric
- __discrete__ (_diskrétní_) - môžu byť len _celé_ čísla - napr. počet lokalít, počet bronzových spôn
- __continuous__ (_spojité / metrické_) - môže byť akékoľvek _reálne_ číslo - hmotnosť ker. fragmentu, dĺžka železného meča

- __interval__ (_intervalové_) - numericky vyjadrujú vzdialenosť na vyjadrenie hierarchického vzťahu, nemajú ale zmysluplný nultý bod, umožňujú relatívne porovnávanie ale nie kalkulácie (napr. BC/AD - rozdiel medzi 400AD a 800AD je 400 rokov, 400AD ale nieje 2 krát staršie než 800AD   )
- __ratio__ (_poměrové_) - na rozdiel od intervalových premenných umožňujú kalkulácie (napr. vek - objekt starý 1000 rokov je 2krát starší než objekt starý 500; dĺžka meča,...)
	
<!-- --------------------------------------------- -->

Tidy data
========================================================
incremental: false
## What's wrong?
<img src="./fig/database_fails.png" style='width:100%;'>

Basic tidy data principles
========================================================

- one variable in one column
- one observation in one row
- one value in one cell
- backup your data!
- be consistent!

<https://kbroman.org/dataorg/>

<!-- ----------------------------------------------- -->

<!-- =============================================== -->
