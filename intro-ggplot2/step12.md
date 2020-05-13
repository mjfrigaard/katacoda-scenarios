### Adding text to a graph 

In the [Medium article]()https://medium.economist.com/mistakes-weve-drawn-a-few-8cdd8a42d368, the fixed 'Better' graph labels each smoothed line with `'Wrong'` vs `'Right'`. 

We're going to add text labels to our graph using the `ggplot2::geom_text()` function. The `p4` object has the latest changes to the plot.

#### Using the `geom_text()` function

`ggplot2::geom_text()` works on a Cartesian coordinate system and requires the `x`, `y`, and `label` arguments. We want to place the `Wrong` label at the intersection of percent `46`, just above the red line near the year `2018`. 

Recall that the dates are formatted as `YYYY-MM-DD`, so we have to pick an `x` value that we can specify as a date with `as.Date()`.

```
# add the correct y value
p4 + geom_text(label = "Wrong", color = "firebrick3", x = as.Date("2018-01-01"), y = __)
```{{copy}}

Now we want to add the `Right` label to the graph, but make this cornflower blue, at position `x` = `as.Date("2018-01-01")` and `y` = `42.5`.

```
# run this code to assign changes to p5
p5 <- p4 + geom_text(label = "Wrong", color = "firebrick3", 
               x = as.Date("2018-01-01"), y = 46) +
     geom_text(label = "Right", color = "cornflowerblue", 
               x = as.Date("2018-01-01"), y = 42.5)
p5
```{{execute}}

These labels match up with the Medium article graph below: 

![](https://github.com/mjfrigaard/katacoda-data-wrangle-viz-show/blob/master/figs/12-bremore-better.png?raw=true)

In the next step, we will move the `y` axis over to the right-hand side of the graph.
