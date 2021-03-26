# Viewing Variable Distributions

Density plots use [kernel smoothing](https://ggplot2-book.org/statistical-summaries.html) to create a clean looking distribution. Read more about density plots [here](https://ggplot2.tidyverse.org/reference/geom_density.html).

## Build a Density Plot

We're going to use `ggplot2::geom_density()` to view a density plot of the `stars` variable in `Ramen`. We will use `fill` to color the area underneath the density line with `"dodgerblue"`:

```
# click to execute code
gg_step3_density_01 <- Ramen %>%
  ggplot(aes(x = stars)) +
  geom_density(fill = "dodgerblue") +
  labs(title = "Distribution of ramen stars",
  caption = "source: https://www.theramenrater.com/resources-2/the-list/")
# save
ggsave(plot = gg_step3_density_01,
        filename = "gg-step3-density-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open _gg-step3-density-01.png_ in the VS Code IDE above the Terminal console to view the graph.
