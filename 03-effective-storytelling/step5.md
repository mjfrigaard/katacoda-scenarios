### Variables

The variables in the `People` dataset are accessible using two question marks before the object name `??People`

```
??People
```

The Help files tell us there are two factor variables (`bats` and `throws`) and two date variables (`debut` and `finalGame`).

### Factors 

We will convert the two factor variables (`bats`, `throws`) using `dplyr::mutate()` and `factor()`. We will assign the `levels` in `bats` as `c("B", "L", "R")`.

```
People <- People %>% 
  mutate(bats = factor(x = bats, levels = c("B", "L", "R")))
# check new bats variable
People %>% count(bats)
```{{execute}}

We will also create a factor variable from `throws` and assign `levels` as `c("L", "R", "S")`

```
People <- People %>% 
  mutate(throws = factor(x = throws, levels = c("L", "R", "S")))
# check new throws variable
People %>% count(throws)
```{{execute}}

### Dates 

We will also convert the dates in `debut` and `finalGame` to dates using `lubridate::ymd()`. We check out work with `select()` and `skimr::skim()`:

```
People <- People %>% 
  mutate(debut = lubridate::ymd(debut),
         finalGame = lubridate::ymd(finalGame))
People %>% 
  select(debut, finalGame) %>% 
  skimr::skim()
```{{execute}}

*Do we need to make changes to the variables?*

Check out the [`dplyr`](https://dplyr.tidyverse.org/) package for a refresher on data manipulation.

*Do we need to make changes to the data structure or shape?*

Do these data need to be restructured? Check out the [`tidyr`](https://tidyr.tidyverse.org/) package for a refresher.
