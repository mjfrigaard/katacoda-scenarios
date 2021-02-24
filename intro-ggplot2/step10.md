### Adding aesthetics and layers 

In the last step we added a `geom_smooth()` to the `gg_p9_col_smth` object and removed the standard errors (`se = FALSE`) and legend (`show.legend = FALSE`). We stored these changes in the `gg-step9-col-smth.png` file. Refer to the template below for a refresher.

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>)) + 
    <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>), 
                    optional_arguments = "values")
```

We're going to continue building our plot by adding the `ggplot2::geom_point()` function. We need to specify the `aes()` argument (`color = poll`), and we'll also include the `show.legend = FALSE` argument again to remove the legend for the two `poll` categories.

Click on the section below to add points to the smooth plot:

```
# click to execute code
gg_p9_col_smth + geom_point(aes(color = poll), show.legend = FALSE)
# save
ggsave(filename = "gg-step10-col-smth.png", device = "png", 
       width = 7, height = 5, units = "in")
```{{execute}}

View `gg-step10-col-smth.png` in the vscode IDE. This is starting to look more like the graph in the medium article, but we still need to make a few minor adjustments. 

![](https://github.com/mjfrigaard/katacoda-data-wrangle-viz-show/blob/master/figs/10-bremorse-plots-medium.png?raw=true)

`ggplot2` allows us to build graphs layer-by-layer using the geoms and aesthetics to customize each plot so that they are necessarily expressive. Each time we need to add something to a graph, we can either add a new `geom`, or look for ways to adjust a geoms with new aesthetic options. 

For example, we can see from the 'Original' graph in the medium article that the points are slightly transparent. This is the alpha transparency argument, and it's available inside nearly every `geom`. 

We can add the `alpha` argument inside the `ggplot2::geom_point()` function, and specify either a decimal, fraction, or numeric value. In this case, we want the value set to `1/3`.

Click below to change the `alpha` level.

```
# click to execute code
gg_p10_alpha <- gg_p9_col_smth + 
  geom_point(aes(color = poll), show.legend = FALSE, alpha = 1/3)
 
ggsave(filename = "gg-step10-alpha.png", device = "png",
       width = 7, height = 5, units = "in")
```{{execute}}

View `gg-step10-alpha.png` in the vscode IDE. Now the points are slightly transparent, which helps with over-plotting. Review the template below for adding layers. 

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>)) + 
    <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>), args = "options")
```

As you can see, the grammar of graphics makes it easy to think about what we'd like to see on a plot, decide what kind of graph element it is (`geom`, `aesthetic`, etc.), and then add it as a layer with the `+` operator. Hopefully, you can see how easy it is to customize a graph by adding new layers and aesthetics!
