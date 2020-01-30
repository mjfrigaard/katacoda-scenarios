Functions are the verbs in the R language, and any data we load into R is like an object (or noun). The functions in R allow us to manipulate, analyze, visualize, and model any data we've loaded into R.

We'll start by doing a very common task in data wrangling: changing the format of a variable.

### Change the format of a variable

The code below creates the BpData again:

```
# create data
BpData <- tibble::tribble(
  # variable names
  ~name, ~dob, ~wt_kg, ~ht_m, ~bp_d, ~bp_s,
  # data
  "john", "1985-10-13", 100L, "2.1", 80L, 130L,
  "peter", "1979-08-04", 82L, "1.9", 65L, 126L,
  "steve", "1981-04-23", 95L, "1.7", 70L, 119L,
  "sally", "1983-03-28", 72L, "1.5", 75L, 129L,
  "beth", "1986-06-07", 76L, "1.6", 78L, 126L,
  "kate", "1982-08-19", 69L, "1.5", 74L, 121L
)
```{{execute}}

We're going to use the `dplyr::mutate()` function to change the format of the `ht_m` variable from character (`<chr>`) to numeric (`<dbl>`).

Generically speaking, is how `dplyr::mutate()` works:

```
dplyr::mutate(.data = DataFrame, `new variable` = some_function(`old variable`))
```

As you can see from the code above, first we specify the data (`DataFrame`), then the name of the new variable we want to create (`new variable`), the equals sign `=`, then the function we want to apply to the original variable `some_function(`old variable`)`.

If we replace `DataFrame` with ``BpData`, and use `base::as.numeric()` to create If we run the code below, we find check to see if the `ht_m` variable becomes `<dbl>`.

```
dplyr::mutate(.data = BpData, ht_m = base::as.numeric(ht_m))
```{{execute}}






