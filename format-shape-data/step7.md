# Splitting Columns Into New Columns

Sometimes data is not as granular as we would like it to be, so we need to break up bits of information into individual columns.

For example, the `episode` column contains information on the season and number from `season` and `episode_num`. But what if these two columns were missing? We could recreate them using `tidyr::separate()`.

## Separating Columns

We will load an alternative version of `BobRossLong` into the R environment for this step.

Click on anywhere in the dark area below to run the following code and load `BobRossStep7` into R:

```
# click to execute code
BobRossStep7 <- readr::read_csv(file = "https://bit.ly/bob-ross-step7")
glimpse(BobRossStep7)
```{{execute}}

As we can see, `BobRossStep7` has an `episode_info` variable with both `season` and `episode` information separated by a comma and space (`"S01, E01"` and `"S01, E01",`, etc.).

Now we want to use `tidyr::separate()` to split the `episode_info` column into `season` and `episode` using the following arguments:

1. `data` = the name of the dataset (`BobRossStep7`)
2. `col` = the name of the column to separate (`episode_info`)
3. `into` = the new columns for the separated information (combine these with `c("season", "episode")`)

Copy the following code and replace `c("______", "_______")` with the two new column names before pasting it back into the Terminal and running it:

```
# click to copy code
separate(data = BobRossStep7, col = episode_info, into = c("______", "_______"))
```{{copy}}

If you've completed this step correctly, you should see the following dataset:

```
# A tibble: 27,001 x 5
   season episode title               object          present
   <chr>  <chr>   <chr>               <chr>             <dbl>
 1 S01    E01     A WALK IN THE WOODS apple_frame           0
 2 S01    E01     A WALK IN THE WOODS aurora_borealis       0
 3 S01    E01     A WALK IN THE WOODS barn                  0
 4 S01    E01     A WALK IN THE WOODS beach                 0
 5 S01    E01     A WALK IN THE WOODS boat                  0
 6 S01    E01     A WALK IN THE WOODS bridge                0
 7 S01    E01     A WALK IN THE WOODS building              0
 8 S01    E01     A WALK IN THE WOODS bushes                1
 9 S01    E01     A WALK IN THE WOODS cabin                 0
10 S01    E01     A WALK IN THE WOODS cactus                0
# … with 26,991 more rows
```

As we can see, `season` and `episode` contain the same information as the previous `episode_info` column.
