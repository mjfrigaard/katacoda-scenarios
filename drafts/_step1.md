# Getting started in R

Launch an R console by clicking here -> `R`{{execute}}

You are looking at the R [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) (read-eval-print-loop) katacoda has designed to run R in our browser.

## R: a very quick overview

R is an object-oriented, functional programming scripting language for data manipulation, graphics, statistics, and machine learning. Most of these terms will only matter to computer scientists, but they're here if you'd like to look them up later.

Data in R is stored as an object, functions are called on these objects, and the new object containing all the result

## R packages

R is an open-source statistical software, and thousands of users and developers have contributed over 10,000 packages for working with data. We will be using the popular `dplyr` package for data manipulation. `dplyr` is part of the `tidyverse`, which is a suite of packages pioneered by RStudio's Chief Scientist [Hadley Wickham](http://hadley.nz/).


The `tidyverse` package will load multiple packages, all of which are centered around the common thread of [tidy data](https://vita.had.co.nz/papers/tidy-data.pdf) (more on this later). These packages were designed to work well together.

Install the `tidyverse` package (this requires an internet connection outside of Katacoda).

```
install.packages("tidyverse")
```

Load the package with the `base::library()` function.

```
library(tidyverse)
```

R is an object-oriented and functional programming language, which means it's made up of objects and functions. When we load data into R, these data get stored in a data object. In order to do things to this data object (manipulate, analyze, visualize, model, etc.), we'll need to use functions.

### Using functions

If we want to use a function from a package, the syntax for doing this is `package::function()`. For example, below we'll use the `tidyverse_logo()` function from the `tidyverse` package to view the awesome logo.

```
tidyverse::tidyverse_logo()
```{{execute}}
