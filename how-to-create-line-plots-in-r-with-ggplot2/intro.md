### Welcome!

Welcome to '*How to Create Line-plots in R with ggplot2*'! In this scenario, we will cover how to build a **line plots** for time-dependent data.

This scenario assumes you've done some data wrangling with [`tidyr` and `dplyr`](https://katacoda.com/orm-mfrigaard/scenarios/01-format-shape-data), and [data visualization with `ggplot2`](https://www.katacoda.com/orm-mfrigaard/scenarios/02-intro-ggplot2).

### Knowing your data

It's best to start a project off with a '*view of the forest from outside the trees*'. The technical term for this is [data lineage](https://en.wikipedia.org/wiki/Data_lineage#), which

> "includes the data origin, what happens to it, and where it moves over time."

Having a "birds" eye view' of the data ensures there weren't any problems with exporting or importing. Data lineage also means understanding where the data are coming from (relational database, API, flat .csv files, etc.)?

### Tabular data

Knowing some of the technical details behind a dataset lets us frame the questions or problems we're trying to tackle. In this scenario, we will use [tabular data](http://bit.ly/3aXXB4I) data (i.e. [spreadsheets](https://en.wikipedia.org/wiki/Spreadsheet), Tabular data organizes information into columns and rows.

Let's load some data and get started!
