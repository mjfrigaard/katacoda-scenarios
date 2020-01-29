Launch the R REPL with `R`{{execute}}

Install and load the `tidyverse` package.

```
# packages
install.packages("tidyverse")
library(tidyverse)
```{{execute}}

When using a function from a package, the syntax is `package::function()`. We will use the `tibble` package to create the `BpData` dataset with the code below.

To view the contents of `BpData`, you simply enter the name into the console and a preview of the data will print to the Terminal.

```
# create data
BpData <- tibble::tribble(
  # variable names
  ~name, ~dob, ~wt_kg, ~ht_m, ~bp_d, ~bp_s,
  # data
  "john", "1985-10-13", 100L, "2.1", 80L, 130L,
  "peter", "1979-08-04", 82L, "1.9", 65L, 126L,
  "steve", "1981-04-23", 95L, "1.7", 70L, 119L,
  "sally", "1983-03-28", 72L, "1.5", 75L, 129L,
  "beth", "1986-06-07", 76L, "1.6", 78L, 126L,
  "kate", "1982-08-19", 69L, "1.5", 74L, 121L
)
# print data
BpData
```{{execute}}
