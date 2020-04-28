## Download data into R

As we noted earlier, functions are like verbs in the R language, and data we've created is the object. Similar to English grammar, verbs (functions) do things to objects. We can build data objects in R using a variety of methods. Typically we will be loading data from an outside source into the R environment. 

## Importing .csv files into R

We can import data directly from a web URL like the one below. The bitly link takes us to a [comma-separated values file](https://en.wikipedia.org/wiki/Comma-separated_values) with the same data we loaded in the previous step.

```
SmallBobRoss <- readr::read_csv("https://bit.ly/small-bob-ross")
```{{execute}}

The code above loads the data from an external source (see the data [here](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/data/SmallBobRoss.csv)).

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
