# Getting started in R

Launch an R console by clicking here -> `R`{{execute}} (Click on the *Run command* icon)

You are looking at the R [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) (read-eval-print-loop) katacoda has designed to run R in our browser. 

## R: a rapid overview

R is an object-oriented, functional programming scripting language for data manipulation, graphics, statistics, and machine learning. Most of these terms will only matter to computer scientists, but they're here if you'd like to look them up later. 

## Using R packages 

We will be using the popular `tidyr` and `dplyr` packages for data manipulation. These packages are both part of the `tidyverse,` which is a suite of tools pioneered by RStudio's Chief Scientist [Hadley Wickham](http://hadley.nz/). All packages in the `tidyverse` work well together because they center around a common thread of [tidy data](https://vita.had.co.nz/papers/tidy-data.pdf). 

Install the `tidyverse` package by clicking on the 'copy' icon below and pasting the code into the Terminal window, then hitting <kbd>enter</kbd> or <kbd>return</kbd>. 

<kbd>Ctrl</kbd>+<kbd>V</kbd>

*or*

<kbd>Cmd</kbd>+<kbd>V</kbd>


```
# click to copy code
install.packages("tidyverse")
```{{copy}}

Load the package with the `base::library()` function.

```
# click to copy code
library(tidyverse)
```{{copy}}

### The R language

R is an object-oriented and functional programming language, which means objects and functions make up the majority of R's grammar and syntax. When we load data into R, these data get stored in a data object. To do things to any data object (manipulate, analyze, visualize, model, etc.), we'll need to use functions. We can write custom functions, or we can use one of the over 10,000 user-written packages available on [CRAN](https://cran.r-project.org/). 

### Code style

The code in this scenario follows the [`tidyverse` style guide]() as closely as possible. 

> "*Each line of a comment should begin with the comment symbol and a single space: `#`*"

```
# comments aren't run in the terminal 
```

> "*In data analysis code, use comments to record important findings and analysis decisions. If you need comments to explain what your code is doing, consider rewriting your code to be clearer.*"

### Using R functions

If we want to use a function from a package, the syntax for doing this is `package::function()` 

For example, below, we'll use the `tidyverse_logo()` function from the `tidyverse` package to view the awesome logo. 

(Click on the *Run command* icon)

```
# click to execute code
tidyverse::tidyverse_logo()
```{{execute}}
