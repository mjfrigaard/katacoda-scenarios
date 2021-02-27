### Building Ridgeline Plots 

The code below uses `ggridges::geom_density_ridges()` function to build overlapping density plots. 

In this plot, we map the `fill` argument to the `style` variable. We also want to set the `show.legend = FALSE` to `FALSE` because we'll have labels on the graph for each level of `style`.

```
# click to execute code
gg_step5_ridge_01 <- Ramen %>%
  # filter to most common styles
  filter(style %in% c("Pack", "Bowl",
                      "Cup", "Tray", "Box")) %>%
  ggplot(aes(x = stars,
             y = style,
             fill = style)) +
  geom_density_ridges(show.legend = FALSE) +
  # add labels
  labs_ridge_stars_style
# # save
ggsave(plot = gg_step5_ridge_01,
        filename = "gg-step5-ridge-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Click here to open the graph: `gg-step5-ridge-01.png`{{open}}

We can see that the `stars` ratings for the `Box` level in `style` are concentrated around `5` from the ridgeline plot.
