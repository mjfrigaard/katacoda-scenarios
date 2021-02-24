### Mapping aesthetics globally

**Note**: so far, we have added the `aes()` arguments *locally* in each new `geom` layer we've built. This section will map these variables *globally* in the `ggplot()` function. See the code below:

```
# click to execute code
gg_p11 <- Brexit %>% 
  ggplot(mapping = aes(x = date, y = percent, color = poll)) + 
              geom_smooth(se = FALSE, show.legend = FALSE) + 
                geom_point(alpha = 1/3, show.legend = FALSE)
# save
ggsave(filename = "gg-step11-global.png", device = "png", 
       width = 7, height = 5, units = "in")
```{{execute}}

View `gg-step11-global.png` in the vscode IDE.

By adding `color = poll` in the `ggplot()` function, the aesthetic carries down through each `geom`. All we have to do is add the arguments for each `geom`. 

#### Adding colors manually

We want to change the graph's colors from the default settings to fire-brick red and cornflower blue. We can do this by adding the `ggplot2::scale_color_manual()` function and specifying the values(`c("cornflowerblue", "firebrick3")`).

Run the code below to save the new changes to the `gg_p11_scale` object.

```
# click to execute code
gg_p11_scale <- gg_p11 +  
  scale_color_manual(values = c("cornflowerblue", "firebrick3"))
gg_p11_scale

# save
ggsave(filename = "gg-step11-scale.png", device = "png", 
       width = 7, height = 5, units = "in")
# view
```{{execute}}

View the `gg-step11-scale.png` file in the vscode IDE. 

For a full list of colors, check the pdf [here](http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf).
