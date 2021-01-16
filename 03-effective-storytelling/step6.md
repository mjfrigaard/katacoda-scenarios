### Counting things 

> "Data science is mostly counting things." - [Sam Firke](https://cran.r-project.org/web/packages/janitor/vignettes/tabyls.html)

Data visualizations are drawings made with numbers. The challenge is picking the best image for the numbers you want to show. Before you can choose what you want to draw, you need to decide which numbers you'd like to display. 

### Column/bar charts

In a bar (or column) chart, each bar/column length represents a numeric value. The number of levels determines the number of bars or columns.

We will create a bar chart of the `bats` variable in `People`, which measures whether the player bats left-handed (`L`), right-handed (`R`), both (`B`), or if these data are missing (`NA`). Below we'll use `dplyr` 's `count()` function to tally the number of values for the different category items in `bats`.

```
People %>% 
  count(bats, sort = TRUE)
```{{execute}}


In `ggplot2`, we create a bar chart using the `geom_bar()` function. First we map `bats` to both `x` and `fill` inside the `ggplot(aes())` functions. If you need a refresher on `ggplot2` layers and mapping, check out the [previous scenario](https://www.katacoda.com/orm-mfrigaard/scenarios/02-intro-ggplot2). 

We also remove the legend with `guides(fill = FALSE)`, and add labels for `title`, `subtitle`, `caption`, and `y` axis (`x` is set to `NULL`).

```
# click to execute code
gg_step6_bar_01 <- People %>% 
  ggplot(aes(x = bats, fill = bats)) + 
  geom_bar() + 
  guides(fill = FALSE) +
  labs(title = "MILB Player's batting hand",
       subtitle = "Left (L), right (R), or both (B)",
       caption = "source: http://www.seanlahman.com/",
       x = NULL, y = "Number of birth countries")
# save
ggsave(plot = gg_step6_bar_01,
        filename = "gg-step6-bar-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

We will need to open the `gg-step6-bar-01.png` graph in the vscode IDE (above the Terminal console). 

### Counting top 10 birth countries

`geom_bar()` only takes a single categorical (or factor) variable. Sometimes we'll need to specify the variable we want to map to the `y` axis. For example, the code below uses `dplyr::filter()` and `dplyr::count()` to get return top 10 non-US 'Country of birth' for players in the `People` dataset. We then use `utils::head()` to return the top 10 rows, and `dplyr::mutate()` with `forcats::fct_inorder()` to change the format of the `birthCountry` variable to a factor.

```
People %>% 
  filter(birthCountry != "USA" & !is.na(birthCountry)) %>% 
  count(birthCountry, sort = TRUE) %>% 
  head(10) %>% 
  mutate(birthCountry = fct_inorder(birthCountry))
```{{execute}}

In this case, we have two variables in this output: `birthCountry` and 'n'. If we're going to build a graph from these data, we know we'll need a way to represent both the country's name and the number of times it occurs.

For this graph, we will need to use `ggplot2's `geom_col()` function (we will include the code from above, which creates a dataset with only the top 10 non-US birth countries). 

We also map `birthCountry` to `fill`, remove the legend with `guides(fill = FALSE)`, and add a label for the `y` axis with `ggplot2::labs()`.

```
# click to execute code
gg_step6_col_01 <- People %>% 
  filter(birthCountry != "USA" & !is.na(birthCountry)) %>% 
  count(birthCountry, sort = TRUE) %>% 
  head(10) %>% 
  mutate(birthCountry = fct_inorder(birthCountry)) %>%  
  ggplot(aes(x = birthCountry, y = n, fill = birthCountry)) + 
  geom_col() +
  guides(fill = FALSE) +
  labs(title = "Top 10 Non-US brith countries", 
       subtitle = "source: http://www.seanlahman.com/",
       x = NULL, y = "Number of birth countries")
# save
ggsave(plot = gg_step6_col_01,
        filename = "gg-step6-col-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

We will need to open the `gg-step6-col-01.png` graph in the vscode IDE (above the Terminal console). 

### Flip the coordinates

If we find the `x` axis gets cluttered and difficult to read, we can pivot the columns' display with the `ggplot2::coord_flip()` function. Note that we also need to change the `forcats` function in `mutate()` to `fct_reorder()`.

```
# click to execute code
gg_step6_col_02 <- People %>% 
  filter(birthCountry != "USA" & !is.na(birthCountry)) %>% 
  count(birthCountry, sort = TRUE) %>% 
  head(10) %>% 
  # reorder the birthCountry by n
  mutate(birthCountry = fct_reorder(birthCountry, n)) %>%  
  ggplot(aes(x = birthCountry, y = n, 
             fill = birthCountry)) + 
  geom_col() +
  guides(fill = FALSE) +
  # flip coordinates
  coord_flip() +
  labs(title = "Top 10 Non-US brith countries", 
       subtitle = "source: http://www.seanlahman.com/",
       y = NULL, x = "Number of birth countries")
# save
ggsave(plot = gg_step6_col_02,
        filename = "gg-step6-col-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

We will need to open the `gg-step6-col-02.png` graph in the vscode IDE (above the Terminal console). 

### Communication tips

Bar charts and column charts display the counts for each different response in the categorical variable. We can help our audience interpret these graphs by always setting the count axis scale to zero, sorting the chart's values to make it easier to read, and flipping the `x` axis if it is difficult to read.  
