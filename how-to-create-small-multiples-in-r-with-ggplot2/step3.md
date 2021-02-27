### Creating Year Categories 

We will proceed under the assumption that our stakeholders asked us to help explain the relationship between the average rating a movie received (`averageRating`) and the number of votes that went into the score (`numVotes`). 

There are quite a few years in this dataset, so instead, we will split each measure into decades. To do this, we need a categorical variable from the `startYear` variable. The `cut()` function is handy because we can supply the number of `breaks` we want to split the numeric `startYear` variable into (`12` in this case). We will also create some clear labels for this categorical variable with the `labels` argument and make sure the format is `ordered`.

We check our new factor variable with the `fct_count()` from the `forcats` package.

```
# click to execute code
ImdbData <- ImdbData %>% 
  mutate(year_cat10 = cut(x = startYear, 
                          breaks = 12, 
                          labels = c("1910s", "1920s", "1930s", 
                                     "1940s", "1950s", "1960s", 
                                     "1970s", "1980s", "1990s", 
                                     "2000s",  "2010s", "2020s"),
                          ordered = TRUE))
# check the count of our factor levels 
fct_count(f = ImdbData$year_cat10, sort = TRUE)
```{{execute}}

### Number of votes 

We want to examine how the `numVotes` variable changed over time (`year_cat10`). Let's review the `numVotes` variable below with `skimr::skim()`

```
ImdbData$numVotes %>% skimr::skim()
```{{execute}}

We can see the values for this variable are concentrated, or skewed, towards `0`. 

### Average individual user ratings

The `averageRating` gives us the *weighted average of all the individual user ratings*. We will refresh our memory about this variable by taking a quick look at the `skimr::skim()` output below: 

```
ImdbData$averageRating %>% 
  skimr::skim()
```{{execute}}

We want each decade on the `x` axis and the `numVotes` for each film on the `y`. 

The distribution for `averageRating` looks evenly distributed around the mean and median, and the `hist` looks relatively symmetrical. We will see if this holds for `averageRating` when we look at it across the levels of `year_cat10`.
