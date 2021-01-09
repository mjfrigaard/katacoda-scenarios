### Visualizing relationships

Now that we know how to explore variable distributions, we will look at relationships between two (or more) variables. 

The most common graph for visualizing the relationship between two numerical variables is the [scatterplot](https://en.wikipedia.org/wiki/Scatter_plot).

A scatterplot displays data for two numeric variables, with one variable on each axis. These can help us detect whether a relationship (or correlation) exists between the two variables.

### Load data

For this graph, we're going to load the `dplyr::starwars` and get a `skimr` of these data. These data are collected from the [Star Wars API](https://swapi.dev/). Read more about this dataset on [`dplyr`s website](https://dplyr.tidyverse.org/reference/starwars.html).

```
# click to execute code
StarWars <- dplyr::starwars 
SWSkim <- StarWars %>% skimr::skim()
```{{execute}}

We're only interested in the numeric variables `StarWars` for now, so we're going to check these columns in `SWSkim`:

```
# click to execute code
SWSkim %>% 
  # only return numeric values
  skimr::yank("numeric") 
```{{execute}}

We can see there is at least one value of `mass` is considerably higher than the rest. We can tell because the location statistics are similar to each other (`mean` = `97.3`, median (`p50`) = `84.5`), but the spread is almost twice the value of the location (`sd` = `169`). This is further confirmed by the maximum value (`p100`) of `1358`.

### Labels

We're going to `filter` the `StarWars` data only observations with `mass` less than `200` (to remove the extreme value out of the data before plotting). 

```
# click to execute code
labs_scatter_ht_mass_01 <- labs(
  title = "Star Wars Character's height and mass", 
  subtitle = "Scatter plot for height and mass (mass < 200)",
  x = "Mass", 
  y = "Height")
```{{execute}}

### Scatterplot (2 variables)

We will create a scatterplot with `ggplot2::geom_point()`, map `mass` to the `x` axis, and map `height` to the `y` axis.

```
# click to execute code
gg_step8_scatter_01 <- StarWars %>% 
  filter(mass < 200) %>% 
  ggplot(aes(x = mass, y = height)) + 
  geom_point() + 
  # add labels
  labs_scatter_ht_mass_01
# save
ggsave(plot = gg_step8_scatter_01,
       filename = "gg-step8-scatter-01.png",
       device = "png",
       width = 9,
       height = 6,
       units = "in")
```{{execute}}

Open the `gg-step8-scatter-01.png` graph in the vscode IDE (above the Terminal console). 

Based on the scatterplot, we can see there is a positive relationship between `mass` and `height` for Star Wars characters. But is this the same for all types of characters? For example, does this relationship hold true for all levels of `gender`?
