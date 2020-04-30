# Combine `case_when` and `pivot`

After creating new variables, it's always a good idea to check your work. Now that we have some tools for creating new variables, we can use the `tidyr::pivot_` functions to check and make sure all the rows were properly assigned. 

## Small Bob Ross

We'll import a small version of the `bob_ross` dataset to demonstrate how we can combine both levels of data wrangling to create new variables and check our work. 

```
BobRossStep12 <- readr::read_csv(file = "https://bit.ly/bob-ross-step12")
head(BobRossStep12)
```{{execute}}

## View the data 

Use `utils::head()`, `dplyr::glimpse()`, or `utils::str()` to view the contents of `BobRossStep12`.

### Create long (tidy) dataset

First create a long version of `BobRossStep12` using `tidyr::pivot_longer()`. We've provided some code to get you started (assign the names to `'object'` and assign the values to `'present'`.

```
BobRossStep12 <- pivot_longer(data = BobRossStep12, cols = c(apple_frame:wood_framed), names_to = "_______",  values_to = "_______")
```{{copy}}

Now that we have a long dataset, let's create a new variable that creates three categories for the paintings. 



