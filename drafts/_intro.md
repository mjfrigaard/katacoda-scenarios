# Getting your data into the correct shape

We rarely collect data in a format that they can be immediately analyzed or visualized. Data "wrangling" or "cleaning" are the steps we use to prepare data for a model or graph. These terms might sound like tedious, menial work, and data wrangling is such a common task that most data scientists consider it up to [80% of a data scientist job](https://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html).

This scenario will introduce how to use R to wrangle your data. Wrangling includes (but is not limited to) changing columns from one type (or class) to another, calculating new columns using existing columns, and how to remove unneeded columns from your data set.

## Packages and libraries

In this first exercise, we'll be using [`dplyr`](https://dplyr.tidyverse.org/), a package from the [`tidyverse`](https://www.tidyverse.org/).
