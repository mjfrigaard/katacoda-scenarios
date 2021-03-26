### Adjusting font attributes

The `title` font in the FiveThirtyEight graph is bold, and the `subtitle` text size is approximately the same size as the text on the `x` and `y` axes. We can adjust the font attributes in a `ggplot2` graph with the `theme()` function. We've already used the `theme()` function in the previous step to remove the legend (`legend.position = "none"`).

The `ggplot2::theme()` function comes with many options for customizing the way our graph looks. We will only cover a small number of these, and you should read more about using `ggplot2` in the excellent [R Graphics Cookbook, 2nd Edition](https://www.oreilly.com/library/view/r-graphics-cookbook/9781491978597/) by Winston Chang.

To change the font text attributes, we will set the following arguments in `theme()` (note that each argument also takes the `ggplot2::element_text()` function):

- Change the `plot.title` text with `element_text(size = 18, face = "bold")`    
- Change the `plot.subtitle` text `element_text(size = 15)`   
- Change the `axis.text.y` and `axis.text.x` text with `element_text(size = 14)`  

```
# click to execute code
gg_step5_line_03 <- ComicNewFemalePerc %>%
  filter(sex == "Female Characters") %>%
  ggplot(aes(x = year, y = sex_pct_per_yr_pub)) +
  geom_line(aes(group = publisher, color = publisher),
            size = 2) +
  scale_y_continuous(limits = c(0.00, 0.50),
        labels = scales::percent_format(accuracy = 1)) +
  # adjust text on labels and axes
  theme(legend.position = "none",
        plot.title = element_text(size = 18,
                                  face = "bold"),
        plot.subtitle = element_text(size = 15),
        axis.text.y = element_text(size = 14),
        axis.text.x = element_text(size = 14)) +
  # color the axis
  scale_color_manual(values = c("firebrick3",
                                "dodgerblue")) +
  # add text annotations
  annotate(geom = "text", x = 2001, y = .47,
           label = "DC", size = 7,
           color = "dodgerblue") +
  annotate(geom = "text", x = 2002, y = .25,
           label = "Marvel", size = 7,
           color = "firebrick3") +
  # add labels
  labs_line_comics
# save
ggsave(plot = gg_step5_line_03,
        filename = "gg-step5-line-03.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Click here to open the graph: `gg-step5-line-03.png`{{open}}

Now our plot looks very close to the original graph in the FiveThirtyEight article. If you like the looks of this graph, be sure to check out the [`ggthemes` package](https://yutannihilation.github.io/allYourFigureAreBelongToUs/ggthemes/) for the [`theme_fivethirtyeight()`](https://yutannihilation.github.io/allYourFigureAreBelongToUs/ggthemes/theme_fivethirtyeight/) and others.  
