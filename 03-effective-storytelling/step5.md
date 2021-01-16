### Are we seeing what we expected? (2)

In the previous step, we viewed a `skim()` of the `"character"` and `"Date"` variables in the `People` dataset. We're going to continue 'skimming' these data and check them against our expectations.

### Viewing numeric variables

We'll use `skimr::yank()` and `skimr::focus()` to view the `n_missing` and `complete_rate` for the `"numeric"` variables in `People`.

```
PeopleSkim %>% 
  focus(n_missing, complete_rate) %>% 
    yank("numeric")
```{{execute}}

The `complete_rate` for  `birthYear`, `birthMonth`, `birthDay`, `weight` and `height` are over 90%. However, the `deathYear`, `deathMonth` and `height` is under 50%. *Why do you think these data have missing values?*

The `skim()` output for the `"numeric"` variables give us a [set of summary statistics](https://en.wikipedia.org/wiki/Summary_statistics): 

**Location statistics**

- the `mean` (or average) gives us the expected value for each variable  
- the median (as `p50`) or the 'center' value for each variable. Half of the values are above, and half are below.

```
PeopleSkim %>% 
  skimr::focus(numeric.mean, numeric.p50) %>% 
    skimr::yank("numeric") 
```{{execute}}


**Spread statistics**

- the lowest value for each variable, or minimum (as `p0`)  
- the highest value for each variable, or maximum (as `p100`)  
- *Together, these two values can give us the range, which is the difference between the maximum and minimum values*

```
PeopleSkim %>% 
  skimr::focus(numeric.p0, numeric.p100) %>% 
    skimr::yank("numeric") 
```{{execute}}

- the first quartile (as `p25`), which is the 'middle' of the data points *below* the median  
- the third quartile (as `p75`), which is the 'middle' of the data points *above* the median  
- *Together, these two values can give us the interquartile range (IQR), which is the difference between the third and first quartiles* 

```
PeopleSkim %>% 
  skimr::focus(numeric.p25, numeric.p75) %>% 
    skimr::yank("numeric") 
```{{execute}}


- the standard deviation (as `sd`), a measure of each variable's disbursement.
- *The standard deviation describes how far a variable's values are spread out around their mean*

```
PeopleSkim %>% 
  skimr::focus(numeric.mean, numeric.sd) %>% 
    skimr::yank("numeric") 
```{{execute}}


These numbers can be challenging to make sense of by themselves. Fortunately, the `skimr::skim()` output comes with a `hist` column. The `hist` column is a small histogram for the `numeric` variables. 

Below we use `skimr::focus()` and `skimr::yank()` to view the `mean`, standard deviation (`sd`), minimum (`p0`), median (`p50`), maximum (`p100`), and `hist` for the numeric variables in `People`. 

```
PeopleSkim %>% 
  skimr::focus(numeric.mean, numeric.sd, 
               numeric.p0, numeric.p50, numeric.p100,
               numeric.hist) %>% 
    skimr::yank("numeric") 
```{{execute}}

The `hist` column shows us a miniature distribution of the values in each numeric variable.

### Do these numbers make sense?

- As we can see, the majority of the missing values are in the variables with the `death` prefix (`deathDay`, `deathMonth`, and `deathYear`). The missing values in these variables make sense because, given the lowest `birthYear` value (`1820`), we should expect approximately half of the baseball players in the `People` dataset to be still alive.

- We also notice an implausible value from the `skimr` output: the `weight` variable maximum value (`2125`). We can use `dplyr`'s `filter` and `select` functions to find the `nameGiven` for the abnormally high `weight` value.

```
People %>% 
  filter(weight == 2125) %>% 
  select(nameGiven, birthMonth, birthDay, birthYear, weight)
```{{execute}}

Google the player's name. *What is his listed weight on Wikipedia?*
