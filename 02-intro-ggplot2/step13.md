### Adjusting axes on a graph

Our graph is coming along. Next we're going to shift the `y` axes to the opposite side of the graph. See the image below: 

![](https://github.com/mjfrigaard/katacoda-data-wrangle-viz-show/blob/master/figs/12-bremore-better.png?raw=true)

#### Moving the `y` axis

`ggplot2` has a rich grammar for building graphs, which means it has a function for doing nearly anything we can think of, including moving axes. To shift the `y` axis from it's original position, we can use the `ggplot2::scale_y_continuous()` function and specify `"right"` in the `position =` argument.

Run the code below and assign these changes to `gg_p13_y` and print it to the screen.

```
gg_p13_y <- gg_p12_txt + 
  ggplot2::scale_y_continuous(position = "right")

# save
ggsave(filename = "gg-step13-y-axis.png", device = "png", 
       width = 7, height = 5, units = "in")
```{{execute}}

View the `gg-step13-y-axis.png` file and compare it to the `Better' graph. 

Now we have the lines, the points, the plot labels, and the axes in the correct spot. Next up, we need to make sure our chart is titled and labeled correctly!
