# Level two of data wrangling

We said we like to think of the first level of data wrangling as changes to the data structure itself (what the dimensions, columns and rows should be). The second level of data wrangling refers to *creating or calculating new variables based on existing columns and values*. 

You might be wondering how these two are different, and the primary difference is that all the changes we made to the data were done using the position or location of the data. For example, consider the data arrangement below:

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/03-original-data.png?raw=true)

This data has three months spread across columns, and a `category` variable that serves as an index for the values. If we want these data in the long format, it would look like the image below:

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/04-pivot-longer.png?raw=true)

The `tidyr::pivot_longer()` changes the position of the indices and values, but doesn't calculate or create any new information. We can just as easily move the data back into it's original arrangement (see below).

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/05-pivot-wider.png?raw=true)

`unite` and `separate()` also change the position and contents of the information, but they do not calculate or create new variables. The primary package for data manipulation at the second level is `dplyr`, and we will explore it's functions in the next three steps. 

## Create new variables

We're going to use the `dplyr::mutate()` function to change the format of a charater variable (`<chr>`) to numeric (`<dbl>`).



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
