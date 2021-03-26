# Getting started in R

Launch an R console by clicking here: `R`{{execute}}.


You are looking at the R [read-eval-print-loop (REPL)](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) that Katacoda has designed to run R in our browser.

## The R Language (In Brief)

R is an object-oriented functional programming scripting language. R is free and open-source software (FOSS) with a massive global community of users and developers who have helped create and maintain tools for data manipulation, graphics, statistics, and machine learning.

Generally speaking, the R language has functions, commands, and operators.

*Functions* take `input`s and return `output`s:

```
function('input') {

    perform command(s) on 'input'

    return output
}
output
```

*Commands* are verbs we use to tell the R to do something. Unlike functions, commands don't always return an `output`.

For example, `install.packages()` downloads and installs R packages into a local folder on our computer, and the `library()` command loads the packages:

```
install.packages("tidyverse")
library(tidyverse)
```


*Operators* are symbols (or collections of symbols) for performing arithmetic (`+`, `-`, `*`, `/`), Boolean (logical) operations (`TRUE` or `FALSE`), comparisons (`<`, `>`, `=<`, `=>`), and assignment (`<-` and `=`).

### R packages

R `packages` are collections of commands for a particular purpose or task. R comes "out of the box" with a handful of useful commands.

For this scenario, we'll be using the `tidyr` and `dplyr` packages for data manipulation. Both packages are part of the `tidyverse,` which is a suite of tools pioneered by RStudio's Chief Scientist [Hadley Wickham](http://hadley.nz). All packages in the `tidyverse` work well together because they center around a common thread of [tidy data](https://vita.had.co.nz/papers/tidy-data.pdf).

### Data in R

When we load data into R, this data gets stored in a data object. To do things to any data object (manipulate, analyze, visualize, model, etc.), we'll need to use functions. We can write custom functions, or we can use one of the over 10,000 user-written packages available on [CRAN](https://cran.r-project.org/).

### R in the Katacoda Terminal

Manipulating data in R requires sending commands to the Terminal. Sometimes these are commands we type ourselves, other times we will copy and paste code we adapt from another source (like [Stack Overflow](https://stackoverflow.com/)). **THIS IS A NORMAL PART OF CODING!** Feel free to adapt and experiment with code you find (provided it's not someone else's private work).

Install the `tidyverse` package by clicking on the Copy icon below and pasting the code into the Terminal window, then hitting <kbd>Enter</kbd> or <kbd>Return</kbd>.

<kbd>Ctrl</kbd>+<kbd>V</kbd>

*or*

<kbd>Cmd</kbd>-<kbd>V</kbd>


```
# click to copy code
install.packages("tidyverse")
```{{copy}}

Load the package with the `base::library()` function:

```
# click to copy code
library(tidyverse)
```{{copy}}


### R Code style

The code in this scenario follows the [`tidyverse` style guide](https://style.tidyverse.org/) as closely as possible.

> "Each line of a comment should begin with the comment symbol and a single space: `#`"

```
# comments aren't run in the terminal
```

> "In data analysis code, use comments to record important findings and analysis decisions. If you need comments to explain what your code is doing, consider rewriting your code to be clearer."

### Using R functions

If we want to use a function from a package, the syntax for doing this is `package::function()`.

For example, below, we'll use the `tidyverse_logo()` function from the `tidyverse` package to view an awesome logo:

```
# click to execute code
tidyverse::tidyverse_logo()
```{{execute}}


The `tidyverse::tidyverse_logo()` function can run without any arguments (i.e., nothing inside the parentheses), but we can view the arguments by placing the cursor inside the parenthesis and hitting the <kbd>Tab</kbd> key.

We can enter function arguments by position or name (see below):

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/00-name-arg.png?raw=true)

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/00-position-arg.png?raw=true)
