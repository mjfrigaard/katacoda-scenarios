### Building a Bar Chart

In `ggplot2`, we create a bar chart using the `geom_bar()` function. First we map `bats` to both `x` and `fill` inside the `ggplot(aes())` functions.

We also remove the legend with `show.legend = FALSE`, and add labels for `title`, `subtitle`, `caption`, and `y` axis (`x` is set to `NULL`).

Finally, we pass the `plot` object to the `ggplot2::ggsave()` function and include the `filename` (with extension), the `device`, `width`, `height`, and `units`:

```
# click to execute code
gg_step5_bar_01 <- People %>%
  ggplot(aes(x = bats, fill = bats)) +
  # remove legend
  geom_bar(show.legend = FALSE) +
  # add labels
  labs(title = "MILB Player's batting hand",
       subtitle = "Left (L), right (R), or both (B)",
       caption = "source: http://www.seanlahman.com/",
       x = NULL, y = "Number of birth countries")
# save
ggsave(plot = gg_step5_bar_01,
        filename = "gg-step5-bar-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

View the graph by opening _gg-step5-bar-01.png_ in the VS Code IDE above the Terminal console.

There you have it! You've created a bar chart in R using `ggplot2`!
