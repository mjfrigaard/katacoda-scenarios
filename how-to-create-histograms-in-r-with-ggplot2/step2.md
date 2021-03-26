# Load Data

The data we'll be using in this scenario comes from [the `TidyTuesday` project](https://github.com/rfordatascience/tidytuesday), a data repository whose intent is:

> "To provide a safe and supportive forum for individuals to practice their wrangling and data visualization skills independent of drawing conclusions."

We're going to use a dataset of ramen ratings from [The Ramen Rater](https://www.theramenrater.com/resources-2/the-list/). Read more about the data [here](https://github.com/rfordatascience/tidytuesday/tree/master/data/2019/2019-06-04).

In the following, we import the raw data from an external .csv file into `Ramen` and get a `skimr::skim()` summary (stored in `RamenSkim`):

```
Ramen <- readr::read_csv("https://bit.ly/38sO0S7")
RamenSkim <- skimr::skim(Ramen)
```{{execute}}

### Review data

View the character variables in `RamenSkim`:

```
RamenSkim %>%
  skimr::yank("character")
```{{execute}}

## How Complete Is the Data?

View the `mean`, standard deviation (`sd`), minimum (`p0`), median (`p50`), maximum (`p100`), and `hist` for the numeric variables in `Ramen`:

```
RamenSkim %>%
  skimr::focus(numeric.mean, numeric.sd,
               numeric.p0, numeric.p50, numeric.p100,
               numeric.hist) %>%
  skimr::yank("numeric")
```{{execute}}

Pay attention to the `hist` column for `stars`--it shows the distribution for the values. *Where are most of the values concentrated?*

We will investigate the distribution of `stars` by building a histogram with `ggplot2`. Now we have an idea of the numbers we want to include in our visualization, so we're ready to create our graph. Building graphs with the `ggplot2` syntax can be expressed in the following template:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/how-to-create-histograms-in-r-with-ggplot2/img/ggplot2-template.png)

If you need a refresher on `ggplot2` layers and mapping, check out the ["Build Beautiful, Customized Graphs and Charts in R with ggplot2" scenario](https://learning.oreilly.com/scenarios/-/9781492079071).
