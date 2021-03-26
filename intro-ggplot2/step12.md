# Adding Text to a Graph

In the [Medium article](https://medium.economist.com/mistakes-weve-drawn-a-few-8cdd8a42d368), the fixed "better" graph labels each smoothed line with "wrong" vs "right."

We're going to add text labels to our graph using the `ggplot2::geom_text()` function. The `gg_p11_scale` object has the latest changes to the plot.

## Using the geom_text() Function

`ggplot2::geom_text()` works on a Cartesian coordinate system and requires the `x`, `y`, and `label` arguments. We want to place the `Wrong` label at the intersection of percent `46`, just above the red line near the year `2018`.

Recall that the dates are formatted as `YYYY-MM-DD`, so we have to pick an `x` value that we can specify as a date with `as.Date()`. See the following example:

```
gg_p11_scale +
  geom_text(label = "Wrong", color = "firebrick3",
            x = as.Date("2018-01-01"), y = 46)
```

Now we want to add the `Right` label to the graph, but make this cornflower blue, at position `x` = `as.Date("2018-01-01")` and `y` = `42.5`. Click the following code section to add the text to the graph:

```
# click to execute code
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

View _gg-step12-txt.png_ in the VS Code IDE. These labels match up with the Medium article graph below:

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/12-bremore-better.png?raw=true)

In the next step, we will move the `y` axis over to the right-hand side of the graph.
