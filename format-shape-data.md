---
title: "Format and reshape your data in R with the tidyverse"
output: 
  html_document: 
    toc: yes
    toc_float: yes
    highlight: tango
    theme: cosmo
    keep_md: yes
---



# Access the scenario

You can run through this scenario on Katacoda [here](https://katacoda.com/orm-mfrigaard/scenarios/format-shape-data).

# Setup

This scenario is built using the following commands in the Terminal pane in RStudio.

``` {.bash}
# create a new scenario
? Friendly url:  format-shape-data
? Scenario Title:  Format and shape your data in R with the tidyverse
? Scenario Description:  Quickly wrangle your data with the tidyr and dplyr packages from the tidyverse
? Difficulty Level:  Intermediate
? Estimated time: (Please specify in minutes or hours e.g. 2 hours) 40
? Number of Steps (Not including intro & finish):  12
? Image:  rlang:3.4
? Layout:  2x Terminal Split
```

The following folder was created from these commands.


```
#> format-shape-data
#> ├── finish.md
#> ├── index.json
#> ├── intro.md
#> ├── step1.md
#> ├── step10.md
#> ├── step11.md
#> ├── step12.md
#> ├── step2.md
#> ├── step3.md
#> ├── step4.md
#> ├── step5.md
#> ├── step6.md
#> ├── step7.md
#> ├── step8.md
#> └── step9.md
```

We can see all `steps`, the `intro`, and `finish` markdown files. There is also an `index.json` file for managing all the steps in the Katacoda environment.

## Markdown syntax (Katacoda)

Katacoda comes with it's own flavor of Markdown, which you can learn more about [here.](https://katacoda.com/scenario-examples/scenarios/markdown-extensions). The main thing to know is that there are `execute` and `copy` extensions, which you can use in the markdown to indicate whether Katacoda should copy or run the code inside the R REPL.

## Learner personas

The learner personas for this scenario are:

1.  **Horatio** is an executive at a tech company who wants to learn more about data manipulation with R and Python

2.  **Judy** is a product manager at a start-up and needs to restructure data before loading it into their database.

3.  **Andrew** is a graduate student in college and needs to analyze his thesis/dissertation project.

------------------------------------------------------------------------

## Intro

- [x] included in intro.md?

#### Getting your data into the correct shape

We rarely collect data in a way that can be immediately analyzed or visualized. "Wrangling," "munging," or "cleaning" are the steps to prepare data for a table, graph, algorithm, or model. These terms might sound like they're referring to tedious, menial work, but data wrangling is such a common task that most data scientists [consider it up to 80% of their job](https://www.nytimes.com/2014/08/18/technology/for-big-data-scientists-hurdle-to-insights-is-janitor-work.html).

#### Goals & Lessons

This scenario will introduce the following topics in R:

1.  how to get data into R (manually, importing rectangular files, from packages)
2.  how to use R to reshape (or *reformat* and *reshape*) your data (pivot functions)\
3.  how to create new variables based on existing columns
4.  how to create new variables based on conditions (i.e. the values in) existing columns
5.  how to check your work with pivoting

#### The `tidyverse`

In this scenario, we'll be using the [`tidyverse packages`](https://www.tidyverse.org/), "an opinionated collection of R packages designed for data science"

## step 1 

- [x] included in step1.md?

### Getting started in R

Launch an R console by clicking here -\> `R`{{execute}}

You are looking at the R [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) (read-eval-print-loop) Katacoda has designed to run R in our browser.

#### The R language (in brief)

R is an object-oriented, functional programming scripting language. R is free and open-source software (FOSS) with a massive global community of users and developers who have helped create and maintain tools for data manipulation, graphics, statistics, and machine learning.

Generally speaking, the R language has *functions*, *commands*, and *operators*.

*Functions* take `input`s and return `output`s:

``` {.r}
function('input') {

    perform command(s) on 'input'
    
    return output
}
output
```

*Commands* are verbs we use to tell the R to do something. Unlike *functions*, *commands* don't always return an `output`.

For example, `install.packages()` downloads and installs R packages into a local folder on our computer, and the `library()` command loads the packages.

``` {.r}
install.packages("tidyverse")
library(tidyverse)
```

*Operators* are symbols (or collections of symbols) for performing arithmetic (`+`, `-`, `*`, `/`), Boolean (logical) operations (`TRUE` or `FALSE`), comparisons (`<`, `>`, `=<`, `=>`), and assignment (`<-` and `=`).

#### R packages

R `packages` are collections of commands for a particular purpose or task. R comes 'out of the box' with a handful of useful commands.

For this scenario, we'll be using the `tidyr` and `dplyr` packages for data manipulation. Both packages are part of the `tidyverse,` which is a suite of tools pioneered by RStudio's Chief Scientist [Hadley Wickham](http://hadley.nz/). All packages in the `tidyverse` work well together because they center around a common thread of [tidy data](https://vita.had.co.nz/papers/tidy-data.pdf).

#### Data in R

When we load data into R, these data get stored in a data object. To do things to any data object (manipulate, analyze, visualize, model, etc.), we'll need to use functions. We can write custom functions, or we can use one of the over 10,000 user-written packages available on [CRAN](https://cran.r-project.org/).

#### R in the Katacoda Terminal

Manipulating data in R requires sending commands to the Terminal. Sometimes these are commands we type ourselves, other times we will copy + paste code we can adapt from another source (like [Stack Overflow](https://stackoverflow.com/)). **THIS IS A NORMAL PART OF CODING.** Feel free to adapt and experiment with code you find (provided it's not someone else's private work).

Install the `tidyverse` package by clicking on the 'copy' icon below and pasting the code into the Terminal window, then hitting <kbd>enter</kbd> or <kbd>return</kbd>.

<kbd>Ctrl</kbd>+<kbd>V</kbd>

*or*

<kbd>Cmd</kbd>+<kbd>V</kbd>


```r
# click to copy code
install.packages("tidyverse")
```

Load the package with the `base::library()` function.

```r
# click to copy code
library(tidyverse)
```

#### R Code style

The code in this scenario follows the [`tidyverse` style guide](https://style.tidyverse.org/) as closely as possible.

> "*Each line of a comment should begin with the comment symbol and a single space: `#`*"


```r
# comments aren't run in the terminal
```

> "*In data analysis code, use comments to record important findings and analysis decisions. If you need comments to explain what your code is doing, consider rewriting your code to be clearer.*"

#### Using R functions

If we want to use a function from a package, the syntax for doing this is `package::function()`

For example, below, we'll use the `tidyverse_logo()` function from the `tidyverse` package to view an awesome logo.


```r
# click to execute code
tidyverse::tidyverse_logo()
```

```
#> ⬢ __  _    __   .    ⬡           ⬢  . 
#>  / /_(_)__/ /_ ___  _____ _______ ___ 
#> / __/ / _  / // / |/ / -_) __(_-</ -_)
#> \__/_/\_,_/\_, /|___/\__/_/ /___/\__/ 
#>      ⬢  . /___/      ⬡      .       ⬢
```


The `tidyverse::tidyverse_logo()` function can run without any arguments (i.e. nothing inside the parentheses), but we can view the arguments by placing the cursor inside the parenthesis and hitting the <kbd>tab</kbd> key.

We can enter function arguments by position or name (see below).

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-data-wrangle-viz-show/master/figs/00-name-arg.png)

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-data-wrangle-viz-show/master/figs/00-name-arg.png)

## step 2 

- [x] included in step2.md?

### Data in packages

It's hard to learn any of R's capabilities without a dataset. There are multiple ways to get datasets into the R environment, but we'll cover that in another scenario. 

Today we'll be using a dataset from the [`fivethirtyeight` package](https://cran.r-project.org/web/packages/fivethirtyeight/vignettes/fivethirtyeight.html) in R. This package has over 100 datasets from articles on the website [FiveThirtyEight](https://fivethirtyeight.com/).  

The dataset we will be using today comes from the article ["A Statistical Analysis of the Work of Bob Ross."](https://fivethirtyeight.com/features/a-statistical-analysis-of-the-work-of-bob-ross/)

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-data-wrangle-viz-show/master/figs/00-538-bob-ross.png)

Bob Ross was the host of [The Joy of Painting](https://en.wikipedia.org/wiki/The_Joy_of_Painting), a painting educational program from 1980 - 1994.

We'll load the `BobRoss` dataset into R using `fivethirtyeight::bob_ross`. 

First, we have to install and load the package into the R environment.


```r
# click to execute code
install.packages("fivethirtyeight")
library(fivethirtyeight)
```

Now we can assign the `bob_ross` data frame into the `BobRoss` object. 


```r
# click to execute code
BobRoss <- fivethirtyeight::bob_ross
```


```r
# click to execute code
# print data
BobRoss
```

```
#> # A tibble: 403 x 71
#>    episode season episode_num title apple_frame aurora_borealis  barn beach
#>    <chr>    <dbl>       <dbl> <chr>       <int>           <int> <int> <int>
#>  1 S01E01       1           1 A WA…           0               0     0     0
#>  2 S01E02       1           2 MT. …           0               0     0     0
#>  3 S01E03       1           3 EBON…           0               0     0     0
#>  4 S01E04       1           4 WINT…           0               0     0     0
#>  5 S01E05       1           5 QUIE…           0               0     0     0
#>  6 S01E06       1           6 WINT…           0               0     0     0
#>  7 S01E07       1           7 AUTU…           0               0     0     0
#>  8 S01E08       1           8 PEAC…           0               0     0     0
#>  9 S01E09       1           9 SEAS…           0               0     0     1
#> 10 S01E10       1          10 MOUN…           0               0     0     0
#> # … with 393 more rows, and 63 more variables: boat <int>, bridge <int>,
#> #   building <int>, bushes <int>, cabin <int>, cactus <int>,
#> #   circle_frame <int>, cirrus <int>, cliff <int>, clouds <int>,
#> #   conifer <int>, cumulus <int>, deciduous <int>, diane_andre <int>,
#> #   dock <int>, double_oval_frame <int>, farm <int>, fence <int>, fire <int>,
#> #   florida_frame <int>, flowers <int>, fog <int>, framed <int>, grass <int>,
#> #   guest <int>, half_circle_frame <int>, half_oval_frame <int>, hills <int>,
#> #   lake <int>, lakes <int>, lighthouse <int>, mill <int>, moon <int>,
#> #   mountain <int>, mountains <int>, night <int>, ocean <int>,
#> #   oval_frame <int>, palm_trees <int>, path <int>, person <int>,
#> #   portrait <int>, rectangle_3d_frame <int>, rectangular_frame <int>,
#> #   river <int>, rocks <int>, seashell_frame <int>, snow <int>,
#> #   snowy_mountain <int>, split_frame <int>, steve_ross <int>,
#> #   structure <int>, sun <int>, tomb_frame <int>, tree <int>, trees <int>,
#> #   triple_frame <int>, waterfall <int>, waves <int>, windmill <int>,
#> #   window_frame <int>, winter <int>, wood_framed <int>
```

We should pay attention to the information printed in `BobRoss`. As we can see, it's contained in a `tibble`. 

`tibble`s print the dimensions of the dataset (`# A tibble: 403 x 71`), numerical indices for rows (far left), and the type of variable in the dataset (`<chr>` variables have text information vs. `<dbl>` and `<int>` variables which contain numbers), and additional information about the data when it's too big to print on the screen (`… with 393 more rows, and 63 more variables:`)

## step 3 

- [x] included in step3.md?

### Data frames and tibbles

One quick and easy way to get data into R is to create the data 'by hand' using the `tibble::tribble()` function. Read more about tibbles [here in R For Data Science](https://learning.oreilly.com/library/view/r-for-data/9781491910382/ch07.html#tibbles).

These data are stored as a [comma-separated values](https://en.wikipedia.org/wiki/Comma-separated_values) file on Github (see below).

```
title,  bushes,  clouds,
"A WALK IN THE WOODS", 1L, 0L,
"MT. MCKINLEY", 0L, 1L,
"EBONY SUNSET", 0L, 0L,
"WINTER MIST", 1L, 1L,
"QUIET STREAM", 0L, 0L,
"WINTER MOON", 0L, 0L,
"AUTUMN MOUNTAINS", 0L, 0L,
"PEACEFUL VALLEY", 1L, 0L,
"SEASCAPE", 0L, 1L,
"MOUNTAIN LAKE", 1L, 0L,
"WINTER GLOW", 0L, 0L,
"SNOWFALL", 0L, 1L,
"FINAL REFLECTIONS", 1L, 0L,
"MEADOW LAKE", 1L, 0L,
"WINTER SUN", 0L, 0L
```

A description of these variables is below:

+ `title`: Title of episode

+ `bushes`: Present (`1`) or not (`0`)  

+ `clouds`: Present (`1`) or not (`0`)

#### Rectangular data

Both data frames (called `data.frame`s in R) and `tibble`s are rectangular data objects. They have columns and rows for storing data, similar to a spreadsheet in Excel. The main difference between a `tibble` and a `data.frame` is how they are printed to the console. We are going to create a `tibble` and `data.frame` with the data above to demonstrate these differences.

#### Create a `tibble`

The `tibble::tribble()` function takes column names preceded by the tilde (i.e. `~column`), then get separated by commas (`~column1`, `~column2`, `~column3`). Then `tibble::tribble()` reads the data starting on the second line, similar to the way the actual data are stored above.

The `tibble` we create below is a small sample from the [`bob_ross`](https://fivethirtyeight-r.netlify.app/articles/fivethirtyeight.html) dataset. The code below creates `BobRossTibble` from the data above in the R environment.


```r
# click to execute code
BobRossTibble <- tibble::tribble(
                   ~title, ~bushes, ~clouds,
    "A WALK IN THE WOODS",      1L,      0L,
           "MT. MCKINLEY",      0L,      1L,
           "EBONY SUNSET",      0L,      0L,
            "WINTER MIST",      1L,      1L,
           "QUIET STREAM",      0L,      0L,
            "WINTER MOON",      0L,      0L,
       "AUTUMN MOUNTAINS",      0L,      0L,
        "PEACEFUL VALLEY",      1L,      0L,
               "SEASCAPE",      0L,      1L,
          "MOUNTAIN LAKE",      1L,      0L,
            "WINTER GLOW",      0L,      0L,
               "SNOWFALL",      0L,      1L,
      "FINAL REFLECTIONS",      1L,      0L,
            "MEADOW LAKE",      1L,      0L,
             "WINTER SUN",      0L,      0L)
BobRossTibble
```

```
#> # A tibble: 15 x 3
#>    title               bushes clouds
#>    <chr>                <int>  <int>
#>  1 A WALK IN THE WOODS      1      0
#>  2 MT. MCKINLEY             0      1
#>  3 EBONY SUNSET             0      0
#>  4 WINTER MIST              1      1
#>  5 QUIET STREAM             0      0
#>  6 WINTER MOON              0      0
#>  7 AUTUMN MOUNTAINS         0      0
#>  8 PEACEFUL VALLEY          1      0
#>  9 SEASCAPE                 0      1
#> 10 MOUNTAIN LAKE            1      0
#> # … with 5 more rows
```

#### Create a `data.frame`

The `base::data.frame()` function creates columns transposed, with values displayed left to right). We can create `data.frame`s with a series of named vectors, or supply them directly to the function (both work).

Below we create three vectors (`title`, `bushes`, and `clouds`), then supply these to the `base::data.frame()` function and assign it to `BobRossDataFrame`. The names of the vectors end up being the column names.


```r
# click to execute code
title <- c("A WALK IN THE WOODS", "MT. MCKINLEY", "EBONY SUNSET", 
            "WINTER MIST", "QUIET STREAM", "WINTER MOON", "AUTUMN MOUNTAINS", 
            "PEACEFUL VALLEY", "SEASCAPE", "MOUNTAIN LAKE", "WINTER GLOW", 
            "SNOWFALL", "FINAL REFLECTIONS", "MEADOW LAKE", "WINTER SUN")
bushes <- c(1L, 0L, 0L, 1L, 0L, 0L, 0L, 1L, 0L, 1L, 0L, 0L, 1L, 1L, 0L)
clouds <- c(0L, 1L, 0L, 1L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 1L, 0L, 0L, 0L)
BobRossDataFrame <- data.frame(title, bushes, clouds)
BobRossDataFrame
```

```
#>                  title bushes clouds
#> 1  A WALK IN THE WOODS      1      0
#> 2         MT. MCKINLEY      0      1
#> 3         EBONY SUNSET      0      0
#> 4          WINTER MIST      1      1
#> 5         QUIET STREAM      0      0
#> 6          WINTER MOON      0      0
#> 7     AUTUMN MOUNTAINS      0      0
#> 8      PEACEFUL VALLEY      1      0
#> 9             SEASCAPE      0      1
#> 10       MOUNTAIN LAKE      1      0
#> 11         WINTER GLOW      0      0
#> 12            SNOWFALL      0      1
#> 13   FINAL REFLECTIONS      1      0
#> 14         MEADOW LAKE      1      0
#> 15          WINTER SUN      0      0
```

This is the same `data.frame`, but with the vectors supplied as arguments *inside* the `data.frame()` function. 


```r
# click to execute code
BobRossDataFrame <- data.frame(
  title = c("A WALK IN THE WOODS", "MT. MCKINLEY", "EBONY SUNSET", 
            "WINTER MIST", "QUIET STREAM", "WINTER MOON", "AUTUMN MOUNTAINS", 
            "PEACEFUL VALLEY", "SEASCAPE", "MOUNTAIN LAKE", "WINTER GLOW", 
            "SNOWFALL", "FINAL REFLECTIONS", "MEADOW LAKE", "WINTER SUN"),
  bushes = c(1L, 0L, 0L, 1L, 0L, 0L, 0L, 1L, 0L, 1L, 0L, 0L, 1L, 1L, 0L),
  clouds = c(0L, 1L, 0L, 1L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 1L, 0L, 0L, 0L))
BobRossDataFrame
```

```
#>                  title bushes clouds
#> 1  A WALK IN THE WOODS      1      0
#> 2         MT. MCKINLEY      0      1
#> 3         EBONY SUNSET      0      0
#> 4          WINTER MIST      1      1
#> 5         QUIET STREAM      0      0
#> 6          WINTER MOON      0      0
#> 7     AUTUMN MOUNTAINS      0      0
#> 8      PEACEFUL VALLEY      1      0
#> 9             SEASCAPE      0      1
#> 10       MOUNTAIN LAKE      1      0
#> 11         WINTER GLOW      0      0
#> 12            SNOWFALL      0      1
#> 13   FINAL REFLECTIONS      1      0
#> 14         MEADOW LAKE      1      0
#> 15          WINTER SUN      0      0
```

## step 4 

- [x] included in step4.md?

### Importing data from external files

The [`tidyverse readr`](https://readr.tidyverse.org/) package has functions for loading multiple rectangular file types, including [comma-separated value](https://en.wikipedia.org/wiki/Comma-separated_values), [tab-separated value](https://en.wikipedia.org/wiki/Tab-separated_values), and other [fixed width format files](https://www.softinterface.com/Convert-XLS/Features/Fixed-Width-Text-File-Definition.htm).

#### Importing .csv files into R

The code below allows us to import data directly from a web URL. The bitly link takes us to a comma-separated values (.csv) file with the same data we loaded in the previous step.


```r
# click to execute code
SmallBobRoss <- readr::read_csv("https://bit.ly/small-bob-ross")
SmallBobRoss
```

```
#> # A tibble: 5 x 3
#>   title               bushes clouds
#>   <chr>                <dbl>  <dbl>
#> 1 A WALK IN THE WOODS      1      0
#> 2 MT. MCKINLEY             0      1
#> 3 EBONY SUNSET             0      0
#> 4 WINTER MIST              1      1
#> 5 QUIET STREAM             0      0
```

The code above loads the data from an external source (see the data [here](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/data/SmallBobRoss.csv)) into a data object `SmallBobRoss`, then prints this object to the screen.

After these data are loaded into R, we get a message about how the data were formatted,

```
Parsed with column specification:
cols(
  title = col_character(),
  bushes = col_double(),
  clouds = col_double()
)
```

`col_character()` means these data are text, which makes sense because they are the titles for the episodes. The `col_double()` tells us the `bushes` and `clouds` variables were imported as double (a kind of numerical variable in R).

#### Getting a glimpse of the data

We can view the `BobRoss` dataset using `dplyr`'s `glimpse()` function, which shows the data in a transposed view (`glimpse()` displays the variables horizontally, and prints as much data as possible to the screen.


```r
# click to execute code
glimpse(SmallBobRoss)
```

```
#> Rows: 5
#> Columns: 3
#> $ title  <chr> "A WALK IN THE WOODS", "MT. MCKINLEY", "EBONY SUNSET", "WINT…
#> $ bushes <dbl> 1, 0, 0, 1, 0
#> $ clouds <dbl> 0, 1, 0, 1, 0
```

## step 5 

- [x] included in step5.md?

### Two levels of data wrangling 

We like to think of wrangling on two different levels. The first level deals with the data shape and structure. The second level of data wrangling refers to the format of individual variables (which we will get to in the following steps).  

Questions we should be asking ourselves about data at this level include:

1. Approximately how many rows (or observations) and columns (or variables) should we be seeing?  
2. Are all the rows unique (i.e.will each case have a row)?    
3. Does each measurement have a column (or variable)?   
4. Are these variables each measuring exactly one thing?   

#### Reshaping data

A common task for data manipulation is moving columns to rows, or rows to columns. The [`tidyr` package](https://tidyr.tidyverse.org/) in R makes this easy with two `tidyr::pivot_` functions. 

#### Viewing the dataset

`dplyr::glimpse()` is a convenient function for examining the structure and shape of a dataset. Other options include `utils::str()` and `utils::head()`. 


```r
# click to execute code
head(BobRoss)
```

```
#> # A tibble: 6 x 71
#>   episode season episode_num title apple_frame aurora_borealis  barn beach
#>   <chr>    <dbl>       <dbl> <chr>       <int>           <int> <int> <int>
#> 1 S01E01       1           1 A WA…           0               0     0     0
#> 2 S01E02       1           2 MT. …           0               0     0     0
#> 3 S01E03       1           3 EBON…           0               0     0     0
#> 4 S01E04       1           4 WINT…           0               0     0     0
#> 5 S01E05       1           5 QUIE…           0               0     0     0
#> 6 S01E06       1           6 WINT…           0               0     0     0
#> # … with 63 more variables: boat <int>, bridge <int>, building <int>,
#> #   bushes <int>, cabin <int>, cactus <int>, circle_frame <int>,
#> #   cirrus <int>, cliff <int>, clouds <int>, conifer <int>, cumulus <int>,
#> #   deciduous <int>, diane_andre <int>, dock <int>, double_oval_frame <int>,
#> #   farm <int>, fence <int>, fire <int>, florida_frame <int>, flowers <int>,
#> #   fog <int>, framed <int>, grass <int>, guest <int>,
#> #   half_circle_frame <int>, half_oval_frame <int>, hills <int>, lake <int>,
#> #   lakes <int>, lighthouse <int>, mill <int>, moon <int>, mountain <int>,
#> #   mountains <int>, night <int>, ocean <int>, oval_frame <int>,
#> #   palm_trees <int>, path <int>, person <int>, portrait <int>,
#> #   rectangle_3d_frame <int>, rectangular_frame <int>, river <int>,
#> #   rocks <int>, seashell_frame <int>, snow <int>, snowy_mountain <int>,
#> #   split_frame <int>, steve_ross <int>, structure <int>, sun <int>,
#> #   tomb_frame <int>, tree <int>, trees <int>, triple_frame <int>,
#> #   waterfall <int>, waves <int>, windmill <int>, window_frame <int>,
#> #   winter <int>, wood_framed <int>
```

#### Checking for duplicates

We also want to know if there are duplicate rows in the `BobRoss` data, and we can check this by using `dplyr::distinct()` and `base::nrow()` with `base::identical()`

*Number of rows?*


```r
# click to copy code
base::nrow(BobRoss)
```

```
#> [1] 403
```

*distinct rows (note this returns a `tibble`!)*


```r
# click to copy code
dplyr::distinct(.data = BobRoss)
```

```
#> # A tibble: 403 x 71
#>    episode season episode_num title apple_frame aurora_borealis  barn beach
#>    <chr>    <dbl>       <dbl> <chr>       <int>           <int> <int> <int>
#>  1 S01E01       1           1 A WA…           0               0     0     0
#>  2 S01E02       1           2 MT. …           0               0     0     0
#>  3 S01E03       1           3 EBON…           0               0     0     0
#>  4 S01E04       1           4 WINT…           0               0     0     0
#>  5 S01E05       1           5 QUIE…           0               0     0     0
#>  6 S01E06       1           6 WINT…           0               0     0     0
#>  7 S01E07       1           7 AUTU…           0               0     0     0
#>  8 S01E08       1           8 PEAC…           0               0     0     0
#>  9 S01E09       1           9 SEAS…           0               0     0     1
#> 10 S01E10       1          10 MOUN…           0               0     0     0
#> # … with 393 more rows, and 63 more variables: boat <int>, bridge <int>,
#> #   building <int>, bushes <int>, cabin <int>, cactus <int>,
#> #   circle_frame <int>, cirrus <int>, cliff <int>, clouds <int>,
#> #   conifer <int>, cumulus <int>, deciduous <int>, diane_andre <int>,
#> #   dock <int>, double_oval_frame <int>, farm <int>, fence <int>, fire <int>,
#> #   florida_frame <int>, flowers <int>, fog <int>, framed <int>, grass <int>,
#> #   guest <int>, half_circle_frame <int>, half_oval_frame <int>, hills <int>,
#> #   lake <int>, lakes <int>, lighthouse <int>, mill <int>, moon <int>,
#> #   mountain <int>, mountains <int>, night <int>, ocean <int>,
#> #   oval_frame <int>, palm_trees <int>, path <int>, person <int>,
#> #   portrait <int>, rectangle_3d_frame <int>, rectangular_frame <int>,
#> #   river <int>, rocks <int>, seashell_frame <int>, snow <int>,
#> #   snowy_mountain <int>, split_frame <int>, steve_ross <int>,
#> #   structure <int>, sun <int>, tomb_frame <int>, tree <int>, trees <int>,
#> #   triple_frame <int>, waterfall <int>, waves <int>, windmill <int>,
#> #   window_frame <int>, winter <int>, wood_framed <int>
```

*how about we check to see if they're identical?*


```r
# click to execute code
identical(x = nrow(BobRoss), y = nrow(dplyr::distinct(BobRoss)))
```

```
#> [1] TRUE
```

If you see `TRUE`, this means all the rows are unique!

Now we can answer more of the questions above:

1. Approximately how many rows (or observations) and columns (or variables) should we be seeing? *403 rows, 71 columns*
2. Are all the rows unique (i.e.will each case have a row)? *Yes*
3. Does each measurement have a column (or variable)? *...do they? We don't know yet*
4. Are these variables each measuring exactly one thing?   *We have to take a deeper dive into the data and documentation to figure this out*  

#### Pivoting part 1 (reorganizing values in a dataset)

As we can see in the Terminal, the `BobRoss` dataset is full of the variables named for the various objects in his paintings. From `apple_frame` down to `wood_framed`, the objects have what appears to be `0`s and `1`s for values. These are called indicators, or [*binary variables*](https://en.wikipedia.org/wiki/Binary_data#Binary_variables).

#### Moving columns to rows

The columns in `BobRoss` represent various objects in Bob Ross's paintings, and the values in the rows are whether or not the object was present or absent in a particular episode. An image of this data arrangement is below:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-data-wrangle-viz-show/master/figs/01-orig-bob-ross.png)

Can you think of another way to organize the same information? What if we changed the original data from having a column for each different painting object to a format with only two columns: the name of the painting `object`, and whether or not it was `present`. Take a look at the data format below:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-data-wrangle-viz-show/master/figs/02-long-bob-ross.png)

- the `object` column keeps track of the *thing* in the painting (`apple_frame`, `aurora_borealis`, `barn`, etc.),
- the `present` column corresponds to the *number of times* that particular thing occurred,
- the `season`, `episode`, `episode_num`, and `title` information repeats down the rows for every object that was initially in a column


Data arrangements like this are typically called long or tidy, but the vital thing to know is that each value has an index in two places (in this case `object` and `present`). We can convert `BobRoss` into a long dataset using `tidyr::pivot_longer()`.

The `tidyr::pivot_longer()` function takes the following arguments:

1. A data set (`BobRoss`),  
2. The columns we want indexed (the `c(apple_frame:wood_framed)` is shorthand for `apple_frame` through `wood_framed`),  
3. What we want the indexed names to be (`names_to = 'object'`),  
4. What we want the indexed values to be (`values_to = 'present'`)  
 
Click anywhere in the dark area below to run the code and see the result.


```r
# click to execute code
BobRossLong <- pivot_longer(data = BobRoss, 
                            cols = c(apple_frame:wood_framed), 
                            names_to = 'object', 
                            values_to = 'present')
# view data
head(BobRossLong)
```

```
#> # A tibble: 6 x 6
#>   episode season episode_num title               object          present
#>   <chr>    <dbl>       <dbl> <chr>               <chr>             <int>
#> 1 S01E01       1           1 A WALK IN THE WOODS apple_frame           0
#> 2 S01E01       1           1 A WALK IN THE WOODS aurora_borealis       0
#> 3 S01E01       1           1 A WALK IN THE WOODS barn                  0
#> 4 S01E01       1           1 A WALK IN THE WOODS beach                 0
#> 5 S01E01       1           1 A WALK IN THE WOODS boat                  0
#> 6 S01E01       1           1 A WALK IN THE WOODS bridge                0
```

## step 6 

- [x] included in step6.md?

### Pivoting part 2 (re-reorganizing values in a dataset) 

Now that we have two datasets in the R environment, we can compare their structures with `dim()` (short for data `dim`ensions).


```r
# click to execute code
dim(BobRoss)
```

```
#> [1] 403  71
```

*This is telling us there are `403` rows and `71` columns in `BobRoss`...*


```r
# click to execute code
dim(BobRossLong)
```

```
#> [1] 27001     6
```

*...vs. `27001` rows and `6` columns in `BobRossLong`!*

As we can see, the `BobRossLong` has a ton more rows, but far fewer columns. The dimensions of the dataset have changed, but we've retained the information.

But what if we want to keep the dataset in it's original 'wide' format? The `tidyr::pivot_wider()` is the complement to `tidyr::pivot_longer()`, and it takes the following arguments: 

1. A data set (`BobRossLong`), 
2. Where the indexed names are stored (`names_from = object`),   
3. What variable holds the indexed values  (`values_from = present`)   


```r
# click to execute code
BobRossWide <- pivot_wider(data = BobRossLong, 
                      names_from = object, 
                      values_from = present)
head(BobRossWide)
```

```
#> # A tibble: 6 x 71
#>   episode season episode_num title apple_frame aurora_borealis  barn beach
#>   <chr>    <dbl>       <dbl> <chr>       <int>           <int> <int> <int>
#> 1 S01E01       1           1 A WA…           0               0     0     0
#> 2 S01E02       1           2 MT. …           0               0     0     0
#> 3 S01E03       1           3 EBON…           0               0     0     0
#> 4 S01E04       1           4 WINT…           0               0     0     0
#> 5 S01E05       1           5 QUIE…           0               0     0     0
#> 6 S01E06       1           6 WINT…           0               0     0     0
#> # … with 63 more variables: boat <int>, bridge <int>, building <int>,
#> #   bushes <int>, cabin <int>, cactus <int>, circle_frame <int>,
#> #   cirrus <int>, cliff <int>, clouds <int>, conifer <int>, cumulus <int>,
#> #   deciduous <int>, diane_andre <int>, dock <int>, double_oval_frame <int>,
#> #   farm <int>, fence <int>, fire <int>, florida_frame <int>, flowers <int>,
#> #   fog <int>, framed <int>, grass <int>, guest <int>,
#> #   half_circle_frame <int>, half_oval_frame <int>, hills <int>, lake <int>,
#> #   lakes <int>, lighthouse <int>, mill <int>, moon <int>, mountain <int>,
#> #   mountains <int>, night <int>, ocean <int>, oval_frame <int>,
#> #   palm_trees <int>, path <int>, person <int>, portrait <int>,
#> #   rectangle_3d_frame <int>, rectangular_frame <int>, river <int>,
#> #   rocks <int>, seashell_frame <int>, snow <int>, snowy_mountain <int>,
#> #   split_frame <int>, steve_ross <int>, structure <int>, sun <int>,
#> #   tomb_frame <int>, tree <int>, trees <int>, triple_frame <int>,
#> #   waterfall <int>, waves <int>, windmill <int>, window_frame <int>,
#> #   winter <int>, wood_framed <int>
```

Does the `BobRossWide` dataset have the same information as the original `BobRoss` dataset? We can check with `dplyr::setdiff()` which will test for differences in the two tibbles: 


```r
# click to copy code
dplyr::setdiff(x = BobRoss, y = BobRossWide)
```

```
#> # A tibble: 0 x 71
#> # … with 71 variables: episode <chr>, season <dbl>, episode_num <dbl>,
#> #   title <chr>, apple_frame <int>, aurora_borealis <int>, barn <int>,
#> #   beach <int>, boat <int>, bridge <int>, building <int>, bushes <int>,
#> #   cabin <int>, cactus <int>, circle_frame <int>, cirrus <int>, cliff <int>,
#> #   clouds <int>, conifer <int>, cumulus <int>, deciduous <int>,
#> #   diane_andre <int>, dock <int>, double_oval_frame <int>, farm <int>,
#> #   fence <int>, fire <int>, florida_frame <int>, flowers <int>, fog <int>,
#> #   framed <int>, grass <int>, guest <int>, half_circle_frame <int>,
#> #   half_oval_frame <int>, hills <int>, lake <int>, lakes <int>,
#> #   lighthouse <int>, mill <int>, moon <int>, mountain <int>,
#> #   mountains <int>, night <int>, ocean <int>, oval_frame <int>,
#> #   palm_trees <int>, path <int>, person <int>, portrait <int>,
#> #   rectangle_3d_frame <int>, rectangular_frame <int>, river <int>,
#> #   rocks <int>, seashell_frame <int>, snow <int>, snowy_mountain <int>,
#> #   split_frame <int>, steve_ross <int>, structure <int>, sun <int>,
#> #   tomb_frame <int>, tree <int>, trees <int>, triple_frame <int>,
#> #   waterfall <int>, waves <int>, windmill <int>, window_frame <int>,
#> #   winter <int>, wood_framed <int>
```

Notice this returned an empty tibble? That means `BobRoss` and `BobRossWide` are identical (i.e. no set differences).

#### Long or wide?

We've just shown two formats with the same information in them. You might be wondering which is better, and the answer is *it depends.* R prefers datasets formatted as long, but there are other reasons you might want to store (or collect) data in the wide format.  

Fortunately, now you don't have to choose because you can easily change whatever arrangement the data are in!

## step 7  

- [x] included in step7.md?

### Splitting columns into new columns

Sometimes data are not as granular as we would like them to be, so we need to break up bits of information into individual columns.

For example, the `episode` column contains information on the season and number from `season` and `episode_num`. But what if these two columns were missing? We could recreate them using `tidyr::separate()`.

#### Separating columns

We will load an alternative version of `BobRossLong` into the R environment for this step.

Please click on the *Run command* icon below to load `BobRossStep7` into R.


```r
# click to execute code
BobRossStep7 <- readr::read_csv(file = "https://bit.ly/bob-ross-step7")
glimpse(BobRossStep7)
```

```
#> Rows: 27,001
#> Columns: 4
#> $ episode_info <chr> "S01, E01", "S01, E01", "S01, E01", "S01, E01", "S01, …
#> $ title        <chr> "A WALK IN THE WOODS", "A WALK IN THE WOODS", "A WALK …
#> $ object       <chr> "apple_frame", "aurora_borealis", "barn", "beach", "bo…
#> $ present      <dbl> 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, …
```

As we can see, `BobRossStep7` has an `episode_info` variable with both `season` and `episode` information separated by a comma and space (`"S01, E01"` and `"S01, E01",`, etc.).

We want to use `tidyr::separate()` to split the `episode_info` column into `season` and `episode` using the following arguments.

1. `data` = the name of the dataset (`BobRossStep7`)  
2. `col` = the name of the column to separate (`episode_info`),  
3. `into` = the new columns for the separated information (combine these with `c("season", "episode")`)

Copy the code below and replace `c("______", "_______")` with the two new column names before pasting it back into the Terminal and running it.


```r
# click to copy code
separate(data = BobRossStep7, col = episode_info, into = c("______", "_______"))
```

If you've completed this step correctly, you should see the following dataset:


```r
# A tibble: 27,001 x 5
   season episode title               object          present
   <chr>  <chr>   <chr>               <chr>             <dbl>
 1 S01    E01     A WALK IN THE WOODS apple_frame           0
 2 S01    E01     A WALK IN THE WOODS aurora_borealis       0
 3 S01    E01     A WALK IN THE WOODS barn                  0
 4 S01    E01     A WALK IN THE WOODS beach                 0
 5 S01    E01     A WALK IN THE WOODS boat                  0
 6 S01    E01     A WALK IN THE WOODS bridge                0
 7 S01    E01     A WALK IN THE WOODS building              0
 8 S01    E01     A WALK IN THE WOODS bushes                1
 9 S01    E01     A WALK IN THE WOODS cabin                 0
10 S01    E01     A WALK IN THE WOODS cactus                0
# … with 26,991 more rows
```

As we can see, `season` and `episode` contain the same information as the previous `episode_info` column.

## step 8 

- [x] included in step8.md?

### Combining two columns 

Just like with the two `pivot_` functions, there is an opposite version of `tidyr::separate()` called `tidyr::unite()`. The `unite()` function takes multiple columns and sticks them together into a single new column. 

##### *First, a little house cleaning...*

We've accumulated quite a few datasets in our R environment, which can make things seem cluttered. You can check the objects in R using `ls()`. 


```r
# click to execute code
ls()
```

```
#>  [1] "BobRoss"          "BobRossDataFrame" "BobRossLong"      "BobRossStep7"    
#>  [5] "BobRossTibble"    "BobRossWide"      "bushes"           "clouds"          
#>  [9] "SmallBobRoss"     "title"
```

Yikes--so many Bob Ross's! We will remove the `SmallBobRoss`, `BobRoss` and `BobRossStep7` datasets using `rm()`.


```r
# click to execute code
rm(SmallBobRoss, BobRoss, BobRossStep7)
```

Now check again with `ls()` just to make sure (you can remove any additional datasets with `rm()`).

##### *...back to `unite()`*

We'll load another alternative version of `BobRossLong` into R and view it with `head()` 


```r
# click to execute code
BobRossStep8 <- readr::read_csv(file = "https://bit.ly/bob-ross-step8")
head(BobRossStep8)
```

```
#> # A tibble: 6 x 5
#>   season_text episode_text title               object          present
#>   <chr>       <chr>        <chr>               <chr>             <dbl>
#> 1 S01         01           A WALK IN THE WOODS apple_frame           0
#> 2 S01         01           A WALK IN THE WOODS aurora_borealis       0
#> 3 S01         01           A WALK IN THE WOODS barn                  0
#> 4 S01         01           A WALK IN THE WOODS beach                 0
#> 5 S01         01           A WALK IN THE WOODS boat                  0
#> 6 S01         01           A WALK IN THE WOODS bridge                0
```

Now use `tidyr::unite()` with the following arguments:

1. `data` = `BobRossStep8`

2. the columns we want to unite (`season_text` and `episode_text`) 

3. the new column name (`col = episode_new`) 

4. And `sep =`, a regular expression pattern to place between the two columns we're uniting (in this case, it's `E`). 

Replace `col = '___________'` below with the new united column name before entering and running it in the Terminal.


```r
# click to copy code
unite(data = BobRossStep8, season_text, episode_text, col = '___________', sep = "E")
```

If you've filled in the function correctly, you should see the following data set:


```r
# A tibble: 27,001 x 4
   episode_new title               object          present
   <chr>       <chr>               <chr>             <dbl>
 1 S01E01      A WALK IN THE WOODS apple_frame           0
 2 S01E01      A WALK IN THE WOODS aurora_borealis       0
 3 S01E01      A WALK IN THE WOODS barn                  0
 4 S01E01      A WALK IN THE WOODS beach                 0
 5 S01E01      A WALK IN THE WOODS boat                  0
 6 S01E01      A WALK IN THE WOODS bridge                0
 7 S01E01      A WALK IN THE WOODS building              0
 8 S01E01      A WALK IN THE WOODS bushes                1
 9 S01E01      A WALK IN THE WOODS cabin                 0
10 S01E01      A WALK IN THE WOODS cactus                0
# … with 26,991 more rows
```

As we can see, `unite()` placed the `E` between `season_text` and `episode_text`. 

Now we should feel more comfortable answering the last two questions related to this level of data wrangling:

3. Does each measurement have a column (or variable)? *Yes, and if not I can pivot the data into another arrangement* 

4. Are these variables each measuring exactly one thing? *Yes, and if not I can separate/unite columns to capture that one thing* 


## step 9 

- [x] included in step9.md?

### Data wrangling: level two

We said we like to think of the first level of data wrangling as changes to the data structure itself (what the dimensions, columns, and rows should be). The second level of data wrangling refers to *creating or calculating new variables based on existing columns and values*. 

You might be wondering how these two are different, and the primary difference is that all the changes we made used only the position or location of the data. For example, consider the data arrangement below:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-data-wrangle-viz-show/master/figs/03-original-data.png)

This data has three months spread across columns and a `category` variable that serves as an index for the values. If we put these data in the long format, it will look like the image below:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-data-wrangle-viz-show/master/figs/04-pivot-longer.png)

The `tidyr::pivot_longer()` changes the position of the indices and values, but doesn't calculate or create any new information. We can just as quickly move the data back into its original arrangement (see below).

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-data-wrangle-viz-show/master/figs/05-pivot-wider.png)

`unite` and `separate()` also change the position and contents of the information, but they do not calculate or create new values. 

#### The `dplyr` package

The primary package for data manipulation at the second level is `dplyr`, and we will explore its functions in the next three steps. 

#### Creating new variables

How `dplyr::mutate()` works:


```r
dplyr::mutate(.data = DataFrame,
              # changed variable
              `new variable name` =
                  # function used to change variable
                   some_function(
                      # current variable name
                      `old variable name`))
```

As you can see from the code and comments above, first, we enter the data set (`DataFrame`).  Next, we introduce a name for the new variable we want to create (`new variable name`), the equals sign `=`, then the function we want to apply `some_function()` and the original variable we want to apply it to `old variable name`.

Let's import a new version of `BobRoss` for this step. 


```r
BobRossStep9 <- readr::read_csv(file = "https://bit.ly/bob-ross-step9")
```

#### Changing variable formats

We're going to use the `dplyr::mutate()` function to change the format of a character variable (`<chr>`) to numeric (`<dbl>`). So if we run the code below, it should create `episode_num`, which is a numerical version `episode_txt` (converting `<chr>` to `<dbl>` to numeric).


```r
# click to execute code
dplyr::mutate(.data = BobRossStep9, episode_num = as.numeric(episode_txt))
```

```
#> # A tibble: 27,001 x 6
#>    episode_txt season_txt title              object        present episode_num
#>    <chr>       <chr>      <chr>              <chr>           <dbl>       <dbl>
#>  1 01          01         A WALK IN THE WOO… apple_frame         0           1
#>  2 01          01         A WALK IN THE WOO… aurora_borea…       0           1
#>  3 01          01         A WALK IN THE WOO… barn                0           1
#>  4 01          01         A WALK IN THE WOO… beach               0           1
#>  5 01          01         A WALK IN THE WOO… boat                0           1
#>  6 01          01         A WALK IN THE WOO… bridge              0           1
#>  7 01          01         A WALK IN THE WOO… building            0           1
#>  8 01          01         A WALK IN THE WOO… bushes              1           1
#>  9 01          01         A WALK IN THE WOO… cabin               0           1
#> 10 01          01         A WALK IN THE WOO… cactus              0           1
#> # … with 26,991 more rows
```

We can see this creates a new variable, but we still have `episode_txt`. Next, we'll convert the `title` to title case using the `stringr` package (also from the `tidyverse`), and we'll overwrite the existing variable by naming the new variable `title` as well. 


```r
dplyr::mutate(.data = BobRossStep9, 
              # first new variable 
              episode_num = base::as.numeric(episode_txt),
              # second new variable 
              title = stringr::str_to_title(title))
```

```
#> # A tibble: 27,001 x 6
#>    episode_txt season_txt title              object        present episode_num
#>    <chr>       <chr>      <chr>              <chr>           <dbl>       <dbl>
#>  1 01          01         A Walk In The Woo… apple_frame         0           1
#>  2 01          01         A Walk In The Woo… aurora_borea…       0           1
#>  3 01          01         A Walk In The Woo… barn                0           1
#>  4 01          01         A Walk In The Woo… beach               0           1
#>  5 01          01         A Walk In The Woo… boat                0           1
#>  6 01          01         A Walk In The Woo… bridge              0           1
#>  7 01          01         A Walk In The Woo… building            0           1
#>  8 01          01         A Walk In The Woo… bushes              1           1
#>  9 01          01         A Walk In The Woo… cabin               0           1
#> 10 01          01         A Walk In The Woo… cactus              0           1
#> # … with 26,991 more rows
```

The great thing about `dplyr::mutate()` and other `tidyverse` functions is that we can view our work before assigning anything to a dataset. **It's always a good idea to check your data wrangling before assigning it back to the data frame.** 

We will make one final change to the `object` variable by removing the underscores between the objects with `stringr::str_replace_all()`. 


```r
dplyr::mutate(.data = BobRossStep9, 
              # first new variable 
              episode_num = base::as.numeric(episode_txt),
              # second variable change
              title = stringr::str_to_title(title),
              # third variable change
              object = stringr::str_replace_all(string = object, 
                                       pattern = "_", 
                                       replacement = " "))
```

```
#> # A tibble: 27,001 x 6
#>    episode_txt season_txt title              object        present episode_num
#>    <chr>       <chr>      <chr>              <chr>           <dbl>       <dbl>
#>  1 01          01         A Walk In The Woo… apple frame         0           1
#>  2 01          01         A Walk In The Woo… aurora borea…       0           1
#>  3 01          01         A Walk In The Woo… barn                0           1
#>  4 01          01         A Walk In The Woo… beach               0           1
#>  5 01          01         A Walk In The Woo… boat                0           1
#>  6 01          01         A Walk In The Woo… bridge              0           1
#>  7 01          01         A Walk In The Woo… building            0           1
#>  8 01          01         A Walk In The Woo… bushes              1           1
#>  9 01          01         A Walk In The Woo… cabin               0           1
#> 10 01          01         A Walk In The Woo… cactus              0           1
#> # … with 26,991 more rows
```

Now that we can see the variables are formatted how we want, we can assign the changes to the `BobRossStep9` object. 


```r
BobRossStep9 <- dplyr::mutate(.data = BobRossStep9, 
              # first new variable 
              episode_num = base::as.numeric(episode_txt),
              # second variable change
              title = stringr::str_to_title(title),
              # third variable change
              object = stringr::str_replace_all(string = object, 
                                       pattern = "_", 
                                       replacement = " "))
head(BobRossStep9)
```

```
#> # A tibble: 6 x 6
#>   episode_txt season_txt title              object         present episode_num
#>   <chr>       <chr>      <chr>              <chr>            <dbl>       <dbl>
#> 1 01          01         A Walk In The Woo… apple frame          0           1
#> 2 01          01         A Walk In The Woo… aurora boreal…       0           1
#> 3 01          01         A Walk In The Woo… barn                 0           1
#> 4 01          01         A Walk In The Woo… beach                0           1
#> 5 01          01         A Walk In The Woo… boat                 0           1
#> 6 01          01         A Walk In The Woo… bridge               0           1
```

Read more about [`stringr` package](https://stringr.tidyverse.org/).






## step 10   

- [x] included in step10.md?  

### Create new variables based on a condition

Many times we'll want to create a new variable based on the values in another variable. For example, assume we want to identify only those objects that are in season 1. We can do this by creating a new variable called `season01`, and assigning the value of `TRUE` to all the objects that occurred in season 1, and `FALSE` to every other object.

Let's import a dataset for this step.


```r
BobRossStep10 <- readr::read_csv(file = "https://bit.ly/bob-ross-step10")
head(BobRossStep10)
```

```
#> # A tibble: 6 x 5
#>   episode season title               object          present
#>   <chr>    <dbl> <chr>               <chr>             <dbl>
#> 1 S01E01       1 A WALK IN THE WOODS apple_frame           0
#> 2 S01E01       1 A WALK IN THE WOODS aurora_borealis       0
#> 3 S01E01       1 A WALK IN THE WOODS barn                  0
#> 4 S01E01       1 A WALK IN THE WOODS beach                 0
#> 5 S01E01       1 A WALK IN THE WOODS boat                  0
#> 6 S01E01       1 A WALK IN THE WOODS bridge                0
```

Create `season01` by filling in the the appropriate value for `season` in `condition = ______ == _`, and the two logical values for `true` and `false`. 


```r
# click to copy code
mutate(.data = BobRossStep10, season01 = if_else(condition = ______ == _, 
                                                 true = ____, false = _____))
```

We notice this creates a `<lgl>` variable, which can only have one of two values (`TRUE` and `FALSE`). Logical is excellent for binary variables because you can still perform mathematical operations on them.


*Logical vectors are coerced to integer vectors in contexts where a numerical value is required, with `TRUE` mapped to `1`, `FALSE` to `0`*

#### Counting to check our work

Assuming we know how many episodes are season 1, we can check the new variable using `dplyr::count()`.


```r
# click to execute code
BobRossStep10 <- dplyr::mutate(.data = BobRossStep10,
                            season01 = if_else(condition = season == 1,
                                               true = TRUE,
                                               false = FALSE))
# count the new values
dplyr::count(BobRossStep10, season01)
```

```
#> # A tibble: 2 x 2
#>   season01     n
#>   <lgl>    <int>
#> 1 FALSE    26130
#> 2 TRUE       871
```

`count` returns a tibble with a sum of each value in `season01`.

We can also use `if_else` in combination with [`stringr::str_detect()`](https://stringr.tidyverse.org/reference/str_detect.html) to find all `E01` instances in `episode`. The `str_detect()` is incredibly handy for finding patterns in text data because it returns a logical (`TRUE` or `FALSE`).


```r
# click to execute code
BobRossStep10 <- dplyr::mutate(.data = BobRossStep10,
                   episode01 = if_else(condition = str_detect(
                                                    string = episode,
                                                     pattern = "E01"),
                                                        true = TRUE,
                                                        false = FALSE))
# count the new values
dplyr::count(BobRossStep10, episode01)
```

```
#> # A tibble: 2 x 2
#>   episode01     n
#>   <lgl>     <int>
#> 1 FALSE     24924
#> 2 TRUE       2077
```

We can see the total number of first episodes. Again, this assumes we know the total number of first episodes and that they are all coded correctly.

## step 11  

- [x] included in step11.md?  

### Creating new variables based on multiple conditions

The `dplyr::if_else()` function works well with `dplyr::mutate()` for creating new variables based on a single condition, but sometimes we want to create new variables based on the values in more than one column (i.e., multiple conditions).

In this case, we can combine `dplyr::mutate()` with `dplyr::case_when()` to create new variables based on multiple conditions. These functions work together with the following arguments.

#### Using `dplyr::case_when()` with `dplyr::mutate()`


```r
# first we assign a new variable name
dplyr::mutate(.data = DataSet,
                `new variable name`,
           case_when(
             # then we enter our conditions (condition 1)
             left hand side condition 1 ~ right hand side result 1,
             # condition 2
             left hand side condition 2 ~ right hand side result 2))
```

We can learn more about how `dplyr::case_when` works by accessing the R help files (`?dplyr::case_when`).

> *The left-hand side determines which values match this case. The right-hand side provides the replacement value. The left-hand side must evaluate to a logical vector. The right-hand side does not need to be logical, but all right-hand sides must evaluate to the same type of vector.*

#### Creating categorical variables

We will load a small example of `BobRoss` to experiment with [`dplyr::case_when()`](https://dplyr.tidyverse.org/reference/case_when.html). This dataset only has the first three episodes of season 1.


```r
BobRossStep11 <- readr::read_csv(file = "https://bit.ly/bob-ross-step11")
head(BobRossStep11)
```

```
#> # A tibble: 6 x 6
#>   episode season episode_num title               object    present
#>   <chr>    <dbl>       <dbl> <chr>               <chr>       <dbl>
#> 1 S01E01       1           1 A Walk In The Woods bushes          1
#> 2 S01E01       1           1 A Walk In The Woods deciduous       1
#> 3 S01E01       1           1 A Walk In The Woods grass           1
#> 4 S01E01       1           1 A Walk In The Woods river           1
#> 5 S01E01       1           1 A Walk In The Woods tree            1
#> 6 S01E01       1           1 A Walk In The Woods trees           1
```

We can see this is a reduced dataset from `BobRoss`. We will use `dplyr::case_when()` to create a `object_category` variable based on what `object`s were in a particular episode's painting.

We'll be using `stringr::str_detect()` again to find all the paintings of `mountains`, `trees`, and `bushes`, but we've dropped the names of arguments, so it's easier to read.


```r
dplyr::mutate(.data = BobRossStep11,
          object_category = case_when(
              season == 1 & str_detect(object, "mountain") ~ "mountains",
              season == 1 & str_detect(object, "deciduous") ~ "trees",
              season == 1 & str_detect(object, "tree") ~ "trees",
              season == 1 & str_detect(object, "conifer") ~ "trees",
              season == 1 & str_detect(object, "bush") ~ "bushes"))
```

```
#> # A tibble: 25 x 7
#>    episode season episode_num title           object   present object_category
#>    <chr>    <dbl>       <dbl> <chr>           <chr>      <dbl> <chr>          
#>  1 S01E01       1           1 A Walk In The … bushes         1 bushes         
#>  2 S01E01       1           1 A Walk In The … deciduo…       1 trees          
#>  3 S01E01       1           1 A Walk In The … grass          1 <NA>           
#>  4 S01E01       1           1 A Walk In The … river          1 <NA>           
#>  5 S01E01       1           1 A Walk In The … tree           1 trees          
#>  6 S01E01       1           1 A Walk In The … trees          1 trees          
#>  7 S01E02       1           2 Mt. Mckinley    cabin          1 <NA>           
#>  8 S01E02       1           2 Mt. Mckinley    clouds         1 <NA>           
#>  9 S01E02       1           2 Mt. Mckinley    conifer        1 trees          
#> 10 S01E02       1           2 Mt. Mckinley    mountain       1 mountains      
#> # … with 15 more rows
```

The great thing about `case_when()` is that we can keep adding more conditions. For example, we can add `water` and `buildings` to the same `object_category` variable.


```r
dplyr::mutate(.data = BobRossStep11,
          object_category = case_when(
              season == 1 & str_detect(object, "mountain") ~ "mountains",
              season == 1 & str_detect(object, "deciduous") ~ "trees",
              season == 1 & str_detect(object, "tree") ~ "trees",
              season == 1 & str_detect(object, "conifer") ~ "trees",
              season == 1 & str_detect(object, "bush") ~ "bushes",
              season == 1 & str_detect(object, "river") ~ "water",
              season == 1 & str_detect(object, "barn") ~ "buildings",
              season == 1 & str_detect(object, "cabin") ~ "buildings"))
```

```
#> # A tibble: 25 x 7
#>    episode season episode_num title           object   present object_category
#>    <chr>    <dbl>       <dbl> <chr>           <chr>      <dbl> <chr>          
#>  1 S01E01       1           1 A Walk In The … bushes         1 bushes         
#>  2 S01E01       1           1 A Walk In The … deciduo…       1 trees          
#>  3 S01E01       1           1 A Walk In The … grass          1 <NA>           
#>  4 S01E01       1           1 A Walk In The … river          1 water          
#>  5 S01E01       1           1 A Walk In The … tree           1 trees          
#>  6 S01E01       1           1 A Walk In The … trees          1 trees          
#>  7 S01E02       1           2 Mt. Mckinley    cabin          1 buildings      
#>  8 S01E02       1           2 Mt. Mckinley    clouds         1 <NA>           
#>  9 S01E02       1           2 Mt. Mckinley    conifer        1 trees          
#> 10 S01E02       1           2 Mt. Mckinley    mountain       1 mountains      
#> # … with 15 more rows
```

We can also include a 'catch-all' with a logical `TRUE` condition.


```r
BobRossStep11 <- dplyr::mutate(.data = BobRossStep11,
          object_category = case_when(
              season == 1 & str_detect(object, "mountain") ~ "mountains",
              season == 1 & str_detect(object, "deciduous") ~ "trees",
              season == 1 & str_detect(object, "tree") ~ "trees",
              season == 1 & str_detect(object, "conifer") ~ "trees",
              season == 1 & str_detect(object, "bush") ~ "bushes",
              season == 1 & str_detect(object, "river") ~ "water",
              season == 1 & str_detect(object, "barn") ~ "buildings",
              season == 1 & str_detect(object, "cabin") ~ "buildings",
              TRUE ~ "other"))
head(BobRossStep11)
```

```
#> # A tibble: 6 x 7
#>   episode season episode_num title            object   present object_category
#>   <chr>    <dbl>       <dbl> <chr>            <chr>      <dbl> <chr>          
#> 1 S01E01       1           1 A Walk In The W… bushes         1 bushes         
#> 2 S01E01       1           1 A Walk In The W… deciduo…       1 trees          
#> 3 S01E01       1           1 A Walk In The W… grass          1 other          
#> 4 S01E01       1           1 A Walk In The W… river          1 water          
#> 5 S01E01       1           1 A Walk In The W… tree           1 trees          
#> 6 S01E01       1           1 A Walk In The W… trees          1 trees
```


## step 12   

- [x] included in step12.md?  

### Combine `case_when` and `pivot`

After creating new variables, it's always a good idea to check your work. Now that we have some tools for creating new variables, we can use the `tidyr::pivot_` functions to check and make sure all the rows were assigned correctly.

#### Small Bob Ross

We'll import a small version of the `bob_ross` dataset to demonstrate how we can combine both levels of data wrangling to create new variables and check our work.


```r
BobRossStep12 <- readr::read_csv(file = "https://bit.ly/bob-ross-step12")
head(BobRossStep12)
```

```
#> # A tibble: 2 x 12
#>   episode season episode_num title cabin circle_frame clouds cumulus deciduous
#>   <chr>    <dbl>       <dbl> <chr> <dbl>        <dbl>  <dbl>   <dbl>     <dbl>
#> 1 S04E04       4           4 WINT…     1            1      1       1         1
#> 2 S04E05       4           5 EVEN…    NA           NA      1       1        NA
#> # … with 3 more variables: framed <dbl>, tree <dbl>, trees <dbl>
```

#### View the data

Use `utils::head()`, `dplyr::glimpse()`, or `utils::str()` to view the contents of `BobRossStep12`.

#### Create long (tidy) dataset

First create a long version of `BobRossStep12` using `tidyr::pivot_longer()`. We've provided some code to get you started,

+ the `cols` argument should be `-c(episode, season, episode_num, title)` (this means negate these four columns)  

+ assign `names_to` to `"object"` and `values_to` to `"present"`).

+ when you're confident you have it correct, assign these changes to `BobRossStep12`.


```r
BobRossStep12 <- tidyr::pivot_longer(data = BobRossStep12, 
                                     cols = -c(episode, season, episode_num, title), 
                                     names_to = "_______",  
                                     values_to = "________")
```




Now that we have a long dataset, we can create a new variable (`painting_cats`) for the following categories.

+ Label any mention of cabin as `Cabins` (*there should only be one*)

+ Capture all framed paintings under the label `Frames` (*a single pattern of `frame` should do the trick*)

+ Create a category for all the `Trees` (*there are different types of trees here, so we can combine multiple arguments by placing a pipe (|) between them*)

+ Label all the clouds as `Clouds` (*same as above, but with different types of clouds*)

+ All other missing values should be labeled `NA` with `NA_character_` (*here we will use `TRUE` as the condition, and the `NA` type as a result *)


```r
dplyr::mutate(.data = BobRossStep12,
        painting_cats = case_when(
            present == 1 & str_detect(object, "______") ~ "Cabins",
            present == 1 & str_detect(object, "______") ~ "Frames",
            present == 1 & str_detect(object, "____|_________") ~ "Trees",
            present == 1 & str_detect(object, "_____|_______") ~ "Clouds",
            TRUE ~ __________))
```

**Did you get it?**

You can run the code below to check


```r
BobRossStep12 <- dplyr::mutate(.data = BobRossStep12,
              painting_cats = case_when(
              present == 1 & str_detect(object, "cabin") ~ "Cabins",
              present == 1 & str_detect(object, "frame") ~ "Frames",
              present == 1 & str_detect(object, "tree|deciduous") ~ "Trees",
              present == 1 & str_detect(object, "cloud|cumulus") ~ "Clouds",
              TRUE ~ NA_character_))
BobRossStep12
```

```
#> # A tibble: 16 x 7
#>    episode season episode_num title           object     present painting_cats
#>    <chr>    <dbl>       <dbl> <chr>           <chr>        <dbl> <chr>        
#>  1 S04E04       4           4 WINTER SAWSCAPE cabin            1 Cabins       
#>  2 S04E04       4           4 WINTER SAWSCAPE circle_fr…       1 Frames       
#>  3 S04E04       4           4 WINTER SAWSCAPE clouds           1 Clouds       
#>  4 S04E04       4           4 WINTER SAWSCAPE cumulus          1 Clouds       
#>  5 S04E04       4           4 WINTER SAWSCAPE deciduous        1 Trees        
#>  6 S04E04       4           4 WINTER SAWSCAPE framed           1 Frames       
#>  7 S04E04       4           4 WINTER SAWSCAPE tree             1 Trees        
#>  8 S04E04       4           4 WINTER SAWSCAPE trees            1 Trees        
#>  9 S04E05       4           5 EVENING SEASCA… cabin           NA <NA>         
#> 10 S04E05       4           5 EVENING SEASCA… circle_fr…      NA <NA>         
#> # … with 6 more rows
```


Now we want to check our work by creating a cross-tabulation between `object` and `painting_cats`. We can do this with `dplyr::count()`, which tallies up all the values in a column. Copy the code below to see the new values in `painting_cats`.


```r
# the n column is the tally of the values
dplyr::count(BobRossStep12, painting_cats)
```

```
#> # A tibble: 5 x 2
#>   painting_cats     n
#>   <chr>         <int>
#> 1 Cabins            1
#> 2 Clouds            4
#> 3 Frames            2
#> 4 Trees             5
#> 5 <NA>              4
```

If we want to count two variables, we simply separate them with a comma (see below).


```r
# the n is the tally, but for both variables
dplyr::count(BobRossStep12, object, painting_cats)
```

```
#> # A tibble: 12 x 3
#>    object       painting_cats     n
#>    <chr>        <chr>         <int>
#>  1 cabin        Cabins            1
#>  2 cabin        <NA>              1
#>  3 circle_frame Frames            1
#>  4 circle_frame <NA>              1
#>  5 clouds       Clouds            2
#>  6 cumulus      Clouds            2
#>  7 deciduous    Trees             1
#>  8 deciduous    <NA>              1
#>  9 framed       Frames            1
#> 10 framed       <NA>              1
#> # … with 2 more rows
```

As you can see, this is returning a `tibble`. We know how to reshape `tibbles` with the `pivot_` functions now, so let's restructure the output to view the values of `painting_cats` across columns.


```r
# create counts dataset of object and painting_cats
BobRossCounts <- dplyr::count(BobRossStep12, painting_cats, ______)
```

Assign the names from our new `painting_cats` variable and values from `n`


```r
# reshape this to wide and use n as the values
pivot_wider(data = BobRossCounts, names_from = painting_cats, values_from = _)
```

## finish.md    

- [x] included in finish.md?  

### Thank you for completing this scenario!

We've gone over how to:

1. Load packages and data into R (`utils::install.packages()`, `base::library()`, `tibble::tribble()`, and `readr::read_csv()`).

2. how to use R to format and shape (or *reformat* and *reshape*) your data (`tidyr::pivot_longer()`, `tidyr::pivot_wider()`, `tidyr::separate()`, and `tidyr::unite()`).

3. how to create new variables based on existing columns `dplyr::mutate()` and `dplyr::if_else()`

4. how to create new variables based on multiple conditions (i.e. `dplyr::mutate()` and `dplyr::case_when()`)

5. how to check your work with counting and pivoting (`dplyr::count()` and `tidyr::pivot_wider()`)

#### Learn more 

Feel free to check out more courses from [Katacoda](https://www.katacoda.com/) and [`tidyverse packages`](https://www.tidyverse.org/).
















***


## Appendix 1: Katacoda scenario tutorials

The tutorial for building the scenario is [here](https://katacoda.com/scenario-examples/scenarios/create-scenario-101).

I took notes on this tutorial and made them available in [this Google document](https://docs.google.com/document/d/e/2PACX-1vSf2w2onhH5t3IhuD4sYLoWqn46BLKMYFR7q3BHO8QTaRkVgXfhKvnl8T9uHrjmbVpTZVKCWrfxEl0R/pub).

## Appendix 2: Katacoda guidelines

There are multiple guidelines and resources for writing scenarios. O'Reilly has provided an *Authoring Guide* and *Formatting and Design Guide*.

The link for these files can be found here:

-   [Katacoda Scenario Formatting and Design Guide for Authors](https://docs.google.com/document/d/1l4lofG5kAu8JFzumZPCsJJE2muCYe6rHSHCQsMlijd8/edit)

-   [Katacoda Scenario Authoring Guide](https://docs.google.com/document/d/14rudtruZQhRxvD3zcR3g75j5nuOgKGz4CYk8hdhaV-w/edit)

## Appendix 3: Scenario Checklist

**Scenario Readiness Checklist:**

When you think your scenario is ready for publication, we recommend you run through the checklist below to ensure it is ready to go. [Reminder: We discuss these best practices in the Katacoda Formatting and Design Guide for Authors]:

Does the scenario start consistently and in a timely manner? More than 5 minutes to start would be cause to reconsider your build decisions.

- [x] Are your intro and final pages present and are their respective goals and lessons learned in agreement?

- [x] Have you tested your scenario lately?

- [x] Do you agree with the leveling (beginner, intermediate, advanced) you indicated when you started the build?

- [x] Was learning time you entered correct, or should it be adjusted?

- [x] Are your versions of tools and other dependencies up to date?

- [x] Have you tried every instruction?

- [x] Have you written each step in the most concise manner possible?

- [x] Have you run your text through a spelling/grammar checker?

- [x] Are your credits to others given present and correct?

- [x] Are your images legal and with credits?

- [x] Are your hyperlinks all working?

- [x] Do the goals and lessons learned items match the steps in the scenario?
