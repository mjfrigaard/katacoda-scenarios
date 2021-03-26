# Data Frames and tibbles

One quick and easy way to get data into R is to create the data 'by hand' using the `tibble::tribble()` function. Read more about this function [in R For Data Science](https://learning.oreilly.com/library/view/r-for-data/9781491910382/ch07.html#tibbles).

The data is stored as a [comma-separated values](https://en.wikipedia.org/wiki/Comma-separated_values) file on Github (see below):

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

## Rectangular Data

Both data frames (called `data.frame`s in R) and `tibble`s are rectangular data objects. They have columns and rows for storing data, similar to a spreadsheet in Excel. The main difference between a `tibble` and a `data.frame` is how they are printed to the console. We are going to create a `tibble` and `data.frame` with the data above to demonstrate these differences.

## Create a tibble

The `tibble::tribble()` function takes column names preceded by the tilde (i.e., `~column`), then get separated by commas (`~column1`, `~column2`, `~column3`). Then `tibble::tribble()` reads the data starting on the second line, similar to the way the actual data is stored above.

The `tibble` we create below is a small sample from the [`bob_ross`](https://fivethirtyeight-r.netlify.app/articles/fivethirtyeight.html) dataset. The following code creates `BobRossTibble` from the data above in the R environment:

```
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
```{{execute}}

## Create a data.frame

The `base::data.frame()` function creates columns transposed, with values displayed left to right). We can create `data.frame`s with a series of named vectors, or supply them directly to the function (both work).

In the following, we create three vectors (`title`, `bushes`, and `clouds`), then supply these to the `base::data.frame()` function and assign it to `BobRossDataFrame`. The names of the vectors end up being the column names:

```
# click to execute code
title <- c("A WALK IN THE WOODS", "MT. MCKINLEY", "EBONY SUNSET",
            "WINTER MIST", "QUIET STREAM", "WINTER MOON", "AUTUMN MOUNTAINS",
            "PEACEFUL VALLEY", "SEASCAPE", "MOUNTAIN LAKE", "WINTER GLOW",
            "SNOWFALL", "FINAL REFLECTIONS", "MEADOW LAKE", "WINTER SUN")
bushes <- c(1L, 0L, 0L, 1L, 0L, 0L, 0L, 1L, 0L, 1L, 0L, 0L, 1L, 1L, 0L)
clouds <- c(0L, 1L, 0L, 1L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 1L, 0L, 0L, 0L)
BobRossDataFrame <- data.frame(title, bushes, clouds)
BobRossDataFrame
```{{execute}}

This is the same `data.frame`, but with the vectors supplied as arguments *inside* the `data.frame()` function:

```
# click to execute code
BobRossDataFrame <- data.frame(
  title = c("A WALK IN THE WOODS", "MT. MCKINLEY", "EBONY SUNSET",
            "WINTER MIST", "QUIET STREAM", "WINTER MOON", "AUTUMN MOUNTAINS",
            "PEACEFUL VALLEY", "SEASCAPE", "MOUNTAIN LAKE", "WINTER GLOW",
            "SNOWFALL", "FINAL REFLECTIONS", "MEADOW LAKE", "WINTER SUN"),
  bushes = c(1L, 0L, 0L, 1L, 0L, 0L, 0L, 1L, 0L, 1L, 0L, 0L, 1L, 1L, 0L),
  clouds = c(0L, 1L, 0L, 1L, 0L, 0L, 0L, 0L, 1L, 0L, 0L, 1L, 0L, 0L, 0L))
BobRossDataFrame
```{{execute}}


There are a few things to pay attention to in the code output above:

1. The assignment operator `<-` is used to create the `SmallBobRoss` tibble, which is a data object.
2. `tibble`s print out the first ten rows, and the following header and footer:
    ```
    # header
    # A tibble: 15 x 3
       title               bushes clouds
       <chr>                <int>  <int>
    # footer
    # … with 5 more rows
    ```
    This header tells us what kind of variables are in the `tibble` (`<chr>` versus `<int>`)
3. `data.frame`s print the entire rectangle to the console:
    ```
                     title bushes clouds
    1  A WALK IN THE WOODS      1      0
    2         MT. MCKINLEY      0      1
    3         EBONY SUNSET      0      0
    4          WINTER MIST      1      1
    5         QUIET STREAM      0      0
    6          WINTER MOON      0      0
    7     AUTUMN MOUNTAINS      0      0
    8      PEACEFUL VALLEY      1      0
    9             SEASCAPE      0      1
    10       MOUNTAIN LAKE      1      0
    11         WINTER GLOW      0      0
    12            SNOWFALL      0      1
    13   FINAL REFLECTIONS      1      0
    14         MEADOW LAKE      1      0
    15          WINTER SUN      0      0
    ```

We see more data, but know less about the format of the variables.
