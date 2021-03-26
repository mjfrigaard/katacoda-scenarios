# Viewing Our Images

Now we have an image file in our _ROOT_ folder above. We can click on _gg-step4.png_ and it will open in an adjacent window.

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/vscode-png.png?raw=true)

And just like that, `ggplot2` allows us to create high-quality graphs with only a few lines of code!

## Lets Load Some Data!

We will be using `ggplot2` to explore data from _The Economist's_ Medium post, ["Mistakes, we've drawn a few"](https://medium.economist.com/mistakes-weve-drawn-a-few-8cdd8a42d368).

The data is available for download as part of the [#TidyTuesday](https://github.com/rfordatascience/tidytuesday) project on Github. Click on the following code section to import the data:

```
# click to execute code
# Balance
Balance <- readr::read_csv("https://bit.ly/3hRzrKS")
# Brexit
Brexit <- readr::read_csv("https://bit.ly/3s2wqMx")
# Corbyn
Corbyn <- readr::read_csv("https://bit.ly/35mgYRB")
# Pensions
Pensions <- readr::read_csv("https://bit.ly/2MNAvEp")
```{{execute}}

The following code displays each dataset using three different functions: `dplyr::glimpse()`, `utils::head()`, and `utils::str()` (we learned about these functions in the last scenario):

```
# click to execute code
Brexit %>% dplyr::glimpse()
Corbyn %>% utils::head()
Pensions %>% utils::str()
Balance
```{{execute}}

We've provided some additional information on each datasets below:

+ `Corbyn` is a dataset of average Facebook likes and political leaders/groups.
+ `Brexit` is a dataset of Brexit poll opinions (with dates).
+ `Balance` is a dataset with countries, the country budget balance/current-account balance, the year, and the value in billions of euros.
+ `Pensions` is a dataset of countries, percent of the country's population 65 years old or over, and the percent of government spending on pensions as a percent of GDP.
