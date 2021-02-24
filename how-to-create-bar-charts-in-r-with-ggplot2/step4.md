### Counting Things With Bar Charts

> "Data science is mostly counting things." - [Sam Firke](https://cran.r-project.org/web/packages/janitor/vignettes/tabyls.html)

At bottom, data visualizations are drawings used to represent numbers. The challenge is matching the design to the numbers we want to display. Before choosing the type of graph we want to create, we need to decide which numbers we'd like to communicate.

### Bars Charts

In a bar (or column) chart, each bar/column length represents a numeric value. The number of levels determines the number of bars or columns.

We will create a bar chart of the `bats` variable in `People`, which measures whether the player bats left-handed (`L`), right-handed (`R`), both (`B`), or if these data are missing (`NA`). 

First want to create a table view of the numbers in the bar chart. Seeing the data summarized in a table gives us an idea of what to expect. It's always a good idea to set some expectations about the underlying data we want to display because this helps us determine if our visualization is the right choice for communication. 

Below we'll use `dplyr` 's `count()` function to tally the number of values for the different category items in `bats`. `dplyr::count()` returns a table of each category in the `bats` variable and their relative occurrence in the `People` dataset.

```
# click to execute code
People %>%
  count(bats)
```{{execute}}

Add `sort = TRUE` to see the counts sorted descending (with the most common categories at the top)

```
# click to execute code
People %>%
  count(bats, sort = TRUE)
```{{execute}}

Now we have an idea of the numbers we want to include in our visualization, so we're ready to create our graph. Building graphs with the `ggplot2` syntax can be expressed in the following template: 

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/how-to-create-bar-charts-in-r-with-ggplot2/img/ggplot2-template.png)

If you need a refresher on `ggplot2` layers and mapping, check out the [Introduction to the Grammar of Graphics scenario](https://www.katacoda.com/orm-mfrigaard/scenarios/intro-ggplot2).
