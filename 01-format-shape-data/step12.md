### Combine `case_when` and `pivot`

After creating new variables, it's always a good idea to check your work. Now that we have some tools for creating new variables, we can use the `tidyr::pivot_` functions to check and make sure all the rows were assigned correctly.

#### Small Bob Ross

We'll import a small version of the `bob_ross` dataset to demonstrate how we can combine both levels of data wrangling to create new variables and check our work.

```
BobRossStep12 <- readr::read_csv(file = "https://bit.ly/bob-ross-step12")
head(BobRossStep12)
```{{execute}}

#### View the data

Use `utils::head()`, `dplyr::glimpse()`, or `utils::str()` to view the contents of `BobRossStep12`.

#### Create long (tidy) dataset

First create a long version of `BobRossStep12` using `tidyr::pivot_longer()`. We've provided some code to get you started,

+ the `cols` argument should be `-c(episode, season, episode_num, title)` (this means negate these four columns)  

+ assign `names_to` to `"object"` and `values_to` to `"present"`).

+ when you're confident you have it correct, assign these changes to `BobRossStep12`.

```
BobRossStep12 <- tidyr::pivot_longer(data = BobRossStep12, cols = -c(episode, season, episode_num, title), names_to = "_______",  values_to = "________")
```{{copy}}

Now that we have a long dataset, we can create a new variable (`painting_cats`) for the following categories.

+ Label any mention of cabin as `Cabins` (*there should only be one*)

+ Capture all framed paintings under the label `Frames` (*a single pattern of `frame` should do the trick*)

+ Create a category for all the `Trees` (*there are different types of trees here, so we can combine multiple arguments by placing a pipe (|) between them*)

+ Label all the clouds as `Clouds` (*same as above, but with different types of clouds*)

+ All other missing values should be labeled `NA` with `NA_character_` (*here we will use `TRUE` as the condition, and the `NA` type as a result *)

```
dplyr::mutate(.data = BobRossStep12,
        painting_cats = case_when(
            present == 1 & str_detect(object, "______") ~ "Cabins",
            present == 1 & str_detect(object, "______") ~ "Frames",
            present == 1 & str_detect(object, "____|_________") ~ "Trees",
            present == 1 & str_detect(object, "_____|_______") ~ "Clouds",
            TRUE ~ __________))
```{{copy}}

**Did you get it?**

You can run the code below to check

```
BobRossStep12 <- dplyr::mutate(.data = BobRossStep12,
              painting_cats = case_when(
              present == 1 & str_detect(object, "cabin") ~ "Cabins",
              present == 1 & str_detect(object, "frame") ~ "Frames",
              present == 1 & str_detect(object, "tree|deciduous") ~ "Trees",
              present == 1 & str_detect(object, "cloud|cumulus") ~ "Clouds",
              TRUE ~ NA_character_))
BobRossStep12
```{{execute}}


Now we want to check our work by creating a cross-tabulation between `object` and `painting_cats`. We can do this with `dplyr::count()`, which tallies up all the values in a column. Copy the code below to see the new values in `painting_cats`.

```
# click to copy code
# the n column is the tally of the values
dplyr::count(BobRossStep12, painting_cats)
```{{copy}}

If we want to count two variables, we simply separate them with a comma (see below).

```
# click to copy code
# the n is the tally, but for both variables
dplyr::count(BobRossStep12, object, painting_cats)
```{{copy}}

As you can see, this is returning a `tibble`. We know how to reshape `tibbles` with the `pivot_` functions now, so let's restructure the output to view the values of `painting_cats` across columns.

```
# click to copy code
# create counts dataset of object and painting_cats
BobRossCounts <- dplyr::count(BobRossStep12, painting_cats, ______)
```{{copy}}

Assign the names from our new `painting_cats` variable and values from `n`

```
# click to copy code
# reshape this to wide and use n as the values
pivot_wider(data = BobRossCounts, names_from = painting_cats, values_from = _)
```{{copy}}
