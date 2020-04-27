# Getting your data into the correct shape 

In the wild, we rarely collect data in a format that they can be immediately analyzed or visualized. We refer to the steps we use to get data ready for a model or graph as "wrangling" or "cleaning." But don't let these terms mislead you, data wrangling is such a common task that most data scientists consider it up to [80% of a data scientist job](https://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html). 

*So what is data wrangling?* We like to think of it on two different levels. The first level of data wrangling deals with data shape and structure. Questions we should be asking ourselves about data at this level include:

1. Approximately how many observations should we be seeing, and will they be unique (i.e., will each case have a row)?  
2. Is each variable in a column, and are these variables each measuring exactly one thing?  
3. Should I be expecting missing or incomplete data, and if so, how can I identify them? 

After we've decided on the 

This scenario will introduce how to use R to wrangle your data. Wrangling includes (but is not limited to) changing columns from one type (or class) to another, calculating new columns using existing columns, and how to remove unneeded columns from your data set.

## Packages and libraries

In this first exercise, we'll be using [`dplyr`](https://dplyr.tidyverse.org/), a package from the [`tidyverse`](https://www.tidyverse.org/).
