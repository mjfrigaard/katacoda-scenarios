# Importing data from external files

The [`tidyverse readr`](https://readr.tidyverse.org/) package has functions for loading multiple rectangular file types, including [comma-separated value](https://en.wikipedia.org/wiki/Comma-separated_values), [tab-separated value](https://en.wikipedia.org/wiki/Tab-separated_values), and other [fixed width format files](https://www.softinterface.com/Convert-XLS/Features/Fixed-Width-Text-File-Definition.htm).

## Importing .csv files into R

The code below allows us to import data directly from a web URL like the one below. The bitly link takes us to a comma-separated values (.csv) file with the same data we loaded in the previous step.

```
# click to execute code
SmallBobRoss <- readr::read_csv("https://bit.ly/small-bob-ross")
SmallBobRoss
```{{execute}}

The code above loads the data from an external source (see the data [here](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/data/SmallBobRoss.csv)) into a data object `SmallBobRoss`, then prints this object to the screen. 

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

### Getting a glimpse of the data 

We can view the `BobRoss` dataset using `dplyr`'s `glimpse()` function, which shows the data in a transposed view (`glimpse()` displays the variables horizontally, and prints as much data as possible to the screen.

```
# click to copy code
glimpse(SmallBobRoss)
```{{copy}}



