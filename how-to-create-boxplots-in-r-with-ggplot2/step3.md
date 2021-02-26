### Multiple variable distributions 

The `skimr` output from the previous step showed us the distribution the values in the `stars` variable, but what if we were interested in the distribution of `stars` across the groups in another categorical variable like `style`? `style` is the *Style of container (cup, pack, tray, etc.)*

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

The output shows Ramen from a `Box` has the highest `stars` rating.

### Box-plot labels

Before building our graph, we'll start by building the labels. This ensures we know what we're expecting to see (*before* we start assigning variables to axes). The `ggplot2::labs()` function has arguments for `title`, `subtitle`, `caption`, `x` and `y`. 

Note that we want to be specific with the `subtitle` and only include the five most common types by number of reviews.

```
# click to execute code
labs_box_stars_style <- labs(
     title = "Star ratings by style",  
     subtitle = "Star ratings across pack, bowl, cup, tray, and box containers",
     caption = "source: https://www.theramenrater.com/resources-2/the-list/",
     x = "Ramen star ratings", 
     y = NULL) 
```{{execute}}

Print the `labs_box_stars_style` in the console to see what it looks like.  
