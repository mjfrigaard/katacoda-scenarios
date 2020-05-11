## Lets get some data! 

We will be using `ggplot2` to explore data from the Economist's Medium post titled, ["Mistakes, we've drawn a few"](https://medium.economist.com/mistakes-weve-drawn-a-few-8cdd8a42d368). 

These data are available for download as part of the [#TidyTuesday](https://github.com/rfordatascience/tidytuesday) project on Github. 

```
# Brexit 
Brexit <- readr::read_csv("https://bit.ly/brexit-data")

# Corbyn 
Corbyn <- readr::read_csv("https://bit.ly/corbyn-data")

# Dogs 
Dogs <- readr::read_csv("https://bit.ly/dogs-data")

# EuBalance 
EuBalance <- readr::read_csv("https://bit.ly/eu-balance-data")

# Pensions 
Pensions <- readr::read_csv("https://bit.ly/pensions-data")

# Trade 
Trade <- readr::read_csv("https://bit.ly/trade-economist-data")

# WomenResearch 
WomenResearch <- readr::read_csv("https://bit.ly/women-research-data")
```{{execute}}

We can examine each dataset using the `dplyr::glimpse()`, `utils::head()`, or `utils::str()` arguments we learned about in the last scenario.
 
```
Corbyn %>% dplyr::glimpse()
Corbyn %>% utils::head()
Corbyn %>% utils::str()
```

More information on the datasets are below:

+ `Corbyn` is a dataset of average Facebook likes and political leader/group.

+ `Brexit` is a dataset of Brexit poll opinions (with dates).  

+ `Dogs` is a dataset of dog body weights (in kgs) and average neck size (in cm), along with the date the dog was registered with the UK's kennel club.

+ `EuBalance` is a dataset of countries, the country budget balance/current-account balance, the year, and the value in billions or euros. 

+ `Pensions` is a dataset of countries, percent of the country's population 65 years old or over, and the percent of government spending on pensions as percent of GDP.

+ `Trade` is a dataset of the United States trade deficit with China in goods (in US dollar), the manufacturing employment in the US, and the year.   

+ `WomenResearch` is a dataset of countries, field of scientific study, and women among researchers with papers published between 2011-15 as percent of the total by field of study.
