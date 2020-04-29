# Creating data

It's hard to learn any of R's capabilities without a dataset. There are multiple ways to get datasets into the R environment, but won't be able to cover them all in this scenario. One quick and easy way to get data into R is to create the data 'by hand' using the `tibble::tribble()` function. Read more about this function [here on the tidyverse website](https://tibble.tidyverse.org/reference/tribble.html) function.

In this scenario, we will be using a dataset from the [`fivethirtyeight` package](https://cran.r-project.org/web/packages/fivethirtyeight/vignettes/fivethirtyeight.html) in R. This package has over 100 datasets from articles on the website `fivethirtyeight`. 

The dataset we will be using today comes from the article, ["A Statistical Analysis of the Work of Bob Ross."](https://fivethirtyeight.com/features/a-statistical-analysis-of-the-work-of-bob-ross/)

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/00-538-bob-ross.png?raw=true)

Bob Ross was the host of [The Joy of Painting](https://en.wikipedia.org/wiki/The_Joy_of_Painting), a painting educational program from 1980 - 1994.


These data are stored as a [comma-separated values](https://en.wikipedia.org/wiki/Comma-separated_values) file on Github (see below). 

```
title, bushes, clouds
A WALK IN THE WOODS,1,0
MT. MCKINLEY,0,1
EBONY SUNSET,0,0
WINTER MIST,1,1
QUIET STREAM,0,0
```

A description of these variables is below:

+ `episode_num`: Episode number

+ `title`: Title of episode

+ `bushes`: Present (`1`) or not (`0`)  

+ `clouds`: Present (`1`) or not (`0`)

The `tibble::tribble()` function takes column names preceded by the tilde (i.e. `~column`), then get separated by commas (`~column1`, `~column2`, `~column3`). Then `tibble::tribble()` reads the data starting on the second line, similar to the way the actual data are stored.

The `tibble` we'll create is a small sample from the [`bob_ross`](https://fivethirtyeight-r.netlify.app/articles/fivethirtyeight.html) dataset.  

## Tibbles 

The code below creates `SmallBobRoss` from the data above in the R environment. Click on the :arrow_right_hook:

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

