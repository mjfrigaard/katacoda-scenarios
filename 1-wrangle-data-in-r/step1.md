# Lets get started!

Launch an R session by clicking here -> `R`{{execute}}

This is an R REPL (read-eval-print-loop) designed to run R in your browser. 

R is an open-source statistical software, and thousands of users and developers have contributed over 10,000 packages for working with data. We will be using the popular `dplyr` package for data manipulation. `dplyr` is part of the `tidyverse`, which is a suite of packages pioneered by RStudio Chief Scientist [Hadley Wickham](http://hadley.nz/). 

### Loading packages 

The `tidyverse` package will load multiple packages, all of which are centered around the common thread of [tidy data](https://vita.had.co.nz/papers/tidy-data.pdf) (more on this later). These packages were designed to work well together.

Install the `tidyverse` package (this requires an internet connection outside of Katacoda).

```
install.packages("tidyverse")
```

Load the package with the `library()` function.

```
library(tidyverse)
```

R is an object-oriented and functional programming language, which means it's made up of objects and functions. When we load data into R, these data get stored in a data object. In order to do things to this data object (manipulate, analyze, visualize, model, etc.), we'll need to use functions.

### Using functions

If we want to use a function from a package, the syntax for doing this is `package::function()`. For example, below we'll use the `tidyverse_logo()` function from the `tidyverse` package to view the awesome logo. 

```
tidyverse::tidyverse_logo()
```{{execute}}
