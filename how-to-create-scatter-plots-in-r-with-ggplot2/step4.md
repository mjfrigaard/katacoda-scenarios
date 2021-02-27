### Scatterplots

We will create a scatterplot with `ggplot2::geom_point()` by mapping `mass` to the `x` axis and map `height` to the `y` axis. 

```
# click to execute code
gg_step4_scatter_01 <- StarWars %>% 
  ggplot(aes(x = mass, y = height)) + 
  geom_point() + 
  # add labels
  labs_scatter_ht_mass_01
# save
ggsave(plot = gg_step4_scatter_01,
        filename = "gg-step4-scatter-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Click here to open the graph: `gg-step4-scatter-01.png`{{open}} 

Notice how the points are all clustered on the left-hand side of the chart? The `x` axis has extended to account for Jabba the Hutt's high `mass` value, which has made it hard to interpret the relationship among the other values. 

*What happens when we remove the outliers?*

### Removing Outliers

If you encounter outliers, it's a good idea to view each graph with and without them to see how much they influence the plot. Let's `filter` Jabba the Hutt's `mass` out of the `Starwars` dataset and rebuild the scatterplot. We'll also add this information to a new set of labels, so we don't get the two graphs confused. 

```
# click to execute code

# new labels
labs_scatter_ht_mass_02 <- labs(
  title = "Star Wars Character's height and mass", 
  subtitle = "Characters with mass less than 200",
  x = "Mass", 
  y = "Height")

# build graph
gg_step4_scatter_02 <- StarWars %>% 
  filter(mass < 200) %>% 
  ggplot(aes(x = mass, y = height)) + 
  geom_point() + 
  # add labels
  labs_scatter_ht_mass_02
# save
ggsave(plot = gg_step4_scatter_02,
        filename = "gg-step4-scatter-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Click here to open the graph: `gg-step4-scatter-02.png`{{open}} 

Based on the scatterplot, we can see a positive relationship between `mass` and `height` for Star Wars characters. But is this the same for all types of characters? For example, does this relationship hold for all levels of `gender`?
