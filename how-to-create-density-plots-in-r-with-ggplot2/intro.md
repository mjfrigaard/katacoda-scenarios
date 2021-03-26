# Welcome!

Welcome to "How to Create Density Plots in R with ggplot2!" In this scenario, we will cover how to build a _density plot_ of a single numeric variable.

This scenario assumes you've done some data wrangling with [`tidyr` and `dplyr`](https://learning.oreilly.com/scenarios/-/9781492079064), and [data visualization with `ggplot2`](https://learning.oreilly.com/scenarios/-/9781492079071).

## Knowing your Data

It's best to start a project off with a "view of the forest from outside the trees." The technical term for this is [data lineage](https://en.wikipedia.org/wiki/Data_lineage#), which:

> "Includes the data origin, what happens to it, and where it moves over time."

Having a "bird's eye view" of the data ensures there weren't any problems with exporting or importing. Data lineage also means understanding where the data is coming from (e.g., a relational database, API, flat _.csv_ files, etc.).

## Tabular Data

Knowing some of the technical details behind a dataset lets us frame the questions or problems we're trying to tackle. In this scenario, we will use [tabular data](http://bit.ly/3aXXB4I) data (i.e., [spreadsheets](https://en.wikipedia.org/wiki/Spreadsheet)). Tabular data organizes information into columns and rows.

Let's load some data and get started!
