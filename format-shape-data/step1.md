## Getting started in R

Launch an R console by clicking here -> `R`{{execute}} (Click on the *Run command* icon)

You are looking at the R [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) (read-eval-print-loop) Katacoda has designed to run R in our browser. 

## The R language (in brief)

R is an object-oriented, functional programming scripting language. R is a free and open-source software (FOSS) with a massive global community of users and developers who have helped create and maintain tools for data manipulation, graphics, statistics, and machine learning.

Generally speaking, R is comprised of *functions*, *commands*, and *operators*.

*Functions* take `input`s and return `output`s: 

```
function(input) {

    perform command(s) on 'input'
    
    return 'output'
}
```

*Commands* are verbs we use to tell the R to do something. Unlike *functions*, *commands* don't always return an `output`. 

For example, `install.packages()` downloads and installs R packages into a local folder on our computer, and the `library()` command loads the packages.

```
install.packages("tidyverse")
library(tidyverse)
```


*Operators* are symbols (or collections of symbols) for performing arithmetic (`+`, `-`, `*`, `/`), Boolean (logical) operations (`TRUE` or `FALSE`), comparisons (`<`, `>`, `=<`, `=>`), and assignment (`<-` and `=`).

### R packages 

R `packages` are collections of commands for a particular purpose or task. R comes 'out of the box' with a handful of useful commands. 

For this scenario, we'll be using the popular `tidyr` and `dplyr` packages for data manipulation. Both packages are part of the `tidyverse,` which is a suite of tools pioneered by RStudio's Chief Scientist [Hadley Wickham](http://hadley.nz/). All packages in the `tidyverse` work well together because they center around a common thread of [tidy data](https://vita.had.co.nz/papers/tidy-data.pdf). 

### Data in R

When we load data into R, these data get stored in a data object. To do things to any data object (manipulate, analyze, visualize, model, etc.), we'll need to use functions. We can write custom functions, or we can use one of the over 10,000 user-written packages available on [CRAN](https://cran.r-project.org/).

### Using R in the Terminal


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

 

### R Code style

The code in this scenario follows the [`tidyverse` style guide]() as closely as possible. 

> "*Each line of a comment should begin with the comment symbol and a single space: `#`*"

```
# comments aren't run in the terminal 
```

> "*In data analysis code, use comments to record important findings and analysis decisions. If you need comments to explain what your code is doing, consider rewriting your code to be clearer.*"

### Using R functions

If we want to use a function from a package, the syntax for doing this is `package::function()` 

For example, below, we'll use the `tidyverse_logo()` function from the `tidyverse` package to view an awesome logo. 

(Click on the *Run command* icon)

```
# click to execute code
tidyverse::tidyverse_logo()
```{{execute}}


The `tidyverse::tidyverse_logo()` function can be entered without any arguments (i.e. nothing inside the parentheses), but we can view the arguments by placing the cursor inside the parenthesis and hitting the <kbd>tab</kbd> key. 

Function arguments can be entered by position or name (see below).

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/00-name-arg.png?raw=true)

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/00-position-arg.png?raw=true)
