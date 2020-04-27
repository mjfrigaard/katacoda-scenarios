## Creating data

It's hard to learn any of R's capabilities without some data. One quick and easy way to get data into R is to create some data 'by hand'. We will create a data set with the `tibble::tribble()` function below. 

The code below loads the `SmallBobRoss` into the R environment. These data are a small sample from the [`bob_ross`](https://fivethirtyeight.com/features/a-statistical-analysis-of-the-work-of-bob-ross/) dataset from the `fivethirtyeight` package in R. 

```
SmallBobRoss <- tibble::tribble(~title, ~episode_num, ~bushes, ~clouds,
                 "A WALK IN THE WOODS",            1,      1L,      0L,
                        "MT. MCKINLEY",            2,      0L,      1L,
                        "EBONY SUNSET",            3,      0L,      0L,
                         "WINTER MIST",            4,      1L,      1L,
                        "QUIET STREAM",            5,      0L,      0L)
```{{execute}}


Access the help file (enter `??tibble::tribble` in the R console) or read the documentation on the [tibble website](https://tibble.tidyverse.org/) to see how this function works, 

A description of these variables is provided below:

`episode_num`: Episode number

`title`: Title of episode

`bushes`: Present (`1`) or not (`0`)  

`clouds`: Present (`1`) or not (`0`)

To view the contents of `SmallBobRoss`, we can enter the name into the console and a preview of the data will print to the Terminal.

```
# print data
SmallMsleep
```{{execute}}

