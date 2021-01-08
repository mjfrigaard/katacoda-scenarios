### Wrangling and visualization pipelines 

Sometimes we might want to pass the data directly from a wrangling step to a data visualization without assigning changes to the data frame. We will demonstrate how this works using the same `Brexit` dataset. 

If you read the [Medium article](https://medium.economist.com/mistakes-weve-drawn-a-few-8cdd8a42d368), you'll find The Economist first plotted these data as a line graph, with two lines (see 'Original' image below). The 'Better' way to improve the graph would be to include points and smooth the line in the graph (see below):

![](https://github.com/mjfrigaard/katacoda-data-wrangle-viz-show/blob/master/figs/10-bremorse-plots-medium.png?raw=true)

In order to re-create these graphs, we'll need to restructure the `Brexit` data with the `tidyr::pivot_longer()` function we learned about in the last [scenario]().

Complete the code below by filling in the `cols = ` argument as `-date`, the `names_to = ` as `"poll"`, and the `values_to = ` as `"percent"`.

```
Brexit %>% pivot_longer(cols = , names_to =, values_to =)
```{{copy}}

We should end up with a dataset that has three variables: `date`, `poll`, and `percent`. The data below display the top six rows you should see when you've used `tidyr::pivot()` correctly. 

```
# A tibble: 170 x 3
   date       poll                     percent
   <date>     <chr>                      <dbl>
 1 2016-08-02 percent_responding_right      46
 2 2016-08-02 percent_responding_wrong      42
 3 2016-08-09 percent_responding_right      45
 4 2016-08-09 percent_responding_wrong      44
 5 2016-08-17 percent_responding_right      46
 6 2016-08-17 percent_responding_wrong      43
 7 2016-08-23 percent_responding_right      45
 8 2016-08-23 percent_responding_wrong      43
 9 2016-08-31 percent_responding_right      47
10 2016-08-31 percent_responding_wrong      44
# … with 160 more rows
```

#### Restructure and plot

After we're sure the data are structured correctly, we won't assign it to the `Brexit` data frame. Instead, we'll pass it straight through to the `ggplot2::qplot()` function. The `date` variable will go on the `x`, and the `percent` variable will go on the `y`. Click on the Run icon below to see the graph.

First, we will create the 'Original' graph by using `group = poll` and `geom = "line'`, because this allows us to build a separate colored line for each `poll`.  

```
Brexit %>% 
  pivot_longer(cols = -date, 
               names_to = "poll", 
               values_to = "percent") %>% 
  ggplot2::qplot(x = date, 
                 y = percent,
                 group = poll,
                 data = .,
                 geom = "line",
                 color = poll)
                 
ggsave(filename = "gg-step8-line.png", device = "png", 
        width = 7, height = 5, units = "in")
```{{execute}}

As we can see from the graph above, using `group` and the `color` aesthetic extends the `qplot()`'s capabilities by making it clear there are two categories for `polls` represented in the graph.

In the next step, we'll learn how to build a graph layer-by-layer!
