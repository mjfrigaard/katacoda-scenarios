### Are we seeing what we expected?

Before creating any visualizations, we want a display that gives us an overview of the entire `People` dataset so we can see if it was imported correctly.

### Viewing entire datasets

We'll be using the [`skimr` package](https://docs.ropensci.org/skimr/), which is designed for

> "displaying summary statistics the user can skim quickly to understand their data"

Below we pass the `People` dataset to the `skimr::skim()` function to create `PeopleSkim`. We then use the `base::summary()` function to review the new object.

If this code looks unfamiliar to you, review the [Introduction to `ggplot2` scenario](https://www.katacoda.com/orm-mfrigaard/scenarios/02-intro-ggplot2).

```
# click to execute code
PeopleSkim <- People %>%  
  skimr::skim()
summary(PeopleSkim)
```{{execute}}

The output above shows a high-level summary of all the variables in the `People` dataset. We can see there are `20090` rows and `24` columns (`16` of which are `character` and `8` are `numeric`).

### Viewing variables by type

The new `PeopleSkim` object gives us summary information that we can check against the documentation and can help guide our data visualizations. We will start by viewing the 16 character variables in `People` using `skimr::yank()` (read the [function documentation on Github](https://github.com/ropensci/skimr/blob/master/R/reshape.R#L138)).

The `skim_type` argument in `skimr::yank()` takes a variable type (`"character"`, `"numeric"`, or `"factor"`). Run the code below to view the character values in `People`.

```
# click to execute code
PeopleSkim %>% 
  skimr::yank(skim_type = "character")
```{{execute}}

We can see none of these data are missing (`n_missing` and `complete_rate`). `Skimr::skim()` also shows us the `min`, `max`, `empty`, `n_unique`, and `whitespace` for the `16` character values. 

*Do these numbers make sense?*

We can use these values for sanity checks. For example, the `n_unique` for `playerID` matches the total number of rows in `People`, which we should expect from the documentation (`playerID` = "*A unique code assigned to each player*").

Next we will view the `"numeric"` variables in `People`.

```
# click to execute code
PeopleSkim %>% 
  skimr::yank("numeric")
```{{execute}}

The numeric variables give us some additional information about these `8` columns. Along with `n_missing` and `complete_rate`, we get [set of summary statistics](https://en.wikipedia.org/wiki/Summary_statistics): 

**Location statistics**

- the `mean` (or average) gives us the expected value for each variable  
- the median (as `p50`) or the 'center' value for each variable (half of the values are above and half are below)  

**Spread statistics**

- the lowest value for each variable, or minimum (as `p0`)  
- the highest value for each variable, or maximum (as `p100`)  
*Together, these two values can give us the range, which is the difference between the maximum and minimum values*

- the first quartile (as `p25`), which is the 'middle' of the data points *below* the median  
- the third quartile (as `p75`), which is the 'middle' of the data points *above* the median  
*Together, these two values can give us the interquartile range (IQR), which is the difference between the third and first quartiles*  

- the standard deviation (as `sd`), a measure of each variable's disbursement.
*The standard deviation describes how far a variable's values are spread out from their mean*

Below we use `skimr::focus()` and `skimr::yank()` to view the missing, mean, standard deviation, minimum, maximum, and a small histogram for the numeric variables in the `People` dataset:

```
# click to execute code
PeopleSkim %>% 
  skimr::focus(n_missing, 
               numeric.mean, numeric.sd, 
               numeric.p0, numeric.p100,
               numeric.hist) %>% 
    skimr::yank("numeric") 
```{{execute}}

*Do these numbers make sense?*

We notice two implausible values from the `skimr` output: the `weight` variable has max value (`2125`). We can use `dplyr`'s `filter` and `select` functions to find the `nameGiven`, `birthMonth`, `birthDay`, `birthYear`, and `weight` for the abnormally high value.

```
# click to execute code
People %>% 
  filter(weight == 2125) %>% 
  select(nameGiven, birthMonth, birthDay, birthYear, weight)
```{{execute}}

Google the player's name. *What is his listed weight on Wikipedia?*

As we can see, the majority of the missing values are in the variables with the `death` prefix (`deathDay`, `deathMonth`, and `deathYear`). The missing values in these variables make sense because given the lowest `birthYear` value (`1820`), we should expect approximately half of the baseball players in the `People` dataset to still be alive.

### Other resources for missing data

Read more about visualizing missing data [here](http://naniar.njtierney.com/articles/naniar-visualisation.html) and on the [`visdat` package site](https://docs.ropensci.org/visdat/), or on the [`inspectdf` package](https://github.com/alastairrushworth/inspectdf) website. 

