### Adding text to a graph 

In the [Medium article](https://medium.economist.com/mistakes-weve-drawn-a-few-8cdd8a42d368), the fixed 'Better' graph labels each smoothed line with "Wrong" vs "Right".  

We're going to add text labels to our graph using the `ggplot2::geom_text()` function. The `gg_p11_scale` object has the latest changes to the plot.

#### Using the `geom_text()` function

`ggplot2::geom_text()` works on a Cartesian coordinate system and requires the `x`, `y', and `label` arguments. We want to place the `Wrong` label at the intersection of percent '46`, just above the red line near the year `2018`. 

Recall that the dates are formatted as `YYYY-MM-DD`, so we have to pick an `x` value that we can specify as a date with `as.Date()`. See the example below:

```
gg_p11_scale + 
  geom_text(label = "Wrong", color = "firebrick3", 
            x = as.Date("2018-01-01"), y = 46)
```

Now we want to add the `Right` label to the graph, but make this cornflower blue, at position `x` = `as.Date("2018-01-01")` and `y` = `42.5`. Click the section below to add the text to the graph

```
gg_p12_txt <- gg_p11_scale + 
  geom_text(label = "Wrong", color = "firebrick3", 
            x = as.Date("2018-01-01"), y = 46) + 
  geom_text(label = "Right", color = "cornflowerblue", 
            x = as.Date("2018-01-01"), y = 42.5)
# save
ggsave(filename = "gg-step12-txt.png", device = "png", 
       width = 7, height = 5, units = "in")
# view
```{{execute}}

View `gg-step12-txt.png` in the vscode IDE. These labels match up with the Medium article graph below: 

![](https://github.com/mjfrigaard/katacoda-data-wrangle-viz-show/blob/master/figs/12-bremore-better.png?raw=true)

In the next step, we will move the `y` axis over to the right-hand side of the graph.
