# Getting your data into the correct shape 

We rarely collect data in a way that can be immediately analyzed or visualized. "Wrangling," "munging," or "cleaning" are the steps to prepare data for a table, graph, algorithm, or model. These terms might sound like they're referring to tedious, menial work, but data wrangling is such a common task that most data scientists [consider it up to 80% of their job](https://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html). 

This scenario will introduce how to use R to format and shape (or *reformat* and *reshape*) your data. We will cover moving columns to rows (and vice versa), changing variables from one type (or class) to another, calculating and creating new columns from existing columns, and how to remove unneeded columns or rows from your data set.

## Packages and libraries

In this first exercise, we'll be using [`dplyr`](https://dplyr.tidyverse.org/), a package from the [`tidyverse`](https://www.tidyverse.org/).
