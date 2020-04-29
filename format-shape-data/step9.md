# Making a character variable numeric

We're going to use the `dplyr::mutate()` function to change the format of the `ht_m` variable from character (`<chr>`) to numeric (`<dbl>`).

How `dplyr::mutate()` works:

```
# a data set
dplyr::mutate(.data = DataFrame,
              # changed variable
              `new variable name` =
                  # function used to change variable
                   some_function(
                      # current variable name
                      `old variable name`))
```

As you can see from the code and comments above, first we enter the data set (`DataFrame`), then the name of the new variable we want to create (`new variable name`), the equals sign `=`, then the function we want to apply `some_function()` and the original variable we want to apply it to `old variable name`.

So if we run the code below, we should find the `ht_m` variable changes from character (`<chr>`) to numeric (or double `<dbl>`).

```
# BpData data set
dplyr::mutate(.data = BpData,
              # # changed variable
              ht_m =
                  # function used to change variable
                  base::as.numeric(
                      # original variable name
                      ht_m))
```{{execute}}

Now we can see the `ht_m` variable is a `<dbl>`. **It's always a good idea to check your data wrangling before assigning it back to the data frame.** Now that we see this variable is formatted the way we want it, we can assign it back to the `BpData` object.

```
# BpData data set
BpData = dplyr::mutate(.data = BpData,
              # # changed variable
              ht_m =
                  # function used to change variable
                  base::as.numeric(
                      # original variable name
                      ht_m))
```{{execute}}

This produces no output. If you'd like to examine your work, you can wrap the entire thing in parenthesis `()`.
