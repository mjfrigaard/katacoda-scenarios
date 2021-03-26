### Create New Variables Based on a Condition

Many times we'll want to create a new variable based on the values in another variable. For example, assume we want to identify only those objects that are in season 1. We can do this by creating a new variable called `season01`, and assigning the value of `TRUE` to all the objects that occurred in season 1, and `FALSE` to every other object.

Let's import a dataset for this step:

```
# click to execute code
BobRossStep10 <- readr::read_csv(file = "https://bit.ly/bob-ross-step10")
head(BobRossStep10)
```{{execute}}

Create `season01` by filling in the the appropriate logical values (`TRUE`/`FALSE`) for `true =` and `false = `:

```
# click to copy code
mutate(.data = BobRossStep10, season01 = if_else(season == 1, true = ____, false = _____))
```{{copy}}

We notice this creates a `<lgl>` variable, which can only have one of two values (`TRUE` and `FALSE`). Logical is excellent for binary variables because you can still perform mathematical operations on them.

**NOTE: Logical vectors are coerced to integer vectors in contexts where a numerical value is required, with `TRUE` mapped to `1`, `FALSE` to `0`**

#### Counting to check our work

Assuming we know how many episodes are season 1, we can check the new variable using `dplyr::count()`:

```
# click to execute code
BobRossStep10 <- dplyr::mutate(.data = BobRossStep10,
                            season01 = if_else(condition = season == 1,
                                               true = TRUE,
                                               false = FALSE))
# count the new values
dplyr::count(BobRossStep10, season01)
```{{execute}}

`count` returns a tibble with a sum of each value in `season01`.

We can also use `if_else` in combination with [`stringr::str_detect()`](https://stringr.tidyverse.org/reference/str_detect.html) to find all `E01` instances in `episode`. The `str_detect()` is incredibly handy for finding patterns in text data because it returns a logical (`TRUE` or `FALSE`):

```
# click to execute code
BobRossStep10 <- dplyr::mutate(.data = BobRossStep10,
                   episode01 = if_else(condition = str_detect(
                                                    string = episode,
                                                    pattern = "E01"),
                                                        true = TRUE,
                                                        false = FALSE))
# count the new values
dplyr::count(BobRossStep10, episode01)
```{{execute}}

We can see the total number of first episodes. Again, this assumes we know the total number of first episodes and that they are all coded correctly.
