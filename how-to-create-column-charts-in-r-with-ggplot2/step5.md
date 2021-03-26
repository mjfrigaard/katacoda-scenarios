### Building a Column Chart

For our column chart, we will need to use `ggplot2`s `geom_col()` function (we will include the code from the previous step, which creates a dataset with only the top 10 non-US birth countries).

To use `geom_col()` we'll need to specify the variables we want mapped to the `x` and `y` axes (`geom_bar()` only takes a single categorical (or factor) variable). We also map `birthCountry` to `fill`, remove the legend with `show.legend = FALSE`, and add a label for the `y` axis with `ggplot2::labs()`.

```
# click to execute code
gg_step5_col_01 <- People %>%
  filter(birthCountry != "USA" & !is.na(birthCountry)) %>%
  count(birthCountry, sort = TRUE) %>%
  head(10) %>%
  mutate(birthCountry = fct_inorder(birthCountry)) %>%  
  ggplot(aes(x = birthCountry, y = n, fill = birthCountry)) +
  # remove legend
  geom_col(show.legend = FALSE) +
  # add label
  labs(title = "Top 10 Non-US birth countries for MLB players",
       subtitle = "Based on birthCountry",
       caption = "source: http://www.seanlahman.com/",
       x = NULL, y = "Number of birth countries")
# save
ggsave(plot = gg_step5_col_01,
        filename = "gg-step5-col-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Click here on the `gg-step5-col-01.png`{{open}} file to view the graph.


### Flip the coordinates

If we find the `x` axis gets cluttered and difficult to read, we can pivot the columns' display with the `ggplot2::coord_flip()` function. Note that we also need to change the `forcats` function in `mutate()` to `fct_reorder()`.

```
# click to execute code
gg_step5_col_02 <- People %>%
  filter(birthCountry != "USA" & !is.na(birthCountry)) %>%
  count(birthCountry, sort = TRUE) %>%
  head(10) %>%
  # reorder the birthCountry by n
  mutate(birthCountry = fct_reorder(birthCountry, n)) %>%  
  ggplot(aes(x = birthCountry, y = n,
             fill = birthCountry)) +
  geom_col(show.legend = FALSE) +
  # flip coordinates
  coord_flip() +
  labs(title = "Top 10 Non-US birth countries for MLB players",
       subtitle = "Based on birthCountry",
       caption = "source: http://www.seanlahman.com/",
       x = NULL, y = "Number of birth countries")
# save
ggsave(plot = gg_step5_col_02,
        filename = "gg-step5-col-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Click here on the `gg-step5-col-02.png`{{open}} file to view the graph (or open the graph in the vscode IDE above the Terminal console).

### Communication tips

Bar charts and column charts display the counts for each different response in the categorical variable. We can help our audience interpret these graphs by always setting the count axis scale to zero, sorting the chart's values to make it easier to read, and flipping the `x` axis if it is difficult to read.  
 


