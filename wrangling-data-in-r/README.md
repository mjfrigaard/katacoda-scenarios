Format and shape your data in R with the tidyverse
================

  - [Variable types](#variable-types)
  - [step1](#step1)
  - [step2](#step2)
  - [step3](#step3)
  - [step4](#step4)
  - [step5](#step5)
  - [finish](#finish)
  - [Appendix 1: Katacoda scenario
    tutorials](#appendix-1-katacoda-scenario-tutorials)
  - [Appendix 2: Katacoda guidelines](#appendix-2-katacoda-guidelines)
  - [Appendix 3: Scenario Checklist](#appendix-3-scenario-checklist)
  - [Scenario contents](#scenario-contents)

This is the `README.md` file for the Katacoda scenario titled, “*Format
and shape your data in R with the tidyverse*”

-----

This scenario will introduce how to use R to change columns from one
type (or class) to another. In the wild, we rarely collect data in a
format that they can be immediately analyzed or visualized in, so data
wrangling is a common task.

## Variable types

Recall that variables can be characters (or strings), logicals (or
boolean), and numbers (integer and double). In this first exercise,
we’ll be converting variables from one form to another using
[`dplyr`](https://dplyr.tidyverse.org/), a package from the
[`tidyverse`](https://www.tidyverse.org/).

To learn more about variable types, check out the transformation chapter
in [R for Data Science](https://r4ds.had.co.nz/transform.html).

## step1

> The `step1` file starts the scenario off an intro to R packages (the
> `library()` function), and how to create a data set in R to play with.
> This is important because having an ability to create data in R allows
> us to create a [minimal reproducible
> example](https://stackoverflow.com/help/minimal-reproducible-example),
> which gives us access to [The R questions on
> StackOverflow.](https://stackoverflow.com/questions/tagged/r).

> The markdown for the `step1.md` file is below.

```` markdown
Launch the R REPL with `R`{{execute}}

Install and load the `tidyverse` package.

```
# packages
install.packages(c("tidyverse", "babynames"))
library(tidyverse)
```{{execute}}

When using a function from a package, the syntax is `package::function()`. We will use the `tibble` package to create the `BpData` dataset with the code below.

To view the contents of `BpData`, you simply enter the name into the console and a preview of the data will print to the Terminal.

```
# create BpData data
BpData <- tibble::tribble(
    # variable names ---------------------------------------------------------
         ~name,         ~dob, ~weight_kilos, ~height_meters, ~bp_dia, ~bp_sys,
    # data  ------------------------------------------------------------------
        "john", "1985-10-13",          100L,            '2.1',     80L,    130L,
       "peter", "1979-08-04",           82L,            '1.9',     65L,    126L,
       "steve", "1981-04-23",           95L,            '1.7',     70L,    119L,
       "sally", "1983-03-28",           72L,            '1.5',     75L,    129L,
        "beth", "1986-06-07",           76L,            '1.6',     78L,    126L,
        "kate", "1982-08-19",           69L,            '1.5',     74L,    121L)
# print data
BpData
```{{execute}}
````

## step2

```` 

```
# load data
EconDataWide <- ggplot2::economics
EconDataWide %>% glimpse(78)

# change structure
tidyr::pivot_longer()
```
````

## step3

    ```
    
    ```

## step4

## step5

## finish

-----

## Appendix 1: Katacoda scenario tutorials

The tutorial for building the scenario is
[here](https://katacoda.com/scenario-examples/scenarios/create-scenario-101).

I took notes on this tutorial and made them available in [this Google
document](https://docs.google.com/document/d/e/2PACX-1vSf2w2onhH5t3IhuD4sYLoWqn46BLKMYFR7q3BHO8QTaRkVgXfhKvnl8T9uHrjmbVpTZVKCWrfxEl0R/pub).

## Appendix 2: Katacoda guidelines

There are multiple guidelines and resources for writing scenarios.
O’Reilly has provided an *Authoring Guide* and *Formatting and Design
Guide*.

The link for these files can be found here:

  - [Katacoda Scenario Formatting and Design Guide for
    Authors](https://docs.google.com/document/d/1l4lofG5kAu8JFzumZPCsJJE2muCYe6rHSHCQsMlijd8/edit)

  - [Katacoda Scenario Authoring
    Guide](https://docs.google.com/document/d/14rudtruZQhRxvD3zcR3g75j5nuOgKGz4CYk8hdhaV-w/edit)

## Appendix 3: Scenario Checklist

**Scenario Readiness Checklist:**

When you think your scenario is ready for publication, we recommend you
run through the checklist below to ensure it is ready to go. \[Reminder:
We discuss these best practices in the Katacoda Formatting and Design
Guide for Authors\]:

Does the scenario start consistently and in a timely manner? More than 5
minutes to start would be cause to reconsider your build decisions.

  - [ ] Are your intro and final pages present and are their respective
    goals and lessons learned in agreement?

  - [ ] Have you tested your scenario lately?

  - [ ] Do you agree with the leveling (beginner, intermediate,
    advanced) you indicated when you started the build?

  - [ ] Was learning time you entered correct, or should it be adjusted?

  - [ ] Are your versions of tools and other dependencies up to date?

  - [ ] Have you tried every instruction?

  - [ ] Have you written each step in the most concise manner possible?

  - [ ] Have you run your text through a spelling/grammar checker?

  - [ ] Are your credits to others given present and correct?

  - [ ] Are your images legal and with credits?

  - [ ] Are your hyperlinks all working?

  - [ ] Do the goals and lessons learned items match the steps in the
    scenario?

## Scenario contents

This scenario covers…
