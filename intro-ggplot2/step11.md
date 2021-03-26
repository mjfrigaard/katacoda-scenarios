# Mapping Aesthetics Globally

So far, we have added the `aes()` arguments *locally* in each new `geom` layer we've built. This section will map these variables *globally* in the `ggplot()` function. See the following:

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

View _gg-step11-global.png_ in the VS Code IDE.

By adding `color = poll` in the `ggplot()` function, the aesthetic carries down through each `geom`. All we have to do is add the arguments for each `geom`.

## Adding Colors Manually

We want to change the graph's colors from the default settings to fire-brick red and cornflower blue. We can do this by adding the `ggplot2::scale_color_manual()` function and specifying the values(`c("cornflowerblue", "firebrick3")`).

Run the following code to save the new changes to the `gg_p11_scale` object:

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

View the _gg-step11-scale.png_ file in the VS Code IDE.

For a full list of colors, check out [this pdf](http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf).
