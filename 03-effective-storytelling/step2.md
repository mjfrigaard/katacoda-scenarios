### Data lineage: what are we looking at, and where did it come from?

It's best to start a project off with a '*view of the forest from outside the trees*'. The technical term for this is [data lineage](https://en.wikipedia.org/wiki/Data_lineage#), which 

> "includes the data origin, what happens to it, and where it moves over time."

Having a 'birds' eye' view of the data ensures there weren't any problems with exporting or importing. Data lineage also means understanding where the data are coming from--was it collected from an internal relational database, an external vendor, or did it come from the web or social media?

Knowing some of the technical details behind a dataset gives us some framing for the questions or problems we're trying to tackle. 

### Are we seeing what we expected?

Generally speaking, we should know how many columns and rows we should see in a dataset. We should know some general information about the variable formats, too. 

For example, we should see if we're getting date columns (`YYYY-MM-DD`), logical (`TRUE`, `FALSE`, `NA`), numerical measurements (integer (`1L`) or double (`1`)), or categorical data (character (`male` and `female`) or factor ('low`, `medium`, `high`)).

#### Initiate R and load packages

Launch an R console by clicking here -> `R`{{execute}} (Click on the *Run command* icon)

The packages we'll use to view the entire datasets with R are [`visdat`](https://docs.ropensci.org/visdat/) and [`skimr`](https://docs.ropensci.org/skimr/), and we will install/load these packages below:

```
install.packages(c("tidyverse", "visdat", "skimr"))
library(tidyverse)
library(skimr)
library(visdat)
```{{execute}}
