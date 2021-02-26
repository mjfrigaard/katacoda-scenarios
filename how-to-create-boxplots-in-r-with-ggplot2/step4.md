### Building box-plots

We'll filter the data to the five most common `style`'s again and map `stars` to the `x` axis and `style` to the `y` axis. 

We will also map `style` to the `fill` aesthetic inside `ggplot2::geom_boxplot()`.

We don't need a guide (or legend), so we will remove it with `show.legend = FALSE` in the `geom_boxplot()` function (outside the `aes()`).

```
# click to execute code
gg_step4_boxplot_01 <- Ramen %>% 
    # filter to most common styles
  filter(style %in% c("Pack", "Bowl",
                      "Cup", "Tray", "Box")) %>%
  ggplot(aes(x = stars, y = style)) + 
  geom_boxplot(aes(fill = style), 
                   show.legend = FALSE) +
  labs_box_stars_style
# save
ggsave(plot = gg_step4_boxplot_01,
        filename = "gg-step4-boxplot-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the graph by clicking here: `gg-step4-boxplot-01.png`{{open}} 

In the next step, we will cover how to interpret the contents of a box-plot.
