# Using Themes

Our graph is nearly complete! We have all the geoms, aesthetics, titles, and labels. The last thing we will add is a theme, but we will do this by going outside the `tidyverse` to the [`ggthemes`](https://yutannihilation.github.io/allYourFigureAreBelongToUs/ggthemes/) package.

## ggthemes

The `ggthemes` package has pre-packaged design, color, and font choices for most popular media outlets (_FiveThirtyEight_, _Wall Street Journal_, etc.). We'll use the `ggthemes::theme_economist_white()` function to change our plot's colors and design.

Install this package by clicking on the following code section:

```
# click to execute code
install.packages("ggthemes")
library(ggthemes)
```{{execute}}

This function takes a `gray_bg = ` argument, which we will set to `FALSE`. We'll also change the `base_size` for the font to `12`, and the default font family to `"Verdana"`:

```
# click to execute code
gg_p14_labs + ggthemes::theme_economist_white(gray_bg = FALSE,
                                     base_size = 12,
                                     base_family = "Verdana")

# save
ggsave(filename = "gg-step15-ggthemes.png", device = "png",
       width = 7, height = 5, units = "in")
# view
```{{execute}}

View the _gg-step15-ggthemes.png_ graph in the VS Code IDE. This looks pretty close, right? Compare to the image below:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/figs/12-bremore-better.png)
