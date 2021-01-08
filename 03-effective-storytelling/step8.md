### Batting average 

A logical metric for determining the *greatest* hitter would be to use the player's batting average. The batting average is a calculation of the number of hits (`H`) divided by the number of times each player was at the plate (i.e., `AB` or At Bats).

The first thing we want to do is check the values in `AB` and `H` with `skimr::skim()`:

```
Batting %>% skimr::skim(AB)
```{{execute}}

```
Batting %>% skimr::skim(H)
```{{execute}}

Below we combine `dplyr::mutate()` with `base::ifelse()` to create the `batting_avg` variable. 

### Using `ifelse()`

The `ifelse()` function takes a condition (`test`), returns a value if it's true (`yes`), and another value if it's false (`no`). Below we combine it with `dplyr::mutate()` to create a `batting_avg` variable for all non-zero values for `AB`. This variable is empty if the number of `AB` is equal to or less than `NA`.


```
# calculate batting average
Batting <- Batting %>% 
  mutate(batting_avg = ifelse(test = AB > 0, 
                                  yes = round(H/AB, 3), 
                                  no = NA))
```{{execute}}

We will use the `skimr::skim()` function to get some summary statistics and a preliminary histogram of the new `batting_avg` variable.

```
# check the skim of batting average
Batting %>% skimr::skim(batting_avg)
```{{execute}}
