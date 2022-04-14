## Analyzing archaeological data in R

[Syllabus](#syllabus) `|` [Project](#project) `|` [Topics](#topics) `|` [Resources](#resources) `|` [Notes](#notes)

Welcome to [AES_707](https://is.muni.cz/predmet/phil/AES_707) Statistics seminar
for archaeology students at [Department of Archaeology and Museology](https://archeo-muzeo.phil.muni.cz/),
Masaryk University.
The course is taught by Petr Pajdla and Peter Tkáč.

Information given here applies to spring semester 2022, the page will be
continuously updated throughout the semester.
The course was taught also in 2020.

- Each odd Thursday, 14:00 -- 17:40 (will include breaks).
- Room [L11](https://www.phil.muni.cz/o-nas/kde-nas-najdete/kancelar-28397)
  (computers are provided in the room, you can use your own laptop though).
- 3 ECTS credits, i.e.  approx. 75 h. of workload, seminars take up approx. 25 h.
- You will work on a [project](#project) of your own to complete the
  course.

--------------------------------------------------------------------------------

## Syllabus

[Week 1](#seminar-1) `|` [Week 2](#seminar-2) `|` [Week 3](#seminar-3) `|`
[Week 4](#seminar-4) `|` [Week 5](#seminar-5) `|` [Week 6](#seminar-6) `|`
[Week 7](#seminar-7)

Here is a brief outline of topics covered each session with suggested readings
and assignments. The assignments are to be completed after each session if not
stated otherwise. Some are labeled `[optional]`, these contain either materials
useful if you are struggling with the topic and want to do some more practice or
cover mostly advanced topics and build up on what was explained in the lecture.
Assignments labeled with `[project]` are related with the semestral [project](#project).

--------------------------------------------------------------------------------

### Seminar 1
(17. 2. 2022)

Introductory session, we will go through basic concepts and have a first look at R.
- Intro on quantitative methods in archaeology.
- Intro to [R](https://www.r-project.org/) programming language, navigating
  [RStudio](https://www.rstudio.com/) IDE.
- Math operations in R, basic notion of functions and objects.
- Organizing your data and tidy data.
- Databases and types of variables (quantitative, qualitative).

Slides are [here](https://rpubs.com/knytt/stat4arch_2022-02-17).

#### Assignment
- Read chapters **1 Quantifying Archaeology** and **2 Data** in
  *Quantitative analysis in archaeology* book by VanPool and Leonard (2011).
- `[project]` Think about a dataset you will use for the [project](#project) assignment.
  This could be your own data you are collecting for a different project of your
  own (e.g. your thesis) or a random published dataset you find online, check the
  [Get the data](#get-the-data) section below for some more information.
- `[optional]` Read chapter **One Introduction** in
  *Quantifying archaeology* book by Stephen Shennan and/or
  chapter **1. Introduction** in
  *Quantitative Methods in Archaeology* book by David L.
  Carlson (see [Resources](#resources) for details).
  These give a general overview on why to use
  quantitative/computational methods in archaeology.

--------------------------------------------------------------------------------

### Seminar 2
(3. 3. 2022)

This session will be focused on getting to know how to code in R and do common
operations on data. We will practice a lot to get to know R well.
- R data types.
- Missing values.
- R objects (vector, matrix, data frame) and sub-setting.
- Getting help in R.
- Notion of packages in R.

Slides are [here](https://rpubs.com/knytt/stat4arch_2022-03-03) and example files
for reading data into R exercise are [here](https://1url.cz/@stat4arch01).  

#### Assignment
- Go through [this](https://rstudio.cloud/learn/primers/1.2) short interactive
  course on basic programming in R.
- `[project]` Have the data ready for the next lecture, we will do a short
  show-and-tell session to get to know all the datasets. Also please send us
  either the whole dataset or at least a sample so we can check what kind
  of data you will be using.

--------------------------------------------------------------------------------

### Seminar 3
(17. 3. 2022)

Third session is focused on reading and creating basic types of plots and
understanding basic summaries of quantitative variables.
- Organizing projects in R (moved from previous session).
- Reading data into R (`readr` package, moved from previous session).
- Data visualization, plots for one variable.
- Descriptive stats (mean, sd, median, IQR etc.)
- Plotting in `ggplot2`: plots for one variable.

Script with code for the analysis of one continuous variable is
[here](https://github.com/petrpajdla/stat4arch/blob/main/lectures/seminar3/plots_quantitative_vars.R)
and slides are [here](https://rpubs.com/knytt/stat4arch_2022-03-17).

#### Assignment
- Complete [this](https://rstudio.cloud/learn/primers/1.1) interactive course on
  data visualization.
- `[project]` Have your data sets ready. Be sure what part you want to use and how.
  If you are using a database, export the part you want to analyze as a flat file.
- `[optional]` Flick through [Make a plot](https://socviz.co/makeplot.html#makeplot)
  chapter from *Data Visualization* book by K. J. Healy. It explains how plotting
  with `ggplot2` package works.

--------------------------------------------------------------------------------

### Seminar 4
(31. 3. 2022)

This lecture we will look back at what we learned so far and we will build
upon that and learn various ways of how to clean and manipulate data.
- Data manipulation with `dplyr` package.
- Relationship of two variables: scatter plot and correlation.
- Normal distribution.

Slides are [here](https://rpubs.com/knytt/stat4arch_2022-03-31).

#### Assignment
- If you did not read [Make a plot](https://socviz.co/makeplot.html#makeplot)
  chapter from *Data Visualization* book by K. J. Healy yet, do so now to review
  how to create plots with `ggplot2`.

--------------------------------------------------------------------------------

### Seminar 5
(14. 4. 2022)

In this session we will focus on explaining reproducibility, good practice
regarding data and code management and how to use RMarkdown markup language to
create documents combining text, code etc.
- Intro on Reproducibility.
- Using [RMarkdown](https://rmarkdown.rstudio.com/).
- **Your data** for projects presentations.

Slides are [here](https://rpubs.com/knytt/stat4arch_2022-04-14).

#### Assignment
- Read [Get started](https://socviz.co/gettingstarted.html#gettingstarted) chapter
  from *Data Visualization* book by K. J. Healy after the lecture. This chapter
  explains writing in plain text using RMarkdown and wraps up basics of RStudio
  IDE and R including reading data and plotting.
- `[optional]` If you still have problems understanding how RMarkdown works or
  simply want to learn more, go through [this](https://rmarkdown.rstudio.com/lesson-1.html)
  short interactive course by RStudio.
- `[optional]` Have a look at articles on reproducibility in archaeology by
  Ben Marwick (see [resources](#resources) section).


--------------------------------------------------------------------------------

<!--
### Seminar 6
(28. 4. 2022)

- Intro on multivariate stats.
- Methods of dimensionality reduction (PCA).
- Clustering (hierarchical, k-means)

#### Assignment

--------------------------------------------------------------------------------

### Seminar 7
(12. 5. 2022)

Advanced topics?

#### Assignment

--------------------------------------------------------------------------------
-->

## Project

To pass the course you will have to work on a small project. Group/pair cooperation
is possible, but each student has to submit his/her own report on the analysis.
There are two options, you can choose to work either on your own dataset or use
an existing published data.

### Get the data
Although the first step in most of the analysis would be creating the research
question(s), we assume our questions and goals are already set and skip to the step
where we get the data suitable to answer our questions...

#### (A) Working with your own dataset
- You can choose to use your own data. This is especially useful if you are
  working on your BA/MA/PhD thesis, an article or so and want to analyze the
  data collected for the given work.
- This option is easier because you probably know what your dataset contains and
  what each variable means, how it was collected etc.

#### (B) Using an existing dataset
- Find a suitable dataset online, scrape a website, get it in a book,
  anything that comes to mind, be creative.
  Bear in mind that the dataset needs to contain a mixture of
  quantitative and qualitative variables. It can be organized as a table, then
  the work is easier for you. If it is a database, we can give you a hand with
  data prep.
- We recommend to look in the
  [Journal of Open Archaeology Data](https://openarchaeologydata.metajnl.com/).
  Datasets published here have clear use conditions (license), are deposited
  in a suitable repository and should be well documented.
- If you choose to use a dataset you found anywhere else (or web scraped etc.)
  please make sure that it is easily accessible and suitable for the analysis.

### Get to know the data
- Make sure you know where your data is and how is it stored.
- Make sure you know what each variable means, what type of data does it contain etc.
- The dataset should contain at least several quantitative and qualitative variables.

### Report template

RMarkdown template for the project report is [here](https://github.com/petrpajdla/stat4arch/blob/7e6d4d67b6e13a5208512951f92751287f22495e/project/project_template.Rmd).
Create a new RMarkdown file (`.Rmd`), copy and paste the contents of the template
in your file, do your changes, write your report and push the `Knit` button.
Follow the instructions in the template to work on your project.

### How to submit the report

Feel free to contact us if you need any help or assistance during the work on
your project. Simply send us both the source `.Rmd` file and the `HTML` output
with your questions and we will address the problem either directly or in class.

--------------------------------------------------------------------------------

## Topics
Various topics covered in the course are listed here.

### Data
#### Variable types

### Stats
#### Descriptive statistics
- Characterizing central tendency and spread of data
  - Plots for one variable
    (bar chart, histogram and density plot)
  - Numerical summaries
    (mean & standard deviation, median & interquartile range)
- Characterizing relationships between variables
  - Plots for comparing variables
    (boxplot, scatterplot)
  - Correlation

#### Data distributions
- Normal distribution
  - Z-score and data transformations

#### Multivariate methods
- Dimensionality reduction
  - PCA
  - Biplot
- Clustering
  - Hierarchical clustering
  - K-means clustering

--------------------------------------------------------------------------------

## Resources
Here is a non exhaustive list of resources and links we find useful.
These cover various topics and most are openly available online.
We expect you to be creative and search (not only) through these resources if
you get stuck with your project or find any topics difficult to understand.
If you find it hard to get access to any of the articles or books mentioned here,
do not hesitate contacting us. Definitely do not use websites like Sci-Hub or
Library Genesis that seem to provide scientific knowledge to all. The King of
the Potato People prohibits this.

### Quantitative and digital archaeology
- Carlson, D. L. 2017: *Quantitative Methods in Archaeology Using R.*
  Cambridge: Cambridge University Press.
- VanPool, TL and Leonard, RD. 2011. *Quantitative analysis in archaeology.* Chichester:   Wiley-Blackwell.
- Drennan, R. D. 2010: *Statistics for Archaeologists: A common sense approach.*
  New York: Springer.
- Baxter, M. 2003: *Statistics in Archaeology*. London: Wiley.
- Fletcher, M., Lock, G. R. 1994: *Digging Numbers: Elementary statistics for archaeologists.*
  Oxford: Oxbow.
- Shennan, S. 1988: *Quantifying Archaeology.* Edinburgh: Edinburgh University Press.

<!--
- [Open Digital Archaeology Textbook](https://o-date.github.io/) by Shawn Graham et al.
-->

<!--
### Statistics
- [An Introduction to Statistical Learning](https://www.statlearning.com/) by
  Gareth James, Daniela Witten, Trevor Hastie and Rob Tibshirani.
  Great resource to learn more, way advanced than how the subject is explained in
  this course though.
-->

### R programming language and environment
- [R for Data Science](https://r4ds.had.co.nz) by Hadley Wickham and Garret Grolemund.
- [Data Visualization. A practical introduction](https://socviz.co/) by Kieran Healy.
- [CRAN Task View](https://github.com/benmarwick/ctv-archaeology) is a list of
  R packages useful in archaeology maintained by Ben Marwick.
  There is also a list of articles using R in the analysis with data and code
  published.

#### Where to look for help
- [RStudio cheatsheets](https://www.rstudio.com/resources/cheatsheets/), especially
  data visualization, transformation, tidying and import cheatsheets will come in useful.
- Search through [Stack Overflow](https://stackoverflow.com/questions/tagged/r).
  Find some tips on asking good questions and providing minimal reproducible examples
  in this [thread](https://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example)
  and in [Advanced R](http://adv-r.had.co.nz/Reproducibility.html) book by Hadley Wickham.

### Reproducibility
- Marwick, B. 2017: Computational Reproducibility in Archaeological Research:
  Basic Principles and a Case Study of Their Implementation.
  *Journal of Archaeological Method and Theory* 24(2): 424–450.
  DOI: [10.1007/s10816-015-9272-9](https://doi.org/10.1007/s10816-015-9272-9).
- Marwick, B., Boettiger, C. and Mullen, L. 2018: Packaging Data Analytical Work
  Reproducibly Using R (and Friends). *The American Statistician* 72(1): 80–88.
  DOI: [10.1080/00031305.2017.1375986](https://doi.org/10.1080/00031305.2017.1375986).

#### Data management
- Karl Broman's [guide](https://kbroman.org/dataorg/) on how to organize data in
  spreadsheets. The same as an article, DOI: [https://doi.org/gdz6cm](https://doi.org/gdz6cm).
- Jenny Bryan's [slides](http://www2.stat.duke.edu/~rcs46/lectures_2015/01-markdown-git/slides/naming-slides/naming-slides.pdf)
  on naming things.
- Hadley Wickham's paper on tidy data, DOI: [https://doi.org/10.18637/jss.v059.i10](https://doi.org/10.18637/jss.v059.i10).

#### RMarkdown and scientific writing
- *British Ecological Society* has a nice series of [Guides to Better Science](https://www.britishecologicalsociety.org/publications/guides-to/)
  covering various topics including [Reproducible Code](https://www.britishecologicalsociety.org/wp-content/uploads/2019/06/BES-Guide-Reproducible-Code-2019.pdf?utm_source=web&utm_medium=web&utm_campaign=better_science)
  and [Data Management](https://www.britishecologicalsociety.org/wp-content/uploads/2019/06/BES-Guide-Data-Management-2019.pdf?utm_source=web&utm_medium=web&utm_campaign=better_science).
- A short [guide](https://github.com/benmarwick/atom-for-scholarly-writing-with-markdown)
  by Ben Marwick on how to setup Atom (this could be any text editor) and Zotero
  (citation management software).
- [The Plain Person’s Guide to Plain Text Social Science](https://plain-text.co/)
  by Kieran Healy.

### R as a GIS and spatial analysis

- [Geocomputation with R](https://geocompr.robinlovelace.net/index.html) book by Robin Lovelace, Jakub Nowosad, and Jannes Muenchow.

### Other links and tools
- [Open-archaeo](https://open-archaeo.info/) is a list of open source archaeological
  software and resources maintained by Zack Batist.

--------------------------------------------------------------------------------

## Notes

#### Special characters and keyboard shortcuts
Writing special characters on a Czech keyboard can be difficult sometimes.
Here is a short cheat sheet with the most frequent ones.

| Character | Shortcut |
|---|-----------|
| # | Alt + 35  |
| $ | Alt + 36  |
| & | Alt + 38  |
| ^ | Alt + 94  |
| ~ | Alt + 126 |

#### Basic RStudio keyboard shortcuts

| Shortcut |   |
|---------|-----------|
| Alt + - | `<-` |
| Ctrl + Enter | evaluates the given line |
| Ctrl + Shift + c | comments the line (#) |
| Ctrl + Shift + r | adds a section |
