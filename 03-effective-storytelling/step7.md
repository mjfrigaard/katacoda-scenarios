### Comparing counts

We've looked at the distribution of all the values in the `stars` variable, but what if we were interested in the distribution of `stars` across the groups in another categorical variable, like `style`, which is the *Style of container (cup, pack, tray, etc.).*

We can check the levels of style with `dplyr::count()`

```
# click to execute code
Ramen %>% dplyr::count(style, sort = TRUE)
```{{execute}}

This tells us the top five most common reviews for Ramen came from `Pack`s, `Bowl`s, `Cup`s, `Tray`s, and `Box`s.

### Grouped skims

We can use `dplyr`s `filter`, `select`, and `group_by` functions with `skimr` to see the distribution of the `stars` variable across the five most common `style` levels.

```
# click to execute code
Ramen %>% 
  # filter to most common styles
  filter(style %in% c("Pack", "Bowl",
                      "Cup", "Tray", "Box")) %>% 
  # select only stars and style
  dplyr::select(stars, style) %>% 
  # group dataset by style
  dplyr::group_by(style) %>% 
  # skim grouped data
  skimr::skim() %>% 
  # focus on select output
  skimr::focus(n_missing, style,
               numeric.mean, numeric.sd, numeric.hist,
               numeric.p0, numeric.p50, numeric.p100) %>% 
  # only return numeric values
  skimr::yank("numeric") 
```{{execute}}

The output shows Ramen from a `Box` has the highest `stars` rating. We are going to confirm this with a ridgeline plot.

### The `ggridges` package

The mean and median (`p50`) in the skimr output tells us the distribution of `stars` varies slightly for the filtered levels of `style`, so we will view the density for each distribution with a ridgeline plot from the [`ggridges` package](https://wilkelab.org/ggridges/).  

Install and load `ggridges` below:

```
# click to execute code
install.packages("ggridges")
library(ggridges)
```{{execute}}

### Build labels first!

We'll build the labels for this graph first in `labs_ridge_stars_style`, so we know what we're expecting to see. 

```
# click to execute code
labs_ridge_stars_style <- labs(
       title = "Star ratings by style",  
       subtitle = "Star rating across most common ramen containers",
       caption = "source: https://www.theramenrater.com/resources-2/the-list/",
       x = "Star rating", 
       y = NULL) 
```{{execute}}

> *I've found this practice to be very helpful for conceptualizing graphs before I begin building them, which reduces errors and saves time!*

### Overlapping density plots

The code below uses `ggridges::geom_density_ridges()` function to build overlapping density plots. In this plot, we map the `fill` argument to the `style` variable. We also want to set the `guides(fill = )` to `FALSE` because we'll have labels on the graph for each level of `style`.

```
# click to execute code
gg_step7_ridge_01 <- Ramen %>% 
  # filter to most common styles
  filter(style %in% c("Pack", "Bowl",
                      "Cup", "Tray", "Box")) %>% 
  ggplot(aes(x = stars,
             y = style,
             fill = style)) +
  geom_density_ridges() +
  guides(fill = FALSE) + 
  # add labels 
  labs_ridge_stars_style
# save
ggsave(plot = gg_step7_ridge_01,
       filename = "gg-step7-ridge-01.png",
       device = "png",
       width = 9,
       height = 6,
       units = "in")
```{{execute}}

Open the `gg-step7-ridge-01.png` graph in the vscode IDE (above the Terminal console). 

From the ridgeline plot, we can see that the `star` ratings for the `Box` level in `style` are concentrated around `5`.
