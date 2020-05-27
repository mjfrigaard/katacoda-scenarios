Format and reshape your data in R with the tidyverse
================

  - [Access the scenario](#access-the-scenario)
      - [Setup](#setup)
      - [Markdown syntax (Katacoda)](#markdown-syntax-katacoda)
      - [Learner personas](#learner-personas)
  - [Intro](#intro)
  - [step 1 (install and load
    packages)](#step-1-install-and-load-packages)
  - [step 2 (fivethirtyeight)](#step-2-fivethirtyeight)
  - [step 3 (tribbles)](#step-3-tribbles)
  - [step 4 (readr)](#step-4-readr)
  - [step 5 (pivot\_longer)](#step-5-pivot_longer)
  - [step6 (pivot\_wider)](#step6-pivot_wider)
  - [step 7 (separate)](#step-7-separate)
  - [step 8 (unite and rm)](#step-8-unite-and-rm)
  - [step 9 (dplyr intro)](#step-9-dplyr-intro)
  - [step 10 (if\_else)](#step-10-if_else)
  - [step 11 (case\_when)](#step-11-case_when)
  - [step 12 (case\_when & mutate)](#step-12-case_when-mutate)
      - [Appendix 1: Katacoda scenario
        tutorials](#appendix-1-katacoda-scenario-tutorials)
      - [Appendix 2: Katacoda
        guidelines](#appendix-2-katacoda-guidelines)
      - [Appendix 3: Scenario Checklist](#appendix-3-scenario-checklist)

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
    about data manipulation with R and Python

2.  Judy is a product manager at a start-up and needs to restructure
    data before loading it into their database.

3.  Andrew is a graduate student in college and needs to analyze his
    thesis/dissertation project.

-----

# Intro

The introduction for this scenario is stored in the following file:

    #> format-shape-data
    #> └── intro.md

This outlines the goals and lessons and introduces the `tidyverse`.

# step 1 (install and load packages)

The `step1` file starts the scenario off an intro to R packages (the
`base::library()` function). The markdown for the `step1.md` file is
below.

    #> format-shape-data
    #> └── step1.md

# step 2 (fivethirtyeight)

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

# step 3 (tribbles)

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

# step 4 (readr)

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

# step 5 (pivot\_longer)

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

# step6 (pivot\_wider)

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

# step 7 (separate)

Create data set for this step.

``` r
BobRossStep7 <- tidyr::separate(data = BobRossLong, col = episode, 
                into = c("season_text", "episode_text"), 
                sep = "E", remove = FALSE) %>% 
  tidyr::unite(season_text, episode_text, col = "new_episode", sep = ", E") %>% 
  dplyr::select(
    episode_info = new_episode, 
    title:present)
# export
readr::write_csv(as.data.frame(BobRossStep7), "data/BobRossStep7.csv")
rm(BobRossStep7)
```

``` r
BobRossStep7 <- readr::read_csv(file = "https://bit.ly/bob-ross-step7")
glimpse(BobRossStep7)
```

    #> Rows: 27,001
    #> Columns: 4
    #> $ episode_info <chr> "S01, E01", "S01, E01", "S01, E01", "S01, E01", "S01, …
    #> $ title        <chr> "A WALK IN THE WOODS", "A WALK IN THE WOODS", "A WALK …
    #> $ object       <chr> "apple_frame", "aurora_borealis", "barn", "beach", "bo…
    #> $ present      <dbl> 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, …

separate `episode_info`

``` r
tidyr::separate(data = BobRossStep7, 
                col = episode_info, 
                into = c("season", "episode"))
```

    #> # A tibble: 27,001 x 5
    #>    season episode title               object          present
    #>    <chr>  <chr>   <chr>               <chr>             <dbl>
    #>  1 S01    E01     A WALK IN THE WOODS apple_frame           0
    #>  2 S01    E01     A WALK IN THE WOODS aurora_borealis       0
    #>  3 S01    E01     A WALK IN THE WOODS barn                  0
    #>  4 S01    E01     A WALK IN THE WOODS beach                 0
    #>  5 S01    E01     A WALK IN THE WOODS boat                  0
    #>  6 S01    E01     A WALK IN THE WOODS bridge                0
    #>  7 S01    E01     A WALK IN THE WOODS building              0
    #>  8 S01    E01     A WALK IN THE WOODS bushes                1
    #>  9 S01    E01     A WALK IN THE WOODS cabin                 0
    #> 10 S01    E01     A WALK IN THE WOODS cactus                0
    #> # … with 26,991 more rows

# step 8 (unite and rm)

Here we unite two columns into a single column.

``` r
BobRossStep8 <- tidyr::separate(data = BobRossLong, col = episode, 
                into = c("season_text", "episode_text"), 
                sep = "E", remove = FALSE) %>% 
  dplyr::select(season_text, episode_text, title:present)
# export
readr::write_csv(as.data.frame(x = BobRossStep8), "data/BobRossStep8.csv")
```

``` r
BobRossStep8 <- readr::read_csv(file = "https://bit.ly/bob-ross-step8")
head(BobRossStep8)
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

Use `unite`.

``` r
unite(data = BobRossStep8, season_text, episode_text, col = 'episode_new', 
      sep = "E")
```

    #> # A tibble: 27,001 x 4
    #>    episode_new title               object          present
    #>    <chr>       <chr>               <chr>             <dbl>
    #>  1 S01E01      A WALK IN THE WOODS apple_frame           0
    #>  2 S01E01      A WALK IN THE WOODS aurora_borealis       0
    #>  3 S01E01      A WALK IN THE WOODS barn                  0
    #>  4 S01E01      A WALK IN THE WOODS beach                 0
    #>  5 S01E01      A WALK IN THE WOODS boat                  0
    #>  6 S01E01      A WALK IN THE WOODS bridge                0
    #>  7 S01E01      A WALK IN THE WOODS building              0
    #>  8 S01E01      A WALK IN THE WOODS bushes                1
    #>  9 S01E01      A WALK IN THE WOODS cabin                 0
    #> 10 S01E01      A WALK IN THE WOODS cactus                0
    #> # … with 26,991 more rows

# step 9 (dplyr intro)

``` r
rm(list = ls(pattern = "Step"))
ls()
```

    #> [1] "BobRoss"      "BobRossLong"  "BobRossWide"  "SmallBobRoss"

``` r
tibble::tribble(
  ~category, ~april, ~may, ~june, 
  "Zone A",       9,   14,     5,
  "Zone B",      12,   16,    10,
  "Zone C",      15,   18,    15) %>% 
  # 
  tidyr::pivot_longer(data = .,
                      cols = -category, 
                      names_to = "month", 
                      values_to = "count") %>% 
  # 
  tidyr::pivot_wider(data = .,
                     names_from = month, 
                     values_from = count)
```

    #> # A tibble: 3 x 4
    #>   category april   may  june
    #>   <chr>    <dbl> <dbl> <dbl>
    #> 1 Zone A       9    14     5
    #> 2 Zone B      12    16    10
    #> 3 Zone C      15    18    15

``` r
BobRossStep8 <- readr::read_csv(file = "https://bit.ly/bob-ross-step8")
BobRossStep9 <- BobRossStep8 %>% 
  dplyr::mutate(season_txt = stringr::str_remove_all(string = season_text, 
                                                pattern = "S")) %>% 
  dplyr::rename(episode_txt = episode_text) 

BobRossStep9 <- BobRossStep9 %>% 
  dplyr::select(episode_txt, 
                season_txt,
                title,
                object,
                present)
BobRossStep9
```

    #> # A tibble: 27,001 x 5
    #>    episode_txt season_txt title               object          present
    #>    <chr>       <chr>      <chr>               <chr>             <dbl>
    #>  1 01          01         A WALK IN THE WOODS apple_frame           0
    #>  2 01          01         A WALK IN THE WOODS aurora_borealis       0
    #>  3 01          01         A WALK IN THE WOODS barn                  0
    #>  4 01          01         A WALK IN THE WOODS beach                 0
    #>  5 01          01         A WALK IN THE WOODS boat                  0
    #>  6 01          01         A WALK IN THE WOODS bridge                0
    #>  7 01          01         A WALK IN THE WOODS building              0
    #>  8 01          01         A WALK IN THE WOODS bushes                1
    #>  9 01          01         A WALK IN THE WOODS cabin                 0
    #> 10 01          01         A WALK IN THE WOODS cactus                0
    #> # … with 26,991 more rows

``` r
# export
readr::write_csv(as.data.frame(x = BobRossStep9), "data/BobRossStep9.csv")
```

Import data

``` r
BobRossStep9 <- readr::read_csv(file = "https://bit.ly/bob-ross-step9")
```

Convert to numeric.

``` r
dplyr::mutate(.data = BobRossStep9, episode_num = as.numeric(episode_txt))
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

Convert `title` to `title`.

``` r
dplyr::mutate(.data = BobRossStep9, 
              episode_num = base::as.numeric(episode_txt),
              title = stringr::str_to_title(title))
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

``` r
dplyr::mutate(.data = BobRossStep9, 
              episode_num = base::as.numeric(episode_txt),
              title = stringr::str_to_title(title),
              object = stringr::str_replace_all(string = object, 
                                       pattern = "_", 
                                       replacement = " "))
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

``` r
BobRossStep9 <- dplyr::mutate(.data = BobRossStep9, 
              # first new variable 
              episode_num = base::as.numeric(episode_txt),
              # second variable change
              title = stringr::str_to_title(title),
              # third variable change
              object = stringr::str_replace_all(string = object, 
                                       pattern = "_", 
                                       replacement = " "))
```

# step 10 (if\_else)

``` r
rm(list = ls(pattern = "Step"))
ls()
```

    #> [1] "BobRoss"      "BobRossLong"  "BobRossWide"  "SmallBobRoss"

``` r
BobRossStep10 <- BobRossLong %>% 
  dplyr::select(-episode_num)
head(BobRossStep10)
```

    #> # A tibble: 6 x 5
    #>   episode season title               object          present
    #>   <chr>    <dbl> <chr>               <chr>             <int>
    #> 1 S01E01       1 A WALK IN THE WOODS apple_frame           0
    #> 2 S01E01       1 A WALK IN THE WOODS aurora_borealis       0
    #> 3 S01E01       1 A WALK IN THE WOODS barn                  0
    #> 4 S01E01       1 A WALK IN THE WOODS beach                 0
    #> 5 S01E01       1 A WALK IN THE WOODS boat                  0
    #> 6 S01E01       1 A WALK IN THE WOODS bridge                0

``` r
# export
readr::write_csv(as.data.frame(x = BobRossStep10), "data/BobRossStep10.csv")
```

Create a new variable base on conditions.

``` r
BobRossStep10 <- readr::read_csv(file = "https://bit.ly/bob-ross-step10")
head(BobRossStep10)
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

``` r
BobRossStep10 <- dplyr::mutate(.data = BobRossStep10, 
                            season01 = if_else(condition = season == 1, 
                                               true = TRUE,
                                               false = FALSE))
dplyr::count(BobRossStep10, season01)
```

    #> # A tibble: 2 x 2
    #>   season01     n
    #>   <lgl>    <int>
    #> 1 FALSE    26130
    #> 2 TRUE       871

``` r
BobRossStep10 <- dplyr::mutate(.data = BobRossStep10, 
                    episode01 = if_else(condition = str_detect(string = episode, 
                                                               pattern = "E01"), 
                                    true = TRUE,
                                    false = FALSE))
dplyr::count(BobRossStep10, episode01)
```

    #> # A tibble: 2 x 2
    #>   episode01     n
    #>   <lgl>     <int>
    #> 1 FALSE     24924
    #> 2 TRUE       2077

# step 11 (case\_when)

Check working environment

``` r
rm(list = ls(pattern = "Step"))
ls()
```

    #> [1] "BobRoss"      "BobRossLong"  "BobRossWide"  "SmallBobRoss"

``` r
# ls()
BobRossStep11 <- BobRossLong %>% 
  # fix titles and object
  dplyr::mutate(
    title = stringr::str_to_title(title),
    object = stringr::str_replace_all(object, "_", " ")) %>% 
  # limit to present 1 and season 1 & episode_num <= 3
  dplyr::filter(present == 1 & season == 1 & episode_num <= 3)
# export
readr::write_csv(as.data.frame(x = BobRossStep11), "data/BobRossStep11.csv")
```

Import new data.

``` r
BobRossStep11 <- readr::read_csv(file = "https://bit.ly/bob-ross-step11")
glimpse(BobRossStep11)
```

    #> Rows: 25
    #> Columns: 6
    #> $ episode     <chr> "S01E01", "S01E01", "S01E01", "S01E01", "S01E01", "S01E…
    #> $ season      <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…
    #> $ episode_num <dbl> 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3…
    #> $ title       <chr> "A Walk In The Woods", "A Walk In The Woods", "A Walk I…
    #> $ object      <chr> "bushes", "deciduous", "grass", "river", "tree", "trees…
    #> $ present     <dbl> 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1…

create `object_category`.

``` r
dplyr::mutate(.data = BobRossStep11, 
          object_category = case_when(
              season == 1 & str_detect(string = object, pattern = "mountain") ~ "mountains",
              season == 1 & str_detect(string = object, pattern = "deciduous") ~ "trees",
              season == 1 & str_detect(string = object, pattern = "tree") ~ "trees",
              season == 1 & str_detect(string = object, pattern = "conifer") ~ "trees",
              season == 1 & str_detect(string = object, pattern = "bush") ~ "bushes",
              season == 1 & str_detect(string = object, pattern = "river") ~ "water",
              season == 1 & str_detect(string = object, pattern = "barn") ~ "buildings",
              season == 1 & str_detect(string = object, pattern = "cabin") ~ "buildings",
              TRUE ~ "other"))
```

    #> # A tibble: 25 x 7
    #>    episode season episode_num title         object     present object_category
    #>    <chr>    <dbl>       <dbl> <chr>         <chr>        <dbl> <chr>          
    #>  1 S01E01       1           1 A Walk In Th… bushes           1 bushes         
    #>  2 S01E01       1           1 A Walk In Th… deciduous        1 trees          
    #>  3 S01E01       1           1 A Walk In Th… grass            1 other          
    #>  4 S01E01       1           1 A Walk In Th… river            1 water          
    #>  5 S01E01       1           1 A Walk In Th… tree             1 trees          
    #>  6 S01E01       1           1 A Walk In Th… trees            1 trees          
    #>  7 S01E02       1           2 Mt. Mckinley  cabin            1 buildings      
    #>  8 S01E02       1           2 Mt. Mckinley  clouds           1 other          
    #>  9 S01E02       1           2 Mt. Mckinley  conifer          1 trees          
    #> 10 S01E02       1           2 Mt. Mckinley  mountain         1 mountains      
    #> 11 S01E02       1           2 Mt. Mckinley  snow             1 other          
    #> 12 S01E02       1           2 Mt. Mckinley  snowy mou…       1 mountains      
    #> 13 S01E02       1           2 Mt. Mckinley  tree             1 trees          
    #> 14 S01E02       1           2 Mt. Mckinley  trees            1 trees          
    #> 15 S01E02       1           2 Mt. Mckinley  winter           1 other          
    #> 16 S01E03       1           3 Ebony Sunset  cabin            1 buildings      
    #> 17 S01E03       1           3 Ebony Sunset  conifer          1 trees          
    #> 18 S01E03       1           3 Ebony Sunset  fence            1 other          
    #> 19 S01E03       1           3 Ebony Sunset  mountain         1 mountains      
    #> 20 S01E03       1           3 Ebony Sunset  mountains        1 mountains      
    #> 21 S01E03       1           3 Ebony Sunset  structure        1 other          
    #> 22 S01E03       1           3 Ebony Sunset  sun              1 other          
    #> 23 S01E03       1           3 Ebony Sunset  tree             1 trees          
    #> 24 S01E03       1           3 Ebony Sunset  trees            1 trees          
    #> 25 S01E03       1           3 Ebony Sunset  winter           1 other

# step 12 (case\_when & mutate)

This uses the original `bob_ross` (reduced to season 4, episodes 4 - )

``` r
BobRossStep12 <- fivethirtyeight::bob_ross %>% 
  dplyr::filter(episode_num >= 4 & episode_num <= 5 & season == 4) %>% 
  tidyr::pivot_longer(data = ., 
                      cols = c(apple_frame:wood_framed), 
                          names_to = "object",  
                            values_to = "present") %>% 
  dplyr::filter(present == 1) %>% 
  # limit to only a subset of objects
  dplyr::filter(object %in% c("cabin", "clouds", 
                              "cumulus", "framed", 
                              "circle_frame", "deciduous", 
                              "tree", "trees")) %>% 
  # pivot wider again
  tidyr::pivot_wider(data = ., 
                     names_from = object, 
                     values_from = present)
# export BobRossStep12
readr::write_csv(as.data.frame(x = BobRossStep12), "data/BobRossStep12.csv")
head(BobRossStep12)
```

    #> # A tibble: 2 x 12
    #>   episode season episode_num title cabin circle_frame clouds cumulus deciduous
    #>   <chr>    <dbl>       <dbl> <chr> <int>        <int>  <int>   <int>     <int>
    #> 1 S04E04       4           4 WINT…     1            1      1       1         1
    #> 2 S04E05       4           5 EVEN…    NA           NA      1       1        NA
    #> # … with 3 more variables: framed <int>, tree <int>, trees <int>

``` r
BobRossStep12 <- readr::read_csv(file = "https://bit.ly/bob-ross-step12")
head(BobRossStep12)
```

    #> # A tibble: 2 x 12
    #>   episode season episode_num title cabin circle_frame clouds cumulus deciduous
    #>   <chr>    <dbl>       <dbl> <chr> <dbl>        <dbl>  <dbl>   <dbl>     <dbl>
    #> 1 S04E04       4           4 WINT…     1            1      1       1         1
    #> 2 S04E05       4           5 EVEN…    NA           NA      1       1        NA
    #> # … with 3 more variables: framed <dbl>, tree <dbl>, trees <dbl>

First create a long version

``` r
BobRossStep12 <- tidyr::pivot_longer(data = BobRossStep12, 
                      cols = -c(episode, season, episode_num, title), 
                          names_to = "object",  
                            values_to = "present")
BobRossStep12
```

    #> # A tibble: 16 x 6
    #>    episode season episode_num title            object       present
    #>    <chr>    <dbl>       <dbl> <chr>            <chr>          <dbl>
    #>  1 S04E04       4           4 WINTER SAWSCAPE  cabin              1
    #>  2 S04E04       4           4 WINTER SAWSCAPE  circle_frame       1
    #>  3 S04E04       4           4 WINTER SAWSCAPE  clouds             1
    #>  4 S04E04       4           4 WINTER SAWSCAPE  cumulus            1
    #>  5 S04E04       4           4 WINTER SAWSCAPE  deciduous          1
    #>  6 S04E04       4           4 WINTER SAWSCAPE  framed             1
    #>  7 S04E04       4           4 WINTER SAWSCAPE  tree               1
    #>  8 S04E04       4           4 WINTER SAWSCAPE  trees              1
    #>  9 S04E05       4           5 EVENING SEASCAPE cabin             NA
    #> 10 S04E05       4           5 EVENING SEASCAPE circle_frame      NA
    #> 11 S04E05       4           5 EVENING SEASCAPE clouds             1
    #> 12 S04E05       4           5 EVENING SEASCAPE cumulus            1
    #> 13 S04E05       4           5 EVENING SEASCAPE deciduous         NA
    #> 14 S04E05       4           5 EVENING SEASCAPE framed            NA
    #> 15 S04E05       4           5 EVENING SEASCAPE tree               1
    #> 16 S04E05       4           5 EVENING SEASCAPE trees              1

Now create categorical variable for `frames` and `guests` in
`BobRossStep12`.

``` r
BobRossStep12 <- dplyr::mutate(.data = BobRossStep12, 
              painting_cats = case_when(
                  present == 1 & str_detect(object, "cabin") ~ "Cabins",
                  present == 1 & str_detect(object, "frame") ~ "Frames",
                  present == 1 & str_detect(object, "tree|deciduous") ~ "Trees",
                  present == 1 & str_detect(object, "cloud|cumulus") ~ "Clouds",
                  TRUE ~ NA_character_)) 
BobRossStep12
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
    #> 11 S04E05       4           5 EVENING SEASCA… clouds           1 Clouds       
    #> 12 S04E05       4           5 EVENING SEASCA… cumulus          1 Clouds       
    #> 13 S04E05       4           5 EVENING SEASCA… deciduous       NA <NA>         
    #> 14 S04E05       4           5 EVENING SEASCA… framed          NA <NA>         
    #> 15 S04E05       4           5 EVENING SEASCA… tree             1 Trees        
    #> 16 S04E05       4           5 EVENING SEASCA… trees            1 Trees

``` r
dplyr::count(BobRossStep12, painting_cats)
```

    #> # A tibble: 5 x 2
    #>   painting_cats     n
    #>   <chr>         <int>
    #> 1 Cabins            1
    #> 2 Clouds            4
    #> 3 Frames            2
    #> 4 Trees             5
    #> 5 <NA>              4

``` r
dplyr::count(BobRossStep12, object, painting_cats)
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
    #> 11 tree         Trees             2
    #> 12 trees        Trees             2

``` r
BobRossCounts <- dplyr::count(BobRossStep12, painting_cats, object)
pivot_wider(data = BobRossCounts, names_from = painting_cats, values_from = n)
```

    #> # A tibble: 8 x 6
    #>   object       Cabins Clouds Frames Trees  `NA`
    #>   <chr>         <int>  <int>  <int> <int> <int>
    #> 1 cabin             1     NA     NA    NA     1
    #> 2 clouds           NA      2     NA    NA    NA
    #> 3 cumulus          NA      2     NA    NA    NA
    #> 4 circle_frame     NA     NA      1    NA     1
    #> 5 framed           NA     NA      1    NA     1
    #> 6 deciduous        NA     NA     NA     1     1
    #> 7 tree             NA     NA     NA     2    NA
    #> 8 trees            NA     NA     NA     2    NA

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
