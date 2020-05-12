## Adding aesthetics manually

**Note**: so far we have added the `aes()` argument *inside* each new `geom` layer we've built, but there was a way to plan ahead and do this in the original `ggplot()` function. See the code below:

```
Brexit %>% 
  ggplot(mapping = aes(x = date, y = percent, color = poll)) + 
              geom_smooth(se = FALSE, show.legend = FALSE) + 
                geom_point(alpha = 1/3, show.legend = FALSE)
```{{execute}}

By adding `color = poll` in the `ggplot()` function, the aesthetic carries all the way down through each `geom`. All we have to do is add the arguments for each `geom`. 

### Adding colors manually

We'd like to change the colors in the graph from the default settings to a more traditional fire-brick red and cornflower blue. We can do this by adding the `ggplot2::scale_color_manual()` function and specifying the values(`c("cornflowerblue", "firebrick3")`).

```
p3 +  scale_color_manual(values = c("cornflowerblue", "__________"))
```{{copy}}

For a full list of colors, check the pdf [here](http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf). 


