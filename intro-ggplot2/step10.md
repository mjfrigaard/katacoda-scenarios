## Build plots layer-by-layer with `ggplot()`

Now that we've learned how to plot using geoms and aesthetics, we can begin adding layers to the graph. In the previous step, we re-created the 'Original' plot using `geom = "line"`. As we start to build more complex, customized plots, we will want to move away from using the `ggplot2::qplot()` function and start using `ggplot2::ggplot()` function.

The `ggplot2::ggplot()` function initializes a graph, then we can 'map' variables to the positions (`x` or `y`), aesthetics (`color = `), or groupings (`group = `. 

We'll start by assigning the restructuring changes to the `Brexit` dataset. 

```
Brexit <- Brexit %>% pivot_longer(-date, 
                                  names_to = "poll", 
                                  values_to = "percent")
```{{execute}}


### Using ggplot

The `ggplot()` follows a pretty standard template, and it's similar to the `qplot()` function. See below: 

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>))
```

We begin with a dataset, pass it over to to the `ggplot()` function, then map the `x` and `y` variables. Run the code below to assign the variable mappings to object `p`.

```
p <- Brexit %>% ggplot(mapping = aes(x = date, y = percent))
p
```{{execute}}

There aren't any points on the graph stored in object `p` because we haven't added any geoms or aesthetics. We'll add the smoothed line in the step below with `ggplot2::geom_smooth()` like the template below.

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>)) + 
    <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
```


**Note**: the `+` operator is used with `ggplot2` functions, not the pipe `%>%` operator. 

```{r geom_smooth}
p + ggplot2::geom_smooth()
```{{copy}}

*Why are we only seeing a single line?* We need to look at our template again:

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>)) + 
    <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>))
```

This shows the aesthetic mapping (`aes(<MAPPINGS>)`) needs to be set inside the geom we want to display. In this case, we want the lines colored by the two kinds of polls. We can set this with `color = poll`.

```{r aes-color}
p + ggplot2::geom_smooth(aes(color = ____))
```{{copy}}

The default `ggplot2::geom_smooth()` function includes the gray confidence interval around the smoothed line. We can remove this with `se = FALSE`. We'll also add the `show.legend = FALSE` argument to remove the `poll` categories from the left-hand side of the graph.

Copy the code below and complete the `show.legend` argument and assign the graph to the `p2` object.

```{r standard-error-and-legend}
p2 <- p + geom_smooth(aes(color = poll), se = FALSE, show.legend = FALSE)
p2
```{{execute}}

In the next step, we'll add the points to the graph. We've also updated the template below for adding aesthetics.

```
<DATA> %>% 
  ggplot(mapping = aes(x = <MAPPINGS>, y = <MAPPINGS>)) + 
    <GEOM_FUNCTION>(mapping = aes(<MAPPINGS>), 
                    optional_arguments = "values")
```
