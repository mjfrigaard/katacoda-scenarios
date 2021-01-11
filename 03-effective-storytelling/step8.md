### Multiple variable distributions (2)

In the last step, we learned the distribution for Ramen `stars` ratings varied across the five most common levels of `style`. This step will view the variation of `stars` across `style` with a box-plot. Box-plots are a great way of viewing the summary statistics for a numeric variable (like `stars`) across multiple levels of a categorical variable (like `style`).

### Box-plot labels

We'll build the labels for the graph similar to the labels we used for the ridgeline plot, but we'll be a little more explicit with the `subtitle` and `x` axis.


```
# click to execute code
labs_box_stars_style <- labs(
     title = "Star ratings by style",  
     subtitle = "Star ratings across pack, bowl, cup, tray, and box containers",
     caption = "source: https://www.theramenrater.com/resources-2/the-list/",
     x = "Ramen star ratings", 
     y = NULL) 
```{{execute}}

### Building box-plots

We'll filter the data to the five most common `style`s again and map `stars` to the `x` axis and `style` to the `y` axis. We will also map `style` to the `fill` aesthetic inside `ggplot2::geom_boxplot()`.

We don't need a guide (or legend), so we will remove it with `guides(fill = FALSE)`.

```
# click to execute code
gg_step8_boxplot_01 <- Ramen %>% 
    # filter to most common styles
  filter(style %in% c("Pack", "Bowl",
                      "Cup", "Tray", "Box")) %>%
  ggplot(aes(x = stars, y = style)) + 
  geom_boxplot(aes(fill = style)) +
  guides(fill = FALSE) + 
  labs_box_stars_style
# save
ggsave(plot = gg_step8_boxplot_01,
       filename = "gg-step8-boxplot-01.png",
       device = "png",
       width = 9,
       height = 6,
       units = "in")
```{{execute}}

Open the `gg-step8-boxplot-01.png` graph in the vscode IDE (above the Terminal console). 
