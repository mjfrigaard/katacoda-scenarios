### Data lineage: the background on our data

It's best to start a project off with a '*view of the forest from outside the trees*'. The technical term for this is [data lineage](https://en.wikipedia.org/wiki/Data_lineage#), which 

> "includes the data origin, what happens to it, and where it moves over time."

Having a 'birds' eye view' of the data ensures there weren't any problems with exporting or importing. Data lineage also means understanding where the data are coming from--was it collected from an internal relational database, an external vendor, or did it come from the web or social media?

Knowing some of the technical details behind a dataset lets us frame the questions or problems we're trying to tackle. 

### Initiate R 

Launch an R console by clicking here -> `R`{{execute}} (Click on the *Run command* icon)

### Load packages

The package we'll use to view the entire dataset with R is [`skimr`](https://docs.ropensci.org/skimr/). We will install and load these packages below:

```
# click to execute code
install.packages(c("tidyverse", "skimr"))
library(tidyverse)
library(skimr)
```{{execute}}
