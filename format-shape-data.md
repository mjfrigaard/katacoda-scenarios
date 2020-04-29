Format and shape your data in R with the tidyverse
================

  - [Access the scenario](#access-the-scenario)
      - [Setup](#setup)
      - [Markdown syntax (Katacoda)](#markdown-syntax-katacoda)
      - [Learner personas](#learner-personas)
  - [Intro](#intro)
  - [step 1 (install and load
    packages)](#step-1-install-and-load-packages)
  - [step 2 (tribble)](#step-2-tribble)
  - [step 3 (read\_csv)](#step-3-read_csv)
  - [step 4 (fivethirtyeight, glimpse)](#step-4-fivethirtyeight-glimpse)
  - [step 5 (pivot\_)](#step-5-pivot_)
  - [step6](#step6)
      - [Appendix 1: Katacoda scenario
        tutorials](#appendix-1-katacoda-scenario-tutorials)
      - [Appendix 2: Katacoda
        guidelines](#appendix-2-katacoda-guidelines)
      - [Appendix 3: Scenario Checklist](#appendix-3-scenario-checklist)
      - [Scenario contents](#scenario-contents)

# Access the scenario

You can run through this scenario on Katacoda
[here](https://www.katacoda.com/mjfrigaard).

## Setup

This scenario is built using the following commands in the Terminal pane
in RStudio.

``` bash
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

We can see all `steps`, the `intro`, and `finish` markdown files. There
is also an `index.json` file for managing all the steps in the Katacoda
environment.

## Markdown syntax (Katacoda)

Katacoda comes with it’s own flavor of Markdown, which you can learn
more about
[here.](https://katacoda.com/scenario-examples/scenarios/markdown-extensions).
The main thing to know is that there are `execute` and `copy`
extensions, which you can use in the markdown to indicate whether
Katacoda should copy or run the code inside the R REPL.

## Learner personas

The learner personas for this scenario are:

1.  Horatio is an executive at a tech company who wants to learn more
    about

2.  Judy is a product manager at a start-up…

3.  Andrew is a graduate student in college…

-----

# Intro

The introduction for this scenario is stored in the following file:

    #> format-shape-data
    #> └── intro.md

# step 1 (install and load packages)

The `step1` file starts the scenario off an intro to R packages (the
`base::library()` function). The markdown for the `step1.md` file is
below.

    #> format-shape-data
    #> └── step1.md

# step 2 (tribble)

    #> format-shape-data
    #> └── step2.md

This step loads the data into R (using the `tibble` package).

``` r
# datapasta::tribble_paste(fivethirtyeight::bob_ross %>%
#   dplyr::select(title, bushes, clouds) %>% 
#   utils::head(5))
```

``` r
SmallBobRoss  <- tibble::tribble(~title, ~bushes, ~clouds,
                  "A WALK IN THE WOODS",      1L,      0L,
                         "MT. MCKINLEY",      0L,      1L,
                         "EBONY SUNSET",      0L,      0L,
                          "WINTER MIST",      1L,      1L,
                         "QUIET STREAM",      0L,      0L)
```

# step 3 (read\_csv)

    #> format-shape-data
    #> └── step3.md

Step 3 shows us how to import data into the R environment.

``` r
# fs::dir_ls("data")
readr::write_csv(as.data.frame(SmallBobRoss), "data/SmallBobRoss.csv")
```

``` r
readr::read_csv(file = "https://bit.ly/small-bob-ross")
```

    #> # A tibble: 5 x 3
    #>   title               bushes clouds
    #>   <chr>                <dbl>  <dbl>
    #> 1 A WALK IN THE WOODS      1      0
    #> 2 MT. MCKINLEY             0      1
    #> 3 EBONY SUNSET             0      0
    #> 4 WINTER MIST              1      1
    #> 5 QUIET STREAM             0      0

# step 4 (fivethirtyeight, glimpse)

    #> format-shape-data
    #> └── step4.md

This step imports the full `bob_ross` dataset from the `fivethirtyeight`
package. We load the data into R using `fivethirtyeight::bob_ross`.

``` r
BobRoss <- fivethirtyeight::bob_ross
glimpse(BobRoss)
```

    #> Rows: 403
    #> Columns: 71
    #> $ episode            <chr> "S01E01", "S01E02", "S01E03", "S01E04", "S01E05"…
    #> $ season             <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, …
    #> $ episode_num        <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 1, 2,…
    #> $ title              <chr> "A WALK IN THE WOODS", "MT. MCKINLEY", "EBONY SU…
    #> $ apple_frame        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ aurora_borealis    <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ barn               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ beach              <int> 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, …
    #> $ boat               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ bridge             <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ building           <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ bushes             <int> 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 0, …
    #> $ cabin              <int> 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ cactus             <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ circle_frame       <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ cirrus             <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, …
    #> $ cliff              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ clouds             <int> 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, …
    #> $ conifer            <int> 0, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, …
    #> $ cumulus            <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, …
    #> $ deciduous          <int> 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 1, 0, 1, 1, 0, 1, …
    #> $ diane_andre        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ dock               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ double_oval_frame  <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ farm               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ fence              <int> 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, …
    #> $ fire               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ florida_frame      <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ flowers            <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ fog                <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ framed             <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ grass              <int> 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, …
    #> $ guest              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ half_circle_frame  <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ half_oval_frame    <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ hills              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ lake               <int> 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, …
    #> $ lakes              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ lighthouse         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ mill               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ moon               <int> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ mountain           <int> 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 0, 0, …
    #> $ mountains          <int> 0, 0, 1, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, …
    #> $ night              <int> 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ ocean              <int> 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, …
    #> $ oval_frame         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ palm_trees         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ path               <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ person             <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ portrait           <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ rectangle_3d_frame <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ rectangular_frame  <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ river              <int> 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ rocks              <int> 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ seashell_frame     <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ snow               <int> 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, …
    #> $ snowy_mountain     <int> 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 0, 0, …
    #> $ split_frame        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ steve_ross         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ structure          <int> 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ sun                <int> 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, …
    #> $ tomb_frame         <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ tree               <int> 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, …
    #> $ trees              <int> 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, …
    #> $ triple_frame       <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ waterfall          <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ waves              <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, …
    #> $ windmill           <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ window_frame       <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ winter             <int> 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …
    #> $ wood_framed        <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, …

# step 5 (pivot\_)

This section covers the `pivot_longer` function.

``` r
BobRossLong <- tidyr::pivot_longer(data = BobRoss, 
                      cols = c(apple_frame:wood_framed), 
                      names_to = 'object', 
                      values_to = 'present')

head(BobRossLong)
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

# step6

This section covers the `pivot_wider()` function.

``` r
BobRossWide <- tidyr::pivot_wider(data = BobRossLong, 
                      names_from = object, 
                      values_from = present)
head(BobRossWide)
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

Check with `setdiff`

``` r
dplyr::setdiff(x = BobRoss, y = BobRossWide)
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
