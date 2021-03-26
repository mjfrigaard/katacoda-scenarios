# Displaying Relationships

In this scenario, we will look at how two numeric variables change (or vary) and if that change is in the same (or opposite) direction. One of the most common graphs for visualizing this relationship between two numerical variables is the [_scatterplot_](https://en.wikipedia.org/wiki/Scatter_plot). A scatterplot uses points to display two numeric variables, with one variable on each axis.

## Star Wars Data

We will load the `starwars` data from the `dplyr` package. This data comes from the [Star Wars API](https://swapi.dev/). Read more about this dataset on [`dplyr`s website](https://dplyr.tidyverse.org/reference/starwars.html):

```
# click to execute code
StarWars <- dplyr::starwars
```{{execute}}

We will look at the relationship between `height` and `mass` for characters in the `StarWars` dataset. Let's start by looking at the `n_missing` and `complete_rate` for these two variables:

```
# click to execute code
StarWars %>%
  select(height, mass) %>%
  skimr::skim() %>%
  skimr::focus(n_missing, complete_rate) %>%
  skimr::yank("numeric")
```{{execute}}


We can see that almost two-thirds of the data in `mass` are missing. This amount of missing data might surprise us if we didn't explore it before plotting.

We will also view the `mean`, standard deviation (`sd`), minimum (`p0`), 25th percentile (`p25`), median (`p50`), 75th percentile (`p75`), maximum (`p100`), and `hist` for these two columns:

```
# click to execute code
StarWars %>%
  select(height, mass) %>%
  skimr::skim() %>%
    skimr::focus(numeric.mean, numeric.sd,
                 numeric.p0, numeric.p25,
                 numeric.p50, numeric.p75,
                 numeric.p100, numeric.hist) %>%
  skimr::yank("numeric")
```{{execute}}

We can see at least one value of `mass` that is considerably higher than the rest. We can tell because the location statistics are similar to each other (`mean` = `97.3`, median (`p50`) = `84.5`), but the spread is almost twice the value of the location (`sd` = `169`). The maximum value (`p100`) of `1358` also confirms this finding. *What is going on with this value?*
