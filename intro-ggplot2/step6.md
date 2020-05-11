### Visualizing a single variable

Before we look at how variables relate to one another, we should get an idea for how each variable looks independently, or it's [distribution.](https://en.wikipedia.org/wiki/List_of_probability_distributions). 

How we visualize a variable's distribution depends on whether it's **numeric** or **categorical**.

**Numeric** variables can be *continuous*--which means they can be any value including `0`--and are typically thought of as raw measurements (i.e. human body weight, speed, time in seconds, etc.). 

*Categorical* numeric variables count discrete items or events, such as Facebook 'like's or number of page views. Categorical numeric variables are different from continuous variables because the have a fixed set of possible values (i.e. you can't have 1/2 a Facebook 'like'). 

A special case of categorical variable is a *binary* variable, which only has two possible values (`0` or `1`, `alive` or `dead`, `yes` or `no`, etc.)

### Creating a histogram

We will view the distribution of the `avg_facebook_likes` using `ggplot2::qplot()` below.

```
# the data 
Corbyn %>% 
  # the variable 
  ggplot2::qplot(x = avg_facebook_likes, 
                 # the dot
                 data = .) 
```{{execute}}


