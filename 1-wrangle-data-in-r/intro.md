# Getting data into the correct shape 

In the wild, we rarely collect data in a format that they can be immediately analyzed or visualized. The steps we use to get data ready for a model or graph are usually referred to as "wrangling" or "cleaning." But don't let these terms mislead you, data wrangling is such a common task that most data scientists consider it up to [80% of a data scientists job](https://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html). 

This scenario will introduce how to use R to wrangle your data. This includes changing columns from one type (or class) to another, calculating new columns using existing columns, and how to remove unneeded columns from your data set.

## Packages and libraries

In this first exercise, we'll be using [`dplyr`](https://dplyr.tidyverse.org/), a package from the [`tidyverse`](https://www.tidyverse.org/).
