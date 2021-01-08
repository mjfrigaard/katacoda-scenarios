### Data quality: variable types

When we're assessing a dataset for quality, we should make sure each variable is in the format we're expecting (i.e. character, factor, numeric, or logical). 

### Get a `skim` of the data

A great package for viewing the variables and their format is [`skimr`](https://docs.ropensci.org/skimr/). 

```
People %>% skimr::skim()
```{{execute}}

### `skim` output

The `skim` output shows us a transposed view of the `People` dataset, categorized by variable types (i.e. `character` and `numeric`). For the `character` variables, we can see the number of missing values (`n_missing`), the completion rate (`complete_rate`), minimum (`min`), maximum (`max`), `empty`, unique values (`n_unique`), and the amount of whitespace for each value (`whitespace`). 

For `numeric` values, we get the number of missing (`n_missing`) and completed (`complete_rate`), along with a collection of summary statistics (`mean`, `sd`, `p0`, `p25`, `p50`, `p75`, `p100`), and a small histogram (`hist`). The histogram gives us a small picture of the distribution for each numeric variable. 

We can also control the output from `skimr::skim()` to focus on the numeric variables using the `dplyr::select_if()` function.

```
People %>% 
  dplyr::select_if(is.numeric) %>% 
  skimr::skim()
```{{execute}}

We can see this returns only the numeric variables in `People`.
