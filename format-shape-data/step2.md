## Creating data

It's hard to learn any of R's capabilities without some data. One quick and easy way to get data into R is to create the data 'by hand'. We can build a data set with the [`tibble::tribble()`](https://tibble.tidyverse.org/reference/tribble.html) function. The data we'll create are a small sample from the [`bob_ross`](https://fivethirtyeight.com/features/a-statistical-analysis-of-the-work-of-bob-ross/) dataset from the `fivethirtyeight` package in R. 

A description of these variables is provided below:

+ `episode_num`: Episode number

+ `title`: Title of episode

+ `bushes`: Present (`1`) or not (`0`)  

+ `clouds`: Present (`1`) or not (`0`)

The `tibble::tribble()` function takes column names with tilde in front of them (`~column`) and get separated by commas. Starting on the second line, the data are read into the function similar to the way the actual data are stored (see below):

```
title,episode_num,bushes,clouds
A WALK IN THE WOODS,1,1,0
MT. MCKINLEY,2,0,1
EBONY SUNSET,3,0,0
WINTER MIST,4,1,1
QUIET STREAM,5,0,0
```

The code below creates `SmallBobRoss` from the data above in the R environment. 

```
SmallBobRoss <- tibble::tribble(~title, ~episode_num, ~bushes, ~clouds,
                 "A WALK IN THE WOODS",            1,      1L,      0L,
                        "MT. MCKINLEY",            2,      0L,      1L,
                        "EBONY SUNSET",            3,      0L,      0L,
                         "WINTER MIST",            4,      1L,      1L,
                        "QUIET STREAM",            5,      0L,      0L)
```{{execute}}


There are a few things to pay attention to in the code above: 

1. The assignment operator `<-` is used to create the `SmallBobRoss` tibble, which is a data object   
2. The `title`s in quotations (i.e. `"A WALK IN THE WOODS"`) creates a different kind of variable than the other numerical variables (like `episode_num` and `bushes`)  

Tibbles are rectangular data objects. They have columns and rows for storing data, similar to a spreadsheet in Excel. Access the help file (enter `??tibble::tribble` in the R console) or read the documentation on the [tibble website](https://tibble.tidyverse.org/) to see how this function works, 



To view the contents of `SmallBobRoss`, we can enter the name into the console and a preview of the data will print to the Terminal.

```
# print data
SmallMsleep
```{{execute}}

