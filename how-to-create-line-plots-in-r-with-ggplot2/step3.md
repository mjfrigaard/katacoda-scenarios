### Visualizing Relationships Over Time

We will build labels identical to those in the FiveThirtyEight graph but include the original article's URL as a `caption`.

```
# click to execute code
labs_line_comics <- labs(
  title = "Comics Aren't Gaining Many Female Characters", 
  subtitle = "Percentage of new characters who are female", 
  caption = "https://fivethirtyeight.com/features/women-in-comic-books/",
  x = NULL, 
  y = NULL)
```{{execute}}

Now that we have our data and labels, we can build the line graph. First, we need to `filter` the data to only female percentages, then pass the filtered data to `ggplot(aes())`, mapping the `year` to the `x` axis and `sex_pct_per_yr_pub` to the `y` axis.

On the next layer, inside the `ggplot2::geom_line()` function, we map `publisher` to the `group` and `color` aesthetics inside the `aes()` function. Outside the `aes()` function, we make the lines larger by setting the `size` to `2`. 

We need to make a few more customizations to this graph to make it look like the one in the article:

- Note the FiveThirtyEight graph does not have a legend or guide. We can remove the legend by adding a `ggplot2::theme(legend.position = "none")` layer. 

- The `y` axis in the FiveThirtyEight graph ranges from `0` to `50` and is formatted as a percent (`%`). Displaying percentage units helps the audience understand that a proportion is displayed (not the raw counts). We can change the formatting on the `y` axis with the `ggplot2::scale_y_continuous()` function. Set the `limits` argument to `c(0.00, 0.50))`, and the `labels` argument to `scales::percent_format(accuracy = 1)`.

```
# click to execute code
gg_step3_line_01 <- ComicNewFemalePerc %>% 
  filter(sex == "Female Characters") %>% 
  ggplot(aes(x = year, y = sex_pct_per_yr_pub)) + 
  geom_line(aes(group = publisher, color = publisher),
            size = 2) + 
  theme(legend.position = "none") + 
  scale_y_continuous(limits = c(0.00, 0.50),
         labels = scales::percent_format(accuracy = 1)) +
  # add labels
  labs_line_comics
# save
ggsave(plot = gg_step3_line_01,
        filename = "gg-step3-line-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
gg_step3_line_01
```{{execute}}

Click here to open the graph: `gg-step3-line-01.png`{{open}} 

Our graph is starting to look like the figure in the article, but we still need to make a few changes. We removed the legend, so we have no way of knowing which line belongs to which publisher (`DC` or `Marvel`). In the next section, we will learn how to add these labels onto the graph near their respective lines.
