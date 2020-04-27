## Download data into R

As we noted earlier, functions are like verbs in the R language, and data we've created is the object. Similar to English grammar, verbs (functions) do things to objects. We can create data objects in R using through a variety of methods. Typically we will be loading data from an outside source into the R environment. 

## Importing .csv files into R

We can import data directly from a web url like the one below. The bitly link takes us to a [comma-separated values file](https://en.wikipedia.org/wiki/Comma-separated_values) with the same data we loaded in the previous step.

```
SmallBobRoss <- readr::read_csv("https://bit.ly/small-bob-ross")
```{{execute}}

The code above loads the data from an external source 
