### Adjusting axes on a graph

Our graph is coming along, but we should shift the `y` axes to the opposite side of the graph (like the image below). 

![](https://github.com/mjfrigaard/katacoda-data-wrangle-viz-show/blob/master/figs/12-bremore-better.png?raw=true)

#### Moving the `y` axis

`ggplot2` has a rich grammar for building graphs, which also means it has a function for doing nearly anything we can think of, which includes moving axes. To shift the `y` axis from it's original position, we can use the `ggplot2::scale_y_continuous()` function and specify `"right"` in the `position =` argument.

Assign these changes to `p6` and print it to the screen.

```
p6 <- p5 + ggplot2::scale_y_continuous(position = "_____")
p6
```{{copy}}

Compare to the `Better' graph. 

![](https://github.com/mjfrigaard/katacoda-data-wrangle-viz-show/blob/master/figs/12-bremore-better.png?raw=true)


Now we have the lines, the points, the plot labels, and the axes in the correct spot. Next up, we need to make sure our chart is titled and labeled correctly!
