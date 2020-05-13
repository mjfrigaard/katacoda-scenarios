### Lets get some data! 

We will be using `ggplot2` to explore data from the Economist's Medium post titled, ["Mistakes, we've drawn a few"](https://medium.economist.com/mistakes-weve-drawn-a-few-8cdd8a42d368). 

These data are available for download as part of the [#TidyTuesday](https://github.com/rfordatascience/tidytuesday) project on Github. 

```
# Balance 
Balance <- readr::read_csv("https://bit.ly/eu-balance-data")
# Brexit 
Brexit <- readr::read_csv("https://bit.ly/brexit-data")
# Corbyn 
Corbyn <- readr::read_csv("https://bit.ly/corbyn-data")
# Pensions 
Pensions <- readr::read_csv("https://bit.ly/pensions-data")
```{{execute}}

We can examine each dataset using the `dplyr::glimpse()`, `utils::head()`, or `utils::str()` arguments we learned about in the last scenario.
 
```
Brexit %>% dplyr::glimpse()
Corbyn %>% utils::head()
Pensions %>% utils::str()
Balance
```{{execute}}

More information on the datasets are below:

+ `Corbyn` is a dataset of average Facebook likes and political leader/group.

+ `Brexit` is a dataset of Brexit poll opinions (with dates).  

+ `Balance` is a dataset of countries, the country budget balance/current-account balance, the year, and the value in billions or euros. 

+ `Pensions` is a dataset of countries, percent of the country's population 65 years old or over, and the percent of government spending on pensions as percent of GDP.
