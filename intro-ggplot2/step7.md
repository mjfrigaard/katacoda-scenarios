## Visualizing a single variable (cont.)

Histograms are a great way to visualize the distribution of a single variable, but there are other `geom`s too. For example, the box-plot gives us a graph and quite a few summary statistics for any given numerical variable.

Below is a box-plot of the `pop_65_percent` from the `Pensions` dataset. 

```
# the data 
Pensions %>% 
  # the variable 
  ggplot2::qplot(x = pop_65_percent, 
                 # the dot
                 data = .,
                 geom = "boxplot") 
```{{execute}}

The box-plot gives us an idea of `pop_65_percent`'s distribution by using the white box to show where the median (middle value), 1st and 3rd quartiles, higher/lower values, and outliers (see image below)

### Box-plot summary statistics

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/07-boxplot.png?raw=true)

For more on the statistics displayed in the box-plot, read up on the [`geom_boxplot()` documentation](https://ggplot2.tidyverse.org/reference/geom_boxplot.html). 

Other options for individual variables include the [`geom = "density"`](https://ggplot2.tidyverse.org/reference/geom_density.html) and [`geom = "violin"`](https://ggplot2.tidyverse.org/reference/geom_violin.html).

