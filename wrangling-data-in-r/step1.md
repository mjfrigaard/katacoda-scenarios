Launch the R REPL with `R`

### Loading packages 

The  `tidyverse` started as the brainchild of RStudio Chief Scientist [Hadley Wickham](http://hadley.nz/). The `tidyverse` package actually loads multiple packages, all of which are centered around the common thread of [tidy data](https://vita.had.co.nz/papers/tidy-data.pdf) (more on this later). These packages were designed to work well together.

Install the `tidyverse` package (this requires an internet connection outside of Katacoda).

```
install.packages("tidyverse")
```

 Load the package with the `library()` function.

```
library(tidyverse)
```

R is an object-oriented and functional programming language. This just means it's made up of objects and functions. When we load data into R, we're creating a data object. In order to do things to this data object (manipulate, analyze, visualize, model, etc.), we'll need to use functions.

### Using functions

If you want to use a function from a package, the syntax for doing this is `package::function()`. For example, below we'll use the `tidyverse_logo()` function from the `tidyverse` package to view the awesome logo. 

```
tidyverse::tidyverse_logo()
``````{{execute}}

### Creating data

Next we're going to create a dataset with the `tibble::tribble()` function. Access the help file (enter `??tibble::tribble` in the R console) or read the documentation on the [tibble website](https://tibble.tidyverse.org/) to see how this function works, 

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
```{{execute}}

To view the contents of `BpData`, we can enter the name into the console and a preview of the data will print to the Terminal.

```
# print data
BpData
```{{execute}}
