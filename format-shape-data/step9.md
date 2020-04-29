# Data wrangling: level two

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
dplyr::mutate(.data = DataFrame,
              # changed variable
              `new variable name` =
                  # function used to change variable
                   some_function(
                      # current variable name
                      `old variable name`))
```

As you can see from the code and comments above, first we enter the data set (`DataFrame`), then the name of the new variable we want to create (`new variable name`), the equals sign `=`, then the function we want to apply `some_function()` and the original variable we want to apply it to `old variable name`.

Let's import a new version of `BobRoss` for this step. 

```
BobRossStep9 <- readr::read_csv(file = "https://bit.ly/bob-ross-step9")
```{{execute}}

## Changing variable formats

So if we run the code below, it should create `episode_num`, which is a numerical version `episode_txt` (converting `<chr>` to `<dbl>` to numeric).

```
# click to execute code
dplyr::mutate(.data = BobRossStep9, episode_num = as.numeric(episode_txt))
```{{execute}}

We can see this creates a new variable, but we still have `episode_txt`. Next we'll convert the `title` to title case using the `stringr` package (also from the `tidyverse`), and we will overwrite the existing variable by naming it `title`. 

```
dplyr::mutate(.data = BobRossStep9, 
              # first new variable 
              episode_num = base::as.numeric(episode_txt),
              # second new variable 
              title = stringr::str_to_title(title))
```{{execute}}

The great thing about `dplyr::mutate()` and other `tidyverse` functions is that we can view our work before we assign anything to a new dataset. **It's always a good idea to check your data wrangling before assigning it back to the data frame.** 

We will make one final change to the `object` variable by removing the underscores between the objects with `stringr::str_replace_all()`. 

```
dplyr::mutate(.data = BobRossStep9, 
              # first new variable 
              episode_num = base::as.numeric(episode_txt),
              # second variable change
              title = stringr::str_to_title(title),
              # third variable change
              object = stringr::str_replace_all(string = object, 
                                       pattern = "_", 
                                       replacement = " "))
```{{execute}}

Now that we see these variable are formatted the way we want it, we'll assign these changes to the `BobRossStep9` object. 

```
BobRossStep9 <- dplyr::mutate(.data = BobRossStep9, 
              # first new variable 
              episode_num = base::as.numeric(episode_txt),
              # second variable change
              title = stringr::str_to_title(title),
              # third variable change
              object = stringr::str_replace_all(string = object, 
                                       pattern = "_", 
                                       replacement = " "))
head(BobRossStep9)
```{{execute}}

Read more about [`stringr` package](https://stringr.tidyverse.org/).
