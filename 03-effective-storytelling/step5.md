### Counting values (1)

In the previous step, the `skimr` output displayed a small histogram for each numeric variable in the `People` dataset. Histograms display the distribution for a single variable.

### Load data

These data come from [the `TidyTuesday` project](https://github.com/rfordatascience/tidytuesday), a data repository who's intent is 

> "to provide a safe and supportive forum for individuals to practice their wrangling and data visualization skills independent of drawing conclusions"

We're going to use a dataset of Ramen ratings from [The Ramen Rater](https://www.theramenrater.com/resources-2/the-list/). Read more about these data [here](https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-06-04).

Below we import the raw data from an external .csv file into `Ramen` and get a `skimr::skim()` summary (stored in `RamenSkim`)

```
# click to execute code
Ramen <- readr::read_csv("https://bit.ly/38sO0S7")
RamenSkim <- skimr::skim(Ramen)
```{{execute}}

### Review data 

View the character variables in `RamenSkim`

```
# click to execute code
RamenSkim %>% 
  skimr::yank("character")
```{{execute}}

*How complete are these data?*

View the numeric variables in `RamenSkim`

```
# click to execute code
RamenSkim %>% 
  skimr::yank("numeric")
```{{execute}}

Pay attention to the `hist` column for `stars`--it shows the distribution for the values. *What are most of the values concentrated?* 

We are going to investigate the distribution of `stars` by building a histogram with `ggplot2`.

### Build a histogram

We're going to use `ggplot2::geom_histogram()` to view the distribution the `stars` variable in `Ramen`. Note that we are also assigning labels to the graph that include 1) a clear title, 2) descriptive information about the graph, 3) the source of the data.

```
# click to execute code
gg_step5_hist_01 <- Ramen %>% 
  ggplot2::ggplot(aes(x = stars)) + 
  ggplot2::geom_histogram() + 
  ggplot2::labs(
       title = "Distribution of ramen stars", 
       subtitle = "bins = 30",
       caption = "source: https://www.theramenrater.com/resources-2/the-list/")
# save
 ggsave(plot = gg_step5_hist_01, 
        filename = "gg-step5-hist-01.png", 
        device = "png", 
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

We will need to open the `gg-step5-hist-01.png` graph in the vscode IDE (above the Terminal console). 

Histograms are built by stacking the variable values into defined set of `bins`. The default number for `bins` is `30`. We can change the shape of the histogram by changing the `bins` argument. Run the code below to see how the distribution looks with 20 `bins`.

```
# click to execute code
gg_step5_hist_02 <- Ramen %>% 
  ggplot2::ggplot(aes(x = stars)) + 
  ggplot2::geom_histogram(bins = 20) + 
  ggplot2::labs(
       title = "Distribution of ramen stars", 
       subtitle = "bins = 20",
       caption = "source: https://www.theramenrater.com/resources-2/the-list/")
# save
ggsave(plot = gg_step5_hist_02,
       filename = "gg-step5-hist-02.png",
       device = "png",
       width = 9,
       height = 6,
       units = "in")
```{{execute}}

Open the `gg-step5-hist-02.png` graph in the vscode IDE (above the Terminal console). 

The values in `stars` fit into `20` bins better than the default `30`, because we can see where values are concentrated (and the high frequency of 5-star ratings).


