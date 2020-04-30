# Creating new variables based on multiple conditions

The `dplyr::if_else()` function works well with `dplyr::mutate()` for creating new variables based on a single condition, but sometimes we want to create new variables based on the values in more than one column (i.e. multiple conditions). 

In this case, we can combine `dplyr::mutate()` wjth `dplyr::case_when()` to create new variables based on multiple conditions. These functions work together with the following arguments. 

### Using `dplyr::case_when()` with `dplyr::mutate()`

```
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

> *The left hand side determines which values match this case. The right hand side provides the replacement value. The LHS must evaluate to a logical vector. The right hand side does not need to be logical, but all right hand sides must evaluate to the same type of vector.* 

### Creating categorical variables

We will load a small example of `BobRoss` to experiment with [`dplyr::case_when()`](https://dplyr.tidyverse.org/reference/case_when.html). This dataset only has the first three episodes of season 1.

```
BobRossStep11 <- readr::read_csv(file = "https://bit.ly/bob-ross-step11")
head(BobRossStep11)
```{{execute}}

We can see this is a reduced dataset from `BobRoss` We will use `dplyr::case_when()` to create an `painting_category` variable based on what `object`s were in a particular episode's painting. We'll be using `stringr::str_detect()` again to find all the paintings of with `mountains`, `trees`, and `bushes`. 

```
dplyr::mutate(.data = BobRossStep11, 
          object_category = case_when(
              season == 1 & str_detect(string = object, pattern = "mountain") ~ "mountains",
              season == 1 & str_detect(string = object, pattern = "deciduous") ~ "trees",
              season == 1 & str_detect(string = object, pattern = "tree") ~ "trees",
              season == 1 & str_detect(string = object, pattern = "conifer") ~ "trees",
              season == 1 & str_detect(string = object, pattern = "bush") ~ "bushes"))
```{{execute}}

The great thing about `case_when()` is that we can keep adding more conditions. For example, we can add `water` and `buildings` to the same `object_category` variable. 

```
dplyr::mutate(.data = BobRossStep11, 
          object_category = case_when(
              season == 1 & str_detect(string = object, pattern = "mountain") ~ "mountains",
              season == 1 & str_detect(string = object, pattern = "deciduous") ~ "trees",
              season == 1 & str_detect(string = object, pattern = "tree") ~ "trees",
              season == 1 & str_detect(string = object, pattern = "conifer") ~ "trees",
              season == 1 & str_detect(string = object, pattern = "bush") ~ "bushes",
              season == 1 & str_detect(string = object, pattern = "river") ~ "water",
              season == 1 & str_detect(string = object, pattern = "barn") ~ "buildings",
              season == 1 & str_detect(string = object, pattern = "cabin") ~ "buildings"))
```{{execute}}

We can also include a 'catch-all' with a logical `TRUE` condition.

```
BobRossStep11 <- dplyr::mutate(.data = BobRossStep11, 
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
head(BobRossStep11)
```{{execute}}

