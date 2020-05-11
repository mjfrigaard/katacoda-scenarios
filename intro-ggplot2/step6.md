## Visualizing a single variable

Before we look at how variables relate to one another, we should get an idea for how each variable looks independently, or it's [distribution.](https://en.wikipedia.org/wiki/List_of_probability_distributions). 

How we visualize a variable's distribution depends on whether it's **numeric** or **categorical**.

**Numeric** variables can be *continuous*--which means they can be any value including `0`--and are typically thought of as raw measurements (i.e. human body weight, speed, time in seconds, etc.). 

*Categorical* numeric variables count discrete items or events, such as Facebook 'like's or number of page views. Categorical numeric variables are different from continuous variables because the have a fixed set of possible values (i.e. you can't have 1/2 a Facebook 'like'). 

A special case of categorical variable is a *binary* variable, which only has two possible values (`0` or `1`, `alive` or `dead`, `yes` or `no`, etc.)

### Creating a single variable plot

We will view the distribution of the `avg_facebook_likes` using `ggplot2::qplot()` below. 

```
# the data 
Corbyn %>% 
  # the variable 
  ggplot2::qplot(x = avg_facebook_likes, 
                 # the dot
                 data = .) 
```

*What is this graph telling us?* 

Well, we can print the entire Corbyn dataset to the console to view it (it's not very big). 

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/06-corbyn-tibble.png?raw=true)

We can see the tibble printed to the screen has the `avg_facebook_likes` sorted descending, with the highest number on top (`5210`) and the lowest number on the bottom (`56`). 

When we give the `qplot()` function a single variable, it assumes that we want a [histogram](https://ggplot2.tidyverse.org/reference/geom_histogram.html). The histogram is displaying the `avg_facebook_likes` variable by splitting up the x axis into `bins`, then plotting the count for each number of observations in each bin on the `y` axis.

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/06-corbyn-histogram.png?raw=true)
