### Using themes

Our graph is nearly complete! We have all the geoms, aesthetics, titles, and labels. The last thing we will add is a theme, but we will do this by going outside of the `tidyverse` to the [`ggthemes`](https://yutannihilation.github.io/allYourFigureAreBelongToUs/ggthemes/) package. 

#### `ggthemes` 

The `ggthemes` package has pre-packaged design, color, and font choices for most of the popular media outlets (FiveThirtyEight, Wall Street Journal, etc.). We'll use the `ggthemes::theme_economist_white()` function to change the colors and design of our plot.

This function takes a `gray_bg = ` argument, which we will set to `FALSE`. We'll also change the `base_size` for the font to `12`, and the default font family to `"Verdana"`.

```{r theme_economist_white}
p7 + ggthemes::theme_economist_white(gray_bg = FALSE, 
                                     base_size = 12, 
                                     base_family = "Verdana")
```

This looks pretty close, right? Compare to the image below:

![](https://github.com/mjfrigaard/katacoda-data-wrangle-viz-show/blob/master/figs/12-bremore-better.png?raw=true)
