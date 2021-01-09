### Counting with tabyls

Let's view the count of gender below using the `tabyl()` function from the [`janitor` package](https://sfirke.github.io/janitor/).

Install and load the `janitor` package below: 

```
# click to execute code
install.packages("janitor")
library(janitor)
```{{execute}}

`janitor::tabyl()` works similar to `dplyr::count()`, but had a lot more options. Read more about the `tabyl` function options [here](https://cran.r-project.org/web/packages/janitor/vignettes/tabyls.html).

```
# click to execute code
StarWars %>% 
  janitor::tabyl(gender) 
```{{execute}}

### Scatterplot (3 variables)

One way to include the `gender` variable in the scatterplot is to map it to the `color` aesthetic. The output from `tabyl` tells us there are `4` missing values in `gender`, so we will also filter these out of the plot.  

We will update our labels and add `gender` to the scatterplot in the code below.

```
# click to execute code
labs_scatter_ht_mass_02 <- labs(
  title = "Star Wars Character's height and mass", 
  subtitle = "Scatter plot for height and mass (mass < 200)",
  x = "Mass", 
  color = "Gender",
  y = "Height")

gg_step9_scatter_02 <- StarWars %>% 
  filter(!is.na(gender) & mass < 200) %>% 
  ggplot(aes(x = mass, y = height, color = gender)) + 
  geom_point() +
  # add labels
  labs_scatter_ht_mass_02
# save
ggsave(plot = gg_step9_scatter_02,
       filename = "gg-step9-scatter-02.png",
       device = "png",
       width = 9,
       height = 6,
       units = "in")
```{{execute}}

Open the `gg-step9-scatter-01.png` graph in the vscode IDE (above the Terminal console). 

The color of the points show that the `feminine` characters occupy a smaller range of values for the relationship between `mass` and `height`.

