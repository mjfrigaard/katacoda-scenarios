### Adding aesthetics and layers 

In the last step we added a `geom_smooth()` to the `p` object and removed the standard errors (`se = FALSE`) and legend (`show.legend = FALSE`). We stored these changes in the `p2` object. 

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>)) + 
    <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>), 
                    optional_arguments = "values")
```

We're going to continue building our plot by adding the `ggplot2::geom_point()` function. We need to specify the `aes()` argument (`color = poll`), and we'll also include the `show.legend = FALSE` argument again to remove the legend for the two `poll` categories.

```{r geom_point}
p2 + geom_point(aes(color = poll), show.legend = FALSE)
```

This is starting to look more like the graph in the medium article, but we still need to make a few minor adjustments. 

![](https://github.com/mjfrigaard/katacoda-data-wrangle-viz-show/blob/master/figs/10-bremorse-plots-medium.png?raw=true)

`ggplot2` allows us to build graphs layer-by-layer using the geoms and aesthetics to customize each plot so that they are necessarily expressive. Each time we need to add something to a graph, we can either add a new `geom`, or look for ways to adjust a geoms with new aesthetic options. 

For example, we can see from the 'Original' graph in the medium article that the points are slightly transparent. This is the alpha transparency argument, and it's available inside nearly every `geom`. 

We can add the `alpha` argument inside the `ggplot2::geom_point()` function, and specify either a decimal, fraction, or numeric value.

```{r alpha}
p3 <- p2 + geom_point(aes(color = poll), alpha = 1/3, show.legend = FALSE)
p3
```

Now the points are slightly transparent, which helps with over-plotting. 

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>)) + 
    <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>), args = "options")
```

As you can see, the grammar of graphics makes it easy to think about what we'd like to see on a plot, decide what kind of graph element it is (`geom`, `aesthetic`, etc.), and then add it as a layer with the `+` operator. Hopefully you can see how easy it is to customize a graph by adding new layers and aesthetics!
