### Variable types

Before we look at how variables relate to each other, we should get an idea of how each variable looks independently, or it's [distribution.](https://en.wikipedia.org/wiki/List_of_probability_distributions). 

How we visualize a variable's distribution depends on whether it's **continuous**, **categorical**, or **binary**.

**Continuous** variables mean they can be any value including `0`--and are typically thought of as raw measurements (i.e., human body weight, speed, time in seconds, etc.). Continuous variables also can have decimal values that make sense.

**Categorical** variables count discrete items or events, such as Facebook 'like's or the number of page views. Categorical variables are different from continuous variables because they have a fixed set of possible values (i.e. you can't have 1/2 a Facebook 'like'). 

A particular case of a categorical variable is a **binary** variable, which only has two possible values (`0` or `1`, `alive` or `dead`, `yes` or `no`, etc.).

#### Visualize a single variable: histograms

We will view the distribution of the `avg_facebook_likes` from the `Corbyn` dataset using `ggplot2::qplot()`. Click below:

```
# click to execute code
Corbyn %>% 
    ggplot2::qplot(x = avg_facebook_likes, data = .) 
    
# save
ggsave(filename = "gg-step6-hist.png", device = "png", 
        width = 7, height = 5, units = "in")
```{{execute}}

*What is this graph telling us?* 

Well, we can print the entire `Corbyn` dataset to the console to view it (it's not very big). 

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/06-corbyn-tibble.png?raw=true)

We can see the data printed to the screen has the `avg_facebook_likes` variable sorted descending, with the highest number on top (`5210`), and the lowest number on the bottom (`56`). 

When we give the `qplot()` function a single numerical variable, it assumes we want a [histogram](https://ggplot2.tidyverse.org/reference/geom_histogram.html). 

The histogram displays the `avg_facebook_likes` variable by splitting up the `x` axis into `bins`, then plotting the count for each number of observations in each bin on the `y` axis.

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/06-corbyn-histogram.png?raw=true)

#### Visualize a single variable: box-plots

Histograms are a great way to visualize the distribution of a single variable, but there are other `geom`s, too. For example, a box-plot gives us a graph with quite a few summary statistics.

Click the code section below to create a box-plot of the `pop_65_percent` from the `Pensions` dataset.

```
# click to execute code
# the data 
Pensions %>% 
  # the variable 
  ggplot2::qplot(x = pop_65_percent, 
                 y = " ",
                 # the dot
                 data = .,
                 geom = "boxplot")
ggsave(filename = "gg-step6-box.png", device = "png", 
        width = 7, height = 5, units = "in")
```{{execute}}

Our new graph (`gg-step6-box.png`) should be in the `ROOT` folder above. Click on it to view.

The box-plot gives us an idea of `pop_65_percent`'s distribution using the white box to show where the median (middle value), 1st and 3rd quartiles, higher/lower values, and outliers (see image below). 

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/07-boxplot.png?raw=true)
