# Are We Seeing What We Expected?

Before creating any visualizations, we want a display that gives us an overview of the entire `People` dataset. In the previous step, we went over some of the `People` dataset documentation, so we know what to expect.

## Skimming Data

We'll be using the [`skimr` package](https://docs.ropensci.org/skimr/). `skimr` was is designed for:

> "Displaying summary statistics the user can skim quickly to understand their data."

In the following, we pass the `People` dataset to the `skimr::skim()` function to create `PeopleSkim`. We then use the `base::summary()` function to review the new object.

If this code looks unfamiliar to you, review the [introduction to `ggplot2` scenario](https://learning.oreilly.com/scenarios/-/9781492079071):

```
PeopleSkim <- People %>%
  skimr::skim()
summary(PeopleSkim)
```{{execute}}


The output above shows a high-level summary of all the variables in the `People` dataset. We can see there are `20090` rows and `24` columns (`14` columns are `character`s, `2` columns are `Date`s, and `8` are `numeric`).

## Viewing Character Variables

The new `PeopleSkim` object gives us summary information to check against the documentation and help guide our data visualizations. We will start by viewing the variables according to their types in `People` using `skimr::yank()` (read the [function documentation on Github](https://github.com/ropensci/skimr/blob/master/R/reshape.R#L138)). The `skim_type` argument in `skimr::yank()` takes a variable type (`"character"`, `"numeric"`, or `"Date"`).

Run the following code to use `skimr::yank()` to view a `skim` of the `character` variables in the `People` dataset:

```
PeopleSkim %>%
  skimr::yank(skim_type = "character")
```{{execute}}

We can see none of the data is missing (`n_missing` and `complete_rate`). `Skimr::skim()` also shows us the `min`, `max`, `empty`, `n_unique`, and `whitespace` for the `14` character values.

## Viewing Date Variables

Next, we use `skimr::yank()` to view a `skim` of the `Date` variables in the `People` dataset:

```
PeopleSkim %>%
  skimr::yank(skim_type = "Date")
```{{execute}}

The `skim` of the `Date` variables shows us what data is missing (`n_missing` and `complete_rate`), along with the earliest (`min`), latest (`max`), and middle (`median`).

The number of unique (`n_unique`) dates prints to the next line. This behavior is because the terminal window has a width limit. If the Terminal output extends past this limit, the content gets printed to the line below:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/how-to-create-bar-charts-in-r-with-ggplot2/img/n_unique-col.png)

## Do These Numbers Make Sense?

We can use these values for sanity checks. For example, the `n_unique` for `playerID` matches the total number of rows in `People`, which we should expect from the documentation (`playerID` = "*A unique code assigned to each player*"). The earliest dates for both `debut` and `finalGame` are in May of 1871 (which corresponds to the [first MLB game ever played](https://www.retrosheet.org/1stGame.htm)).

In the previous step, we viewed a `skim()` of the `"character"` and `"Date"` variables in the `People` dataset. We're going to continue 'skimming' the data and check it against our expectations.

## Viewing Numeric Variables

We'll use `skimr::yank()` and `skimr::focus()` to view the `n_missing` and `complete_rate` for the `"numeric"` variables in `People`:

```
PeopleSkim %>%
  focus(n_missing, complete_rate) %>%
    yank("numeric")
```{{execute}}

The `complete_rate` for  `birthYear`, `birthMonth`, `birthDay`, `weight`, and `height` are over 90%. However, the `deathYear`, `deathMonth`, and `height` is under 50%. *Why do you think the data has missing values?*

The `skim()` output for the `"numeric"` variables give us a [set of summary statistics](https://en.wikipedia.org/wiki/Summary_statistics):

### Location Statistics

Location statistics include:

- The `mean` (or average) gives us the expected value for each variable.
- The median (as `p50`) or the 'center' value for each variable. Half of the values are above, and half are below.

```
PeopleSkim %>%
  skimr::focus(numeric.mean, numeric.p50) %>%
    skimr::yank("numeric")
```{{execute}}


### Spread Statistics

Spread statistics include:

- The lowest value for each variable, or minimum (as `p0`).
- The highest value for each variable, or maximum (as `p100`).
- *Together, these two values can give us the range, which is the difference between the maximum and minimum values.*

```
PeopleSkim %>%
  skimr::focus(numeric.p0, numeric.p100) %>%
    skimr::yank("numeric")
```{{execute}}

- The first quartile (as `p25`), which is the 'middle' of the data points *below* the median.
- The third quartile (as `p75`), which is the 'middle' of the data points *above* the median.
- *Together, these two values can give us the interquartile range (IQR), which is the difference between the third and first quartiles.*

```
PeopleSkim %>%
  skimr::focus(numeric.p25, numeric.p75) %>%
    skimr::yank("numeric")
```{{execute}}


- The standard deviation (as `sd`), a measure of each variable's disbursement.
- *The standard deviation describes how far a variable's values are spread out around their mean.*

```
PeopleSkim %>%
  skimr::focus(numeric.mean, numeric.sd) %>%
    skimr::yank("numeric")
```{{execute}}


These numbers can be challenging to make sense of by themselves. Fortunately, the `skimr::skim()` output comes with a `hist` column. The `hist` column is a small histogram for the `numeric` variables.

In the following, we use `skimr::focus()` and `skimr::yank()` to view the `mean`, standard deviation (`sd`), minimum (`p0`), median (`p50`), maximum (`p100`), and `hist` for the numeric variables in `People`:

```
PeopleSkim %>%
  skimr::focus(numeric.mean, numeric.sd,
               numeric.p0, numeric.p50, numeric.p100,
               numeric.hist) %>%
    skimr::yank("numeric")
```{{execute}}

The `hist` column shows us a miniature distribution of the values in each numeric variable.

## Do These Numbers Make Sense?

As we can see, the majority of the missing values are in the variables with the `death` prefix (`deathDay`, `deathMonth`, and `deathYear`). The missing values in these variables make sense because, given the lowest `birthYear` value (`1820`), we should expect approximately half of the baseball players in the `People` dataset to be still alive.

We also notice an implausible value from the `skimr` output: the `weight` variable maximum value (`2125`). We can use `dplyr`'s `filter` and `select` functions to find the `nameGiven` for the abnormally high `weight` value:

```
People %>%
  filter(weight == 2125) %>%
  select(nameGiven, birthMonth, birthDay, birthYear, weight)
```{{execute}}

Google the player's name. *What is his listed weight on Wikipedia?*
