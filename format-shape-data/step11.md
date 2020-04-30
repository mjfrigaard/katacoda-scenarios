# Creating new variables based on multiple conditions

The `dplyr::if_else` function works well with `dplyr::mutate()` for creating new variables based on a single condition, but sometimes we want to create new variables based on the values in more than one column (i.e. multiple conditions). In this case, we can combine `dplyr::mutate()` wjth `dplyr::case_when()` to create new variables based on multiple conditions. These functions work together with the following arguments. 

```
# first we assign a new variable name
dplyr::mutate(.data = DataSet, `new variable name`, 
        # then we enter our conditions (condition 1)
           case_when(left hand side condition 1 ~ right hand side replacement 1,
                    # condition 2 
                    left hand side condition 2 ~ right hand side replacement 2))
```

We learn more about how `case_when` works by accessing the R help files (`?dplyr::case_when`).

> *The left hand side determines which values match this case. The right hand side provides the replacement value. The LHS must evaluate to a logical vector. The right hand side does not need to be logical, but all right hand sides must evaluate to the same type of vector.* 

## Using `case_when`

We will load a small example of `BobRoss` to experiment with [`dplyr::case_when()`](https://dplyr.tidyverse.org/reference/case_when.html).

```
BobRossStep11 <- readr::read_csv(file = "https://bit.ly/bob-ross-step11")
head(BobRossStep11)
```{{execute}}

We can see this is a reduced dataset from `BobRoss` We will use `dplyr::case_when()` to create a `title_category` variable based on what `object`s were in the episode in the title was . We'll be using 



```
dplyr::mutate(.data = BobRossStep11, 
          object_category = case_when(
              present == 1 & str_detect(string = object, pattern = "mountain") ~ "mountains",
              present == 1 & str_detect(string = object, pattern = "bushes") ~ "bushes"))
```{{execute}}

