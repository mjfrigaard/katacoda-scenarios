### Adding text annotations

In the previous step, we started recreating the following graph from the FiveThirtyEight article titled, ["Comic Books Are Still Made By Men, For Men And About Men"](https://fivethirtyeight.com/features/women-in-comic-books/).


![](https://fivethirtyeight.com/wp-content/uploads/2014/10/hickey-feature-comics-3.png?w=1220)

We left off with the line graph in the `gg-step15-line-01.png` file. The FiveThirtyEight graph designers chose to remove the legend and add text labels directly to the chart, helping communicate the trend to audiences. This practice isn't always the best choice, but it works in this graph for a few reasons, which we will cover below. 

### When to add text to graphs

Text on graphs is essential to communicating the graph's contents.  After all, a figure without text is just a drawing. We've already covered what information to include in the graph labels (i.e., the title, subtitle, caption, and x and y axes). Annotations are additional text we place in the plot area to help the audience understand what we're trying to show.

We recommend adding text annotations as long as they aren't obscuring or distracting the audience from the point you're trying to make. 

In the  FiveThirtyEight graph, the text annotations work because there are only two levels for the measure of interest (`DC` and `Marvel`). Encoding this information in color aesthetics is helpful because we can set them to contrasting hues (i.e., blue and red). If there were more `publisher` levels, the color aesthetic might not be the best choice.

Lastly, the text annotations highlight the graph title's information ("Comics Aren't Gaining Many Female Characters"). Both annotations are in the same general area on the `x` axis, and their placement on the `y` axis is far enough from the line that the text doesn't overlap.

### Building text annotations

To get our graph closer to the FiveThirtyEight figure, we're going to set the line colors with `ggplot2::scale_color_manual()`. This function takes a `values` argument, which we will fill with two colors, `c("firebrick3", "dodgerblue")`.

In `ggplot2`, we can add text annotations with the `annotate()` function. Each level of `publisher` gets a layer and requires the following arguments: 

- `geom = "text"` *this lets `annotate()` know we want text*   
- `x =` *this is the position on the `x` axis we want the annotation*   
- `y =` *this is the position on the `y` axis we want the annotation*   
- `label =` *this is the text we want to use for the annotation*  
- `size = 7` *the size of the text*   
- `color =` *the same values we supplied to `scale_color_manual()`*   

```
# click to execute code
gg_step16_line_01 <- ComicNewFemalePerc %>% 
  filter(sex == "Female Characters") %>% 
  ggplot(aes(x = year, y = sex_pct_per_yr_pub)) + 
  geom_line(aes(group = publisher, color = publisher),
            size = 2) + 
  scale_y_continuous(limits = c(0.00, 0.50),
                     labels = scales::percent_format(accuracy = 1)) + 
  # color the axis
  scale_color_manual(values = c("firebrick3", "dodgerblue")) +
  # add text annotations
  annotate(geom = "text", x = 2001, y = .47, 
           label = "DC", size = 7, color = "dodgerblue") +
  annotate(geom = "text", x = 2002, y = .25, 
           label = "Marvel", size = 7, color = "firebrick3") + 
  # add labels
  labs_line_comics
# save
ggsave(plot = gg_step16_line_01,
        filename = "gg-step16-line-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step16-line-01.png` graph in the vscode IDE (above the Terminal console). 

We're almost there! We will make a few final adjustments to this graph to change the fonts displayed on the title and `x` and `y` axes.  

### Adjusting font attributes 

The `title` font in the FiveThirtyEight graph is bold, and the `subtitle` text size is approximately the same size as the text on the `x` and `y` axes. We can adjust the font attributes in a `ggplot2` graph with the `theme()` function. We've already used the `theme()` function in the previous step to remove the legend (`legend.position = "none"`). 

The `ggplot2::theme()` function comes with many options for customizing the way our graph looks. We will only cover a small number of these, and you should read more about using `ggplot2` in the excellent [R Graphics Cookbook, 2nd Edition](https://www.oreilly.com/library/view/r-graphics-cookbook/9781491978597/) by Winston Chang.

To change the font text attributes, we will set the following arguments in `theme()` (note that each argument also takes the `ggplot2::element_text()` function):

- Change the `plot.title` text with `element_text(size = 18, face = "bold")`    
- Change the `plot.subtitle` text `element_text(size = 15)`   
- Change the `axis.text.y` and `axis.text.x` text with `element_text(size = 14)`  

```
# click to execute code
gg_step16_line_02 <- ComicNewFemalePerc %>% 
  filter(sex == "Female Characters") %>% 
  ggplot(aes(x = year, y = sex_pct_per_yr_pub)) + 
  geom_line(aes(group = publisher, color = publisher),
            size = 2) + 
  scale_y_continuous(limits = c(0.00, 0.50),
                     labels = scales::percent_format(accuracy = 1)) + 
  # adjust text on labels and axes
  theme(legend.position = "none", 
        plot.title = element_text(size = 18, face = "bold"),
        plot.subtitle = element_text(size = 15),
        axis.text.y = element_text(size = 14),
        axis.text.x = element_text(size = 14)) +
  # color the axis
  scale_color_manual(values = c("firebrick3", "dodgerblue")) +
  # add text annotations
  annotate(geom = "text", x = 2001, y = .47, 
           label = "DC", size = 7, color = "dodgerblue") +
  annotate(geom = "text", x = 2002, y = .25, 
           label = "Marvel", size = 7, color = "firebrick3") + 
  # add labels
  labs_line_comics
# save
ggsave(plot = gg_step16_line_02,
        filename = "gg-step16-line-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step16-line-02.png` graph in the vscode IDE (above the Terminal console). 

Now our plot looks very close to the original graph in the FiveThirtyEight article. If you like the looks of this graph, be sure to check out the [`ggthemes` package](https://yutannihilation.github.io/allYourFigureAreBelongToUs/ggthemes/) for the [`theme_fivethirtyeight()`](https://yutannihilation.github.io/allYourFigureAreBelongToUs/ggthemes/theme_fivethirtyeight/) and others.  
