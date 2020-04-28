---
title: "Format and shape your data in R with the tidyverse"
output: 
  html_document: 
    toc_depth: 6
    highlight: textmate
    keep_md: yes
---



## Setup  

This scenario is built using the following commands in the Terminal pane in RStudio. 

```bash
# create a new scenario
? Friendly url:  format-shape-data
? Scenario Title:  Format and shape your data in R with the tidyverse
? Scenario Description:  Quickly wrangle your data with the tidyr and dplyr packages from the tidyverse
? Difficulty Level:  Intermediate
? Estimated time: (Please specify in minutes or hours e.g. 2 hours) 40
? Number of Steps (Not including intro & finish):  12
? Image:  rlang:3.4
? Layout:  2x Terminal Split
```

The following folder was created from these commands. 


```
#> format-shape-data
#> ├── finish.md
#> ├── index.json
#> ├── intro.md
#> ├── step1.md
#> ├── step10.md
#> ├── step11.md
#> ├── step12.md
#> ├── step2.md
#> ├── step3.md
#> ├── step4.md
#> ├── step5.md
#> ├── step6.md
#> ├── step7.md
#> ├── step8.md
#> └── step9.md
```

We can see all `steps`, the `intro`, and `finish` markdown files. There is also an `index.json` file for managing all the steps in the Katacoda environment.

## Markdown syntax (Katacoda)

Katacoda comes with it's own flavor of Markdown, which you can learn more about [here.](https://katacoda.com/scenario-examples/scenarios/markdown-extensions). The main thing to know is that there are `execute` and `copy` extensions, which you can use in the markdown to indicate whether Katacoda should copy or run the code inside the R REPL.


## Learner personas

The learner personas for this scenario are: 

1. Horatio is an executive at a tech company who wants to learn more about 

2. Judy is a product manager at a start-up...

3. Andrew is a graduate student in college...

***

### Intro

The introduction for this scenario is stored in the following file:


```
#> format-shape-data
#> └── intro.md
```


~~~

# Getting your data into the correct shape 

We rarely collect data in a way that can be immediately analyzed or visualized. "Wrangling," "munging," or "cleaning" are the steps to prepare data for a table, graph, algorithm, or model. These terms might sound like they're referring to tedious, menial work, but data wrangling is such a common task that most data scientists [consider it up to 80% of their job](https://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html). 

This scenario will introduce how to use R to format and shape (or *reformat* and *reshape*) your data. We will cover moving columns to rows (and vice versa), changing variables from one type (or class) to another, calculating and creating new columns from existing columns, and how to remove unneeded columns or rows from your data set.

## Packages and libraries

In this first exercise, we'll be using [`dplyr`](https://dplyr.tidyverse.org/), a package from the [`tidyverse`](https://www.tidyverse.org/).

~~~

### step 1 (install and load packages)

The `step1` file starts the scenario off an intro to R packages (the `base::library()` function). The markdown for the `step1.md` file is below. 


```
#> format-shape-data
#> └── step1.md
```


~~~

# Getting started in R

Launch an R console by clicking here -> `R`{{execute}}

You are looking at the R [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) (read-eval-print-loop) katacoda has designed to run R in our browser. 

## R: a rapid overview

R is an object-oriented, functional programming scripting language for data manipulation, graphics, statistics, and machine learning. Most of these terms will only matter to computer scientists, but they're here if you'd like to look them up later. 

## Using R packages 

We will be using the popular `dplyr` package for data manipulation. `dplyr` is part of the `tidyverse,` which is a suite of packages pioneered by RStudio's Chief Scientist [Hadley Wickham](http://hadley.nz/).  

The `tidyverse` contains multiple packages. All packages in the `tidyverse` work well together because they center around a common thread of [tidy data](https://vita.had.co.nz/papers/tidy-data.pdf). 

Install the `tidyverse` package (this requires an internet connection outside of Katacoda).

```
install.packages("tidyverse")
```

Load the package with the `base::library()` function.

```
library(tidyverse)
```

R is an object-oriented and functional programming language, which means objects and functions make up the majority of R's grammar and syntax. When we load data into R, these data get stored in a data object. To do things to any data object (manipulate, analyze, visualize, model, etc.), we'll need to use functions. We can write custom functions, or we can use one of the over 10,000 user-written packages available on [CRAN](https://cran.r-project.org/). 

### Using functions

If we want to use a function from a package, the syntax for doing this is `package::function()` 

For example, below, we'll use the `tidyverse_logo()` function from the `tidyverse` package to view the awesome logo. 

```
tidyverse::tidyverse_logo()
```{{execute}}

~~~

## step 2 (tribble)



```
#> format-shape-data
#> └── step2.md
```


This step loads the data into R (using the `tibble` package). 


```r
# datapasta::tribble_paste(fivethirtyeight::bob_ross %>%
#   dplyr::select(title, bushes, clouds) %>% 
#   utils::head(5))
```


```r
SmallBobRoss  <- tibble::tribble(~title, ~bushes, ~clouds,
                  "A WALK IN THE WOODS",      1L,      0L,
                         "MT. MCKINLEY",      0L,      1L,
                         "EBONY SUNSET",      0L,      0L,
                          "WINTER MIST",      1L,      1L,
                         "QUIET STREAM",      0L,      0L)
```

~~~

# Creating data

It's hard to learn any of R's capabilities without some data. One quick and easy way to get data into R is to create the data 'by hand.' We can build a data set with the [`tibble::tribble()`](https://tibble.tidyverse.org/reference/tribble.html) function. The tibble we'll create is a small sample from the [`bob_ross`](https://fivethirtyeight.com/features/a-statistical-analysis-of-the-work-of-bob-ross/) dataset from the `fivethirtyeight` package in R. Bob Ross was the host of [The Joy of Painting](https://en.wikipedia.org/wiki/The_Joy_of_Painting), a painting educational program from 1980 - 1994.

A description of these variables is below:

+ `episode_num`: Episode number

+ `title`: Title of episode

+ `bushes`: Present (`1`) or not (`0`)  

+ `clouds`: Present (`1`) or not (`0`)


These data are stored as a [comma-separated values](https://en.wikipedia.org/wiki/Comma-separated_values) file on Github (see below). 

```
title, bushes, clouds
A WALK IN THE WOODS,1,0
MT. MCKINLEY,0,1
EBONY SUNSET,0,0
WINTER MIST,1,1
QUIET STREAM,0,0
```

The `tibble::tribble()` function takes column names preceded by the tilde (i.e. `~column`), then get separated by commas (`~column1`, `~column2`, `~column3`). Then `tibble::tribble()` reads the data starting on the second line, similar to the way the actual data are stored. 

## Tibbles 

The code below creates `SmallBobRoss` from the data above in the R environment. 

```
SmallBobRoss  <- tibble::tribble(~title, ~bushes, ~clouds,
                  "A WALK IN THE WOODS",      1L,      0L,
                         "MT. MCKINLEY",      0L,      1L,
                         "EBONY SUNSET",      0L,      0L,
                          "WINTER MIST",      1L,      1L,
                         "QUIET STREAM",      0L,      0L)
```{{execute}}


There are a few things to pay attention to in the code above: 

1. The assignment operator `<-` is used to create the `SmallBobRoss` tibble, which is a data object   
2. The `title`s in quotations (i.e. `"A WALK IN THE WOODS "`) creates a different kind of variable than the other numerical variables (like `episode_num` and `bushes`)  

Tibbles are rectangular data objects. They have columns and rows for storing data, similar to a spreadsheet in Excel. Access the help file (enter `??tibble::tribble` in the R console) or read the documentation on the [tibble website](https://tibble.tidyverse.org/) to see how this function works.


To view the contents of `SmallBobRoss`, we can enter the name into the console, and a preview of the data will print to the Terminal.

```
# print data
SmallBobRoss
```{{execute}}

~~~

## step 3 (read_csv)


```
#> format-shape-data
#> └── step3.md
```

Step 3 shows us how to import data into the R environment.


```r
# fs::dir_ls("data")
readr::write_csv(as.data.frame(SmallBobRoss), "data/SmallBobRoss.csv")
```


```r
readr::read_csv(file = "https://bit.ly/small-bob-ross")
```

```
#> # A tibble: 5 x 3
#>   title               bushes clouds
#>   <chr>                <dbl>  <dbl>
#> 1 A WALK IN THE WOODS      1      0
#> 2 MT. MCKINLEY             0      1
#> 3 EBONY SUNSET             0      0
#> 4 WINTER MIST              1      1
#> 5 QUIET STREAM             0      0
```

~~~

# Download data into R

As we noted earlier, functions are like verbs in the R language, and data we've created is the object. Similar to English grammar, verbs (functions) do things to objects. We can build data objects in R using a variety of methods. Typically we will be loading data from an outside source into the R environment. 

## Importing .csv files into R

We can import data directly from a web URL like the one below. The bitly link takes us to a [comma-separated values file](https://en.wikipedia.org/wiki/Comma-separated_values) with the same data we loaded in the previous step.

```
SmallBobRoss <- readr::read_csv("https://bit.ly/small-bob-ross")
```{{execute}}

The code above loads the data from an external source (see the data [here](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/data/SmallBobRoss.csv)).

After these data are loaded into R, we get a message about how the data were formatted, 

```
Parsed with column specification:
cols(
  title = col_character(),
  bushes = col_double(),
  clouds = col_double()
)
```


`col_character()` means these data are text, which makes sense because they are the titles for the episodes. The `col_double()` tells us the `bushes` and `clouds` variables were imported as double (a kind of numerical variable in R).

~~~


## step 4  (fivethirtyeight, glimpse)


```
#> format-shape-data
#> └── step4.md
```

This step imports the full `bob_ross` dataset from the `fivethirtyeight` package. We load the data into R using `fivethirtyeight::bob_ross`.


```r
BobRoss <- fivethirtyeight::bob_ross
BobRoss %>% glimpse(78)
```

```
#> Rows: 403
#> Columns: 71
#> $ episode            <chr> "S01E01", "S01E02", "S01E03", "S01E04", "S01E05"…
#> $ season             <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, …
#> $ episode_num        <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1, 2,…
#> $ title              <chr> "A WALK IN THE WOODS", "MT. MCKINLEY", "EBONY SU…
#> $ apple_frame        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ aurora_borealis    <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ barn               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ beach              <int> 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, …
#> $ boat               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ bridge             <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ building           <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ bushes             <int> 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, …
#> $ cabin              <int> 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ cactus             <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ circle_frame       <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ cirrus             <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, …
#> $ cliff              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ clouds             <int> 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, …
#> $ conifer            <int> 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, …
#> $ cumulus            <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, …
#> $ deciduous          <int> 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, …
#> $ diane_andre        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ dock               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ double_oval_frame  <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ farm               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ fence              <int> 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, …
#> $ fire               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ florida_frame      <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ flowers            <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ fog                <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ framed             <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ grass              <int> 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, …
#> $ guest              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ half_circle_frame  <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ half_oval_frame    <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ hills              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ lake               <int> 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, …
#> $ lakes              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ lighthouse         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ mill               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ moon               <int> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ mountain           <int> 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, …
#> $ mountains          <int> 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, …
#> $ night              <int> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ ocean              <int> 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, …
#> $ oval_frame         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ palm_trees         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ path               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ person             <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ portrait           <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ rectangle_3d_frame <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ rectangular_frame  <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ river              <int> 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ rocks              <int> 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ seashell_frame     <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ snow               <int> 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, …
#> $ snowy_mountain     <int> 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, …
#> $ split_frame        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ steve_ross         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ structure          <int> 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ sun                <int> 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, …
#> $ tomb_frame         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ tree               <int> 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, …
#> $ trees              <int> 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, …
#> $ triple_frame       <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ waterfall          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ waves              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, …
#> $ windmill           <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ window_frame       <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ winter             <int> 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
#> $ wood_framed        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
```


~~~

# Two levels of data wrangling 

We like to think of wrangling on two different levels. The first level deals with the data shape and structure. The second level of data wrangling refers with the format of the actual variables (which we will get to in the following steps). Questions we should be asking ourselves about data at this level include:

1. Approximately how many observations (or rows) should we be seeing?  
2. Are all the rows unique (i.e.will each case have a row)?    
3. Does each variable have a column?   
4. Are these variables each measuring exactly one thing?   
3. Should I be expecting missing or incomplete data, and if so, why/how are they missing?   

## Reshaping data

A common task for data manipulation is moving columns to rows, or rows to columns. We refer to this as data The `tidyr` package in R makes this easy with the `tidyr::pivot_` functions. We'll be importing and restructuring the Bob Ross dataset.


We will load the data into R using `fivethirtyeight::bob_ross`. First we have to install the package into the R environment, 

```
install.packages("fivethirtyeight")
```{{execute}}

Then we load the library. 

```
library(fivethirtyeight)
```{{execute}}

Now we can assign the `bob_ross` data frame into the `BobRoss` object. 

```
BobRoss <- fivethirtyeight::bob_ross
```{{execute}}

### View a dataset

We can view the `BobRoss` dataset using `dplyr`'s `glimpse()` function, which shows the data in a transposed view (the variables are presented horizontally, which as much data as possible printed to the screen).

```
glimpse(BobRoss)
```{{copy}}


`dplyr::glimpse()` is a very handy function for examining the structure and shape of a dataset. Other options include `utils::str()` and `utils::head()`. 

~~~

# step 5 (pivot_)


```
#> format-shape-data
#> └── step5.md
```

This section covers the `pivot` functions. 


```r
fivethirtyeight::bob_ross %>%
  tidyr::pivot_longer(data = ., 
                      cols = c(apple_frame:wood_framed), 
                      names_to = 'object', 
                      values_to = 'present') %>% 
  dplyr::glimpse(78)
```

```
#> Rows: 27,001
#> Columns: 6
#> $ episode     <chr> "S01E01", "S01E01", "S01E01", "S01E01", "S01E01", "S01E…
#> $ season      <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
#> $ episode_num <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
#> $ title       <chr> "A WALK IN THE WOODS", "A WALK IN THE WOODS", "A WALK I…
#> $ object      <chr> "apple_frame", "aurora_borealis", "barn", "beach", "boa…
#> $ present     <int> 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0…
```

~~~



~~~


## Appendix 1: Katacoda scenario tutorials

The tutorial for building the scenario is [here](https://katacoda.com/scenario-examples/scenarios/create-scenario-101).

I took notes on this tutorial and made them available in [this Google document](https://docs.google.com/document/d/e/2PACX-1vSf2w2onhH5t3IhuD4sYLoWqn46BLKMYFR7q3BHO8QTaRkVgXfhKvnl8T9uHrjmbVpTZVKCWrfxEl0R/pub).

## Appendix 2: Katacoda guidelines

There are multiple guidelines and resources for writing scenarios. O'Reilly has provided an *Authoring Guide* and *Formatting and Design Guide*.

The link for these files can be found here:

+ [Katacoda Scenario Formatting and Design Guide for Authors](https://docs.google.com/document/d/1l4lofG5kAu8JFzumZPCsJJE2muCYe6rHSHCQsMlijd8/edit)

+ [Katacoda Scenario Authoring Guide](https://docs.google.com/document/d/14rudtruZQhRxvD3zcR3g75j5nuOgKGz4CYk8hdhaV-w/edit)

## Appendix 3: Scenario Checklist

**Scenario Readiness Checklist:**

When you think your scenario is ready for publication, we recommend you run through the checklist below to ensure it is ready to go. [Reminder: We discuss these best practices in the Katacoda Formatting and Design Guide for Authors]:

Does the scenario start consistently and in a timely manner? More than 5 minutes to start would be cause to reconsider your build decisions.

- [ ] Are your intro and final pages present and are their respective goals and lessons learned in agreement?

- [ ] Have you tested your scenario lately?

- [ ] Do you agree with the leveling (beginner, intermediate, advanced) you indicated when you started the build?

- [ ] Was learning time you entered correct, or should it be adjusted?

- [ ] Are your versions of tools and other dependencies up to date?

- [ ] Have you tried every instruction?

- [ ] Have you written each step in the most concise manner possible?

- [ ] Have you run your text through a spelling/grammar checker?

- [ ] Are your credits to others given present and correct?

- [ ] Are your images legal and with credits?

- [ ] Are your hyperlinks all working?

- [ ] Do the goals and lessons learned items match the steps in the scenario?


## Scenario contents

This scenario covers...
