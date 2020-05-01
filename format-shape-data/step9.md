# Data wrangling: level two

We said we like to think of the first level of data wrangling as changes to the data structure itself (what the dimensions, columns, and rows should be). The second level of data wrangling refers to *creating or calculating new variables based on existing columns and values*. 

You might be wondering how these two are different, and the primary difference is that all the changes we made used only the position or location of the data. For example, consider the data arrangement below:

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/03-original-data.png?raw=true)

This data has three months spread across columns and a `category` variable that serves as an index for the values. If we put these data in the long format, it will look like the image below:

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/04-pivot-longer.png?raw=true)

The `tidyr::pivot_longer()` changes the position of the indices and values, but doesn't calculate or create any new information. We can just as quickly move the data back into its original arrangement (see below).

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/05-pivot-wider.png?raw=true)

`unite` and `separate()` also change the position and contents of the information, but they do not calculate or create new values. 

## The `dplyr` package

The primary package for data manipulation at the second level is `dplyr`, and we will explore its functions in the next three steps. 

### Creating new variables

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

As you can see from the code and comments above, first, we enter the data set (`DataFrame`).  Next, we introduce a name for the new variable we want to create (`new variable name`), the equals sign `=`, then the function we want to apply `some_function()` and the original variable we want to apply it to `old variable name`.

Let's import a new version of `BobRoss` for this step. 

```
BobRossStep9 <- readr::read_csv(file = "https://bit.ly/bob-ross-step9")
```{{execute}}

## Changing variable formats

We're going to use the `dplyr::mutate()` function to change the format of a character variable (`<chr>`) to numeric (`<dbl>`). So if we run the code below, it should create `episode_num`, which is a numerical version `episode_txt` (converting `<chr>` to `<dbl>` to numeric).

```
# click to execute code
dplyr::mutate(.data = BobRossStep9, episode_num = as.numeric(episode_txt))
```{{execute}}

We can see this creates a new variable, but we still have `episode_txt`. Next, we'll convert the `title` to title case using the `stringr` package (also from the `tidyverse`), and we'll overwrite the existing variable by naming the new variable `title` as well. 

```
dplyr::mutate(.data = BobRossStep9, 
              # first new variable 
              episode_num = base::as.numeric(episode_txt),
              # second new variable 
              title = stringr::str_to_title(title))
```{{execute}}

The great thing about `dplyr::mutate()` and other `tidyverse` functions is that we can view our work before assigning anything to a dataset. **It's always a good idea to check your data wrangling before assigning it back to the data frame.** 

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

Now that we can see the variables are formatted how we want, we can assign the changes to the `BobRossStep9` object. 

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




