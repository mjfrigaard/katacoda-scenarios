### Counting with tabyls

We will continue looking at the relationship between `mass` and `height` in the `Starwars` dataset. We looked at `mass` and `height` with and without an outlier's influence in the previous step. In this step, we will add a categorical variable (`gender`) to the plot to see if the direction of the change for `mass` and `height` is the same for all levels of `gender`.   

Let's view the count of gender below using the `tabyl()` function from the [`janitor` package](https://sfirke.github.io/janitor/).

```
# click to execute code
install.packages("janitor")
library(janitor)
```{{execute}}

`janitor::tabyl()` works similar to `dplyr::count()`, but automatically prints a bit more information in the output. Click on the code block below to create a `tably` for the `gender` variable.

```
# click to execute code
StarWars %>% 
  janitor::tabyl(gender) 
```{{execute}}

We can see the standard output produces a `percent` and `valid_percent` columns. We can also add percent formatting with `janitor::adorn_pct_formatting()`:

```
# click to execute code
StarWars %>% 
  janitor::tabyl(gender) %>% 
  janitor::adorn_pct_formatting()
```{{execute}}

This output tells us `4` characters in the `StarWars` dataset will not show up if we use the `gender` variable. Read more about the `tabyl` function options [here](https://cran.r-project.org/web/packages/janitor/vignettes/tabyls.html).

### Scatterplot (3 variables)

One way to include the `gender` variable in the scatterplot is to map it to the `color` aesthetic. The output from `tabyl` tells us there are `4` values in `gender` that will be missing from this plot.  

We will update our labels and add `gender` to the scatterplot in the code below.

```
# click to execute code
labs_scatter_ht_mass_gender <- labs(
  title = "Star Wars Character's gender, height and mass", 
  subtitle = "Data for gender (feminine/masculine), height, and mass < 200",
  x = "Mass", 
  color = "Gender",
  y = "Height")

gg_step5_scatter_03 <- StarWars %>% 
  filter(!is.na(gender) & mass < 200) %>% 
  ggplot(aes(x = mass, y = height, color = gender)) + 
  geom_point() +
  # add labels
  labs_scatter_ht_mass_02
# save
ggsave(plot = gg_step5_scatter_03,
        filename = "gg-step5-scatter-03.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step5-scatter-03.png`{{open}} graph in the vscode IDE (above the Terminal console). 

The color of the points shows that the `feminine` characters occupy a smaller range of values for the relationship between `mass` and `height`. 

