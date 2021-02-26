### Load data

These data come from [the `TidyTuesday` project](https://github.com/rfordatascience/tidytuesday), a data repository who's intent is 

> "to provide a safe and supportive forum for individuals to practice their wrangling and data visualization skills independent of drawing conclusions."

We're going to use a dataset of Ramen ratings from [The Ramen Rater](https://www.theramenrater.com/resources-2/the-list/). Read more about these data [here](https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-06-04).

Below we import the raw data from an external .csv file into `Ramen` and get a `skimr::skim()` summary (stored in `RamenSkim`). 


```
Ramen <- readr::read_csv("https://bit.ly/38sO0S7")
RamenSkim <- skimr::skim(Ramen)
```{{execute}}

### Review data 

View the character variables in `RamenSkim`

```
RamenSkim %>% 
  skimr::yank("character")
```{{execute}}

*How complete are these data?*

View the `mean`, standard deviation (`sd`), minimum (`p0`), median (`p50`), maximum (`p100`), and `hist` for the numeric variables in `Ramen`.

```
RamenSkim %>% 
  skimr::focus(numeric.mean, numeric.sd, 
               numeric.p0, numeric.p50, numeric.p100,
               numeric.hist) %>% 
  skimr::yank("numeric")
```{{execute}}

Pay attention to the `hist` column for `stars`--it shows the distribution for the values. *Where are most of the values concentrated?* 

We will investigate the variation of `stars` across `style` with a box-plot. Box-plots are a great way of viewing the summary statistics for a numeric variable (like `stars`) across multiple levels of a categorical variable (like `style`).

Now we have an idea of the numbers we want to include in our visualization, so we're ready to create our graph. Building graphs with the `ggplot2` syntax can be expressed in the following template:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/how-to-create-histograms-in-r-with-ggplot2/img/ggplot2-template.png)

If you need a refresher on `ggplot2` layers and mapping, check out the [Introduction to the Grammar of Graphics scenario](https://www.katacoda.com/orm-mfrigaard/scenarios/intro-ggplot2).
