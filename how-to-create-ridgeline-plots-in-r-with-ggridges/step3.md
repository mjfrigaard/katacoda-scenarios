### Multiple Variable Distributions

We've looked at the distribution of all the values in the `stars` variable, but what if we were interested in the distribution of `stars` across the groups in another categorical variable, like `style`, which is the *Style of container (cup, pack, tray, etc.).*

We can check the levels of style with `dplyr::count()`

```
Ramen %>% 
  count(style, sort = TRUE)
```{{execute}}

The output above tells us the top five most common reviews for Ramen came from `Pack`s, `Bowl`s, `Cup`s, `Tray`s, and `Box`es.

### Grouped skims

We can use `dplyr`s `filter`, `select`, and `group_by` functions with `skimr` to see the distribution of the `stars` variable across the five most common `style` levels.

```
# click to execute code
Ramen %>% 
  # filter to most common styles
  filter(style %in% c("Pack", "Bowl",
                      "Cup", "Tray", "Box")) %>% 
  # select only stars and style
  select(stars, style) %>% 
  # group dataset by style
  group_by(style) %>% 
  # skim grouped data
  skim() %>% 
  # focus on select output
  skimr::focus(n_missing, style,
               numeric.mean, numeric.sd, numeric.hist,
               numeric.p0, numeric.p50, numeric.p100) %>% 
  # only return numeric values
  skimr::yank("numeric") 
```{{execute}}

The output shows Ramen from a `Box` has the highest `stars` rating. We are going to confirm this with a ridgeline plot.
