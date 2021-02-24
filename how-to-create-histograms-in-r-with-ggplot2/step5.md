### Multiple Variable Distributions

The previous step demonstrated how to use a histogram to view the distribution of a single variable. We needed to adjust the `bins` in the histogram to make its shape easier to interpret.

What if we wanted to compare the distribution of a single variable (like `stars`) across the levels of a categorical variable (like `style`)? Let's use `dplyr::count()` to see the relative counts in the `style` variable. 

```
# click to execute code
Ramen %>% count(style, sort = TRUE)
```{{execute}}

We can see the three most common levels of style are `Pack`, `Bowl` and `Cup`. Let's filter the Ramen data to only these categories and view their histograms using `ggplot2::facet_grid()`: 

The filtered dataset gets passed directly to the `ggplot()` functions, where we include the `stars` variable. Then we add a histogram geom, but specify the `bins`, `fill`, and `color` arguments. Finally, we pass the histogram to `facet_grid()` and assign the variable we want to 'facet' the histograms by using the `style ~ .` syntax. 

We also adjust the labels to communicate the contents of the new graph.

```
# click to execute code
gg_step5_hist_03 <- Ramen %>% 
  filter(style %in% c("Bowl", "Pack", "Cup")) %>% 
ggplot(aes(x = stars)) +
     geom_histogram(bins = 20, 
                    fill = "white", 
                    color = "black") +
     facet_grid(style ~ .) + 
    labs(
       title = "Distribution of ramen stars", 
       subtitle = "For Ramin in Bowls, Packs and Cups",
       caption = "source: https://www.theramenrater.com/resources-2/the-list/")
# save
ggsave(plot = gg_step5_hist_03,
        filename = "gg-step5-hist-03.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Let's view the graph we just created:

`gg-step4-hist-03.png`{{open}} 

When we use facets to display variable distributions, we must pay attention to the axes. In the graph we just created, all three histograms have the same `y` axis scale. If we had chosen all the levels in `style`, the number of responses would be a lot smaller and it would be hard to compare the histograms to each other. 
