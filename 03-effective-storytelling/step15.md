### Visualizing relationships (3)

Sometimes we will want to look at how a particular measurement changes over time or trends. When we're visualizing trends, the `x` axis typically the measure of time, and the `y` axis contains our measurement of interest. Each time point along the `x` axis has a corresponding value on the `y` axis, and lines connect these points. These lines are extended along the `x` axis's full scale to display the change over time (or the trend). See the example from the FiveThirtyEight article titled, ["Comic Books Are Still Made By Men, For Men And About Men"](https://fivethirtyeight.com/features/women-in-comic-books/):


![](https://fivethirtyeight.com/wp-content/uploads/2014/10/hickey-feature-comics-3.png?w=1220)

We're going to re-create this chart using data from the `fivethirtyeightdata` package. 

### Comic Book Data

The [`fivethirtyeightdata` package](https://fivethirtyeight-r.netlify.app/) contains data from the [FiveThirtyEight Github repository](https://github.com/fivethirtyeight/data), but these data have been formatted to provide "*tame data principles for introductory statistics and data science courses.*"

We are going to load the `comic_characters` dataset from the article above. We're only interested in a subset of this dataset, so we select the relevant variables and do some initial formatting steps before assigning them to the `ComicData` (read more about the data [here](https://cran.r-project.org/web/packages/fivethirtyeight/vignettes/fivethirtyeight.html)).

```
# click to execute code
ComicData <- read_csv("https://bit.ly/3oS1zQY") 
```{{execute}}

```
# click to execute code

# subset data
ComicData <- ComicData %>% 
  # select only publisher, name, sex, year, 
  # and date
  select(publisher, name, sex, year, date) %>% 
  # filter to only the rows containing either 
  # male or female characters
  filter(sex %in% c("Female Characters", 
                    "Male Characters")) %>% 
  # convert these two variables to factors
  mutate(sex = factor(sex, 
                      levels = c("Female Characters", 
                                 "Male Characters")),
         publisher = factor(publisher, 
                            levels = c("Marvel", "DC"))) %>% 
  # remove all missing values
  drop_na()
# view
glimpse(ComicData)
```{{execute}}

We formatted two variables in `ComicData` as `factor`s. We will use `skimr::skim()` to get an overview of `publisher` and `sex`.

### Factors

Factor variables are unique kinds of qualitative or categorical variables in R because they have a ["fixed and known set of possible values."](https://r4ds.had.co.nz/factors.html). We assigned these values with the `levels` argument.

The `skimr` output below shows us the two new factor variables we've created in `ComicNewFemalePerc`. 

```
# click to execute code
ComicData %>% 
  skimr::skim() %>% 
  skimr::yank("factor") 
```{{execute}}

The `top_counts` column tells us the counts for both levels in `publisher` and `sex`.

### Summarizing data 

To recreate the graph above, we'll need to summarize the `ComicData` data. We need `year` represented on the `x` axis, and the percentage of female comic book characters for each `publisher` represented on the `y` axis. We can do this with `dplyr`s `group_by()`, `summarize()`, `mutate()` and `ungroup()` functions. 

The code below creates two new variables: 

- `sex_n_per_yr_pub`, which is the count of each level of `sex` per year and `publisher`, and  
- `sex_pct_per_yr_pub`, which is the percentage of each level of sex per `year` and `publisher`  

We also filter the `year` variable to only data between `1980` and `2010`.

```
# click to execute code
ComicNewFemalePerc <- ComicData %>% 
  group_by(year, publisher, sex) %>% 
  summarize(sex_n_per_yr_pub = sum(n())) %>% 
  group_by(year, publisher) %>% 
  mutate(sex_pct_per_yr_pub = sex_n_per_yr_pub / sum(sex_n_per_yr_pub),
         sex_pct_per_yr_pub = round(sex_pct_per_yr_pub, digits = 3)) %>% 
  ungroup() %>% 
  filter(year > 1979 & year < 2011)
head(ComicNewFemalePerc)
```{{execute}}

### Labels

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

### Line graph

Now that we have our data and labels, we can build the line graph. First, we need to `filter` the data to only female percentages, then pass the filtered data to `ggplot(aes())`, mapping the `year` to the `x` axis and `sex_pct_per_yr_pub` to the `y` axis.

On the next layer, inside the `ggplot2::geom_line()` function, we map `publisher` to the `group` and `color` aesthetics inside the `aes()` function. Outside the `aes()` function, we make the lines larger by setting the `size` to `2`. 

We need to make a few more customizations to this graph to make it look like the one in the article:

- Note the FiveThirtyEight graph does not have a legend or guide. We can remove the legend by adding a `ggplot2::theme(legend.position = "none")` layer. 

- The `y` axis in the FiveThirtyEight graph ranges from `0` to `50` and is formatted as a percent (`%`). Displaying percentage units helps the audience understand that a proportion is displayed (not the raw counts). We can change the formatting on the `y` axis with the `ggplot2::scale_y_continuous()` function. Set the `limits` argument to `c(0.00, 0.50))`, and the `labels` argument to `scales::percent_format(accuracy = 1)`.

```
# click to execute code
gg_step15_line_01 <- ComicNewFemalePerc %>% 
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
ggsave(plot = gg_step15_line_01,
        filename = "gg-step15-line-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
gg_step15_line_01
```{{execute}}

Open the `gg-step15-line-01.png` graph in the vscode IDE (above the Terminal console). 

Our graph is starting to look like the figure in the article, but we still need to make a few changes. We removed the legend, so we have no way of knowing which line belongs to which publisher (`DC` or `Marvel`). In the next section, we will learn how to add these labels onto the graph near their respective lines.
