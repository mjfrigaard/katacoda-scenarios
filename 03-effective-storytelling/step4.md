### Are we seeing what we expected? (1)

Before creating any visualizations, we want a display that gives us an overview of the entire `People` dataset. In the previous step, we went over some of the `People` dataset documentation, so we know what to expect.  

### Skimming data

We'll be using the [`skimr` package](https://docs.ropensci.org/skimr/). `skimr` was is designed for:

> "displaying summary statistics the user can skim quickly to understand their data"

Below we pass the `People` dataset to the `skimr::skim()` function to create `PeopleSkim`. We then use the `base::summary()` function to review the new object.

If this code looks unfamiliar to you, review the [Introduction to `ggplot2` scenario](https://www.katacoda.com/orm-mfrigaard/scenarios/02-intro-ggplot2).

```
PeopleSkim <- People %>%  
  skimr::skim()
summary(PeopleSkim)
```{{execute}}


The output above shows a high-level summary of all the variables in the `People` dataset. We can see there are `20090` rows and `24` columns (`14` columns are `character`s, `2` columns are `Date`s, and `8` are `numeric`).

### Viewing character variables 

The new `PeopleSkim` object gives us summary information to check against the documentation and help guide our data visualizations. We will start by viewing the variables according to their types in `People` using `skimr::yank()` (read the [function documentation on Github](https://github.com/ropensci/skimr/blob/master/R/reshape.R#L138)). The `skim_type` argument in `skimr::yank()` takes a variable type (`"character"`, `"numeric"`, or `"Date"`). 

Run the code below to use `skimr::yank()` to view a `skim` of the `character` variables in the `People` dataset.

```
PeopleSkim %>% 
  skimr::yank(skim_type = "character")
```{{execute}}

We can see none of these data are missing (`n_missing` and `complete_rate`). `Skimr::skim()` also shows us the `min`, `max`, `empty`, `n_unique`, and `whitespace` for the `14` character values. 

### Viewing date variables

Next, we use `skimr::yank()` to view a `skim` of the `Date` variables in the `People` dataset.

```
PeopleSkim %>% 
  skimr::yank(skim_type = "Date")
```{{execute}}

The `skim` of the `Date` variables shows us which data are missing ( `complete_rate`), along with the earliest (`min`), latest (`max`), middle (`median`), and the number of unique (`n_unique`) of dates.

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/03-effective-storytelling/docs/img/n_unique-col.png)

### Do these numbers make sense?

We can use these values for sanity checks. For example, the `n_unique` for `playerID` matches the total number of rows in `People`, which we should expect from the documentation (`playerID` = "*A unique code assigned to each player*"). The earliest dates for both `debut` and `finalGame` are in May of 1871 (which corresponds to the [first MLB game ever played](https://www.retrosheet.org/1stGame.htm)).
