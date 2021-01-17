### Visualizing relationships (1)

Now that we know how to explore variable distributions, we will look at relationships between two (or more) variables. We must establish want kind of relationship we're investigating before deciding what plot to make. We've already been exploring the relationship between two variables. We looked at the distribution (or spread) of `stars` vs. five categories of `style` in the `Ramen` dataset, and we also looked at the `birthCountry`s vs. `n` (the count of each birth country) in the `People` dataset. 

In this step, we will look at how two numeric variables change (or vary) and if that change is in the same (or opposite) direction. One of the most common graphs for visualizing this relationship between two numerical variables is the [scatterplot](https://en.wikipedia.org/wiki/Scatter_plot). A scatterplot uses points to display two numeric variables, with one variable on each axis. 

### Star Wars data

We will load the `starwars` data from the `dplyr` package. These data come from the [Star Wars API](https://swapi.dev/). Read more about this dataset on [`dplyr`s website](https://dplyr.tidyverse.org/reference/starwars.html). 

```
# click to execute code
StarWars <- dplyr::starwars 
```{{execute}}

We will look at the relationship between `height` and `mass` for characters in the `StarWars` dataset. Let's start by looking at the `n_missing` and `complete_rate` for these two variables.

```
# click to execute code
StarWars %>% 
  select(height, mass) %>% 
  skimr::skim() %>% 
  skimr::focus(n_missing, complete_rate) %>% 
  skimr::yank("numeric")
```{{execute}}


We can see that almost 2/3rds of the data in `mass` are missing. This amount of missing data might surprise us if we didn't explore it before plotting. 

We will also view the `mean`, standard deviation (`sd`), minimum (`p0`), 25th percentile (`p25`), median (`p50`), 75th percentile (`p75`), maximum (`p100`), and `hist` for these two columns.

```
# click to execute code
StarWars %>% 
  select(height, mass) %>% 
  skimr::skim() %>% 
    skimr::focus(numeric.mean, numeric.sd, 
                 numeric.p0, numeric.p25, 
                 numeric.p50, numeric.p75, 
                 numeric.p100, numeric.hist) %>% 
  skimr::yank("numeric") 
```{{execute}}

We can see at least one value of `mass` that is considerably higher than the rest. We can tell because the location statistics are similar to each other (`mean` = `97.3`, median (`p50`) = `84.5`), but the spread is almost twice the value of the location (`sd` = `169`). The maximum value (`p100`) of `1358` also confirms this finding. *What is going on with this value?*

### Investigate outliers

It's always a good idea to investigate values that seem implausible (like we did with the abnormally high weight for the MLB player in step 5). If we can't figure out what is going on, we should communicate this with our stakeholders. Outliers can have a big impact on data visualizations (and statistical models), so ensuring we account for them is essential for communicating with our audience. 

We're going to `filter` the `StarWars` data only observations with `mass` more than `180`, and `select` only the `name`, `height`, `mass`, `sex` and `species` columns (we chose `200` because it's approximately 2x the `p75` value).

```
StarWars %>% 
    filter(mass > 200) %>% 
    select(name, height, mass, sex, species)
```{{execute}}

We can now see this `mass` belongs to Jabba the Hutt, which makes sense if we do some [additional research](https://starwars.fandom.com/wiki/Jabba_Desilijic_Tiure).

### Labels

Now that we know what we're going to visualize, we can make our labels.

```
# click to execute code
labs_scatter_ht_mass_01 <- labs(
  title = "Star Wars Character's height and mass", 
  x = "Mass", 
  y = "Height")
```{{execute}}

### Scatterplots

We will create a scatterplot with `ggplot2::geom_point()` by mapping `mass` to the `x` axis and map `height` to the `y` axis. 

```
# click to execute code
gg_step13_scatter_01 <- StarWars %>% 
  ggplot(aes(x = mass, y = height)) + 
  geom_point() + 
  # add labels
  labs_scatter_ht_mass_01
# save
ggsave(plot = gg_step13_scatter_01,
        filename = "gg-step13-scatter-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step13-scatter-01.png` graph in the vscode IDE (above the Terminal console). Notice how the points are all clustered on the left-hand side of the chart? The `x` axis has extended to account for Jabba the Hutt's high `mass` value, which has made it hard to interpret the relationship among the other values. 

*What happens when we remove the outliers?*

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
gg_step13_scatter_02 <- StarWars %>% 
  filter(mass < 200) %>% 
  ggplot(aes(x = mass, y = height)) + 
  geom_point() + 
  # add labels
  labs_scatter_ht_mass_02
# save
ggsave(plot = gg_step13_scatter_02,
        filename = "gg-step13-scatter-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step13-scatter-02.png` graph in the vscode IDE (above the Terminal console). 

Based on the scatterplot, we can see a positive relationship between `mass` and `height` for Star Wars characters. But is this the same for all types of characters? For example, does this relationship hold for all levels of `gender`?
