### Build plots layer-by-layer with `ggplot()`

Now that we've learned how to plot using geoms and aesthetics, we can add layers to the graph. In the previous step, we re-created the 'Original' plot using `geom = "line"`. The `ggplot2::qplot()` function was written to "produce plots quickly", but more complex graphs should be built using the `ggplot2::ggplot()` function.

The `ggplot2::ggplot()` function initializes a graph, then we can 'map' variables to the positions (`x` or `y`), aesthetics (`color = `), or groupings (`group = `. 

#### Create a 'tidy' dataset

We'll start by assigning the restructuring changes to the `Brexit` dataset. The `tidyr::pivot_longer()` function takes a 'wide' dataset and makes it 'long', or [tidy](https://vita.had.co.nz/papers/tidy-data.pdf). 

```
# click to execute code
Brexit <- Brexit %>% pivot_longer(-date, 
                                  names_to = "poll", 
                                  values_to = "percent")
```{{execute}}

#### Using the `ggplot()` function

The `ggplot()` follows a pretty standard template, similar to the `qplot()` function. See below: 

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>))
```

We begin with a dataset, pass it over to to the `ggplot()` function, then map the `x` and `y` variables. 

Run the code below to assign the variable mappings to object `gg_p9`, then print `gg_p9` to the console. 

```
# click to execute code
gg_p9 <- Brexit %>% ggplot(mapping = aes(x = date, y = percent))
ggsave(filename = "gg-step9-p.png", device = "png", 
        width = 7, height = 5, units = "in")
# view gg-step9-p.png
```{{execute}}

There aren't any points on the graph stored in object `p` because we haven't added any geoms or aesthetics. 

We'll add the smoothed line in the step below with `ggplot2::geom_smooth()` like the template below.

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>)) + 
    <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
```

**Note**: the `+` operator is used with `ggplot2` functions, not the pipe `%>%` operator. 

```
# click to execute code
gg_p9 + ggplot2::geom_smooth()

ggsave(filename = "gg-step9-smooth.png", device = "png", 
        width = 7, height = 5, units = "in")
# view gg-step9-smooth.png
```{{execute}}

*Why are we only seeing a single line?* We need to look at our template again:

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>)) + 
    <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
```

We can see from the template above that we can set the aesthetic mappings (`aes(<MAPPINGS>)`) globally *and* inside the geom layer we want to display. 

In this case, we want the lines from `geom_smooth()` colored by the two kinds of polls. We can set this with `color = poll`.

```
# click to execute code
gg_p9 + ggplot2::geom_smooth(aes(color = poll))

ggsave(filename = "gg-step9-color.png", device = "png", 
        width = 7, height = 5, units = "in")

# view gg-step9-smooth.png
```{{execute}}

The default `ggplot2::geom_smooth()` function includes the gray confidence interval around the smoothed line. We can remove this with `se = FALSE`. We'll also add the `show.legend = FALSE` argument to remove the `poll` categories from the left-hand side of the graph.

Run the code below to assign the graph to the `gg_p9_col_smth` object.

```
# click to execute code
gg_p9_col_smth <- gg_p9 + geom_smooth(aes(color = poll), 
                                   se = FALSE, show.legend = FALSE)
# save
ggsave(filename = "gg-step9-col-smth.png", device = "png", 
       width = 7, height = 5, units = "in")
# view plot
```{{execute}}

In the next step, we'll add the points to the graph. We've also updated the template below for adding aesthetics.

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>)) + 
    <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>), 
                    optional_arguments = "values")
```
