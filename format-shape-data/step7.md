# Splitting columns into new columns

Sometimes data are not as granular as we would like them to be, so we need to break up bits of information into individual columns.

For example, the `episode` column contains information on the season and number from `season` and `episode_num`. But what if these two columns were missing? We could recreate them using `tidyr::separate()`. 

## Separating columns 

We will load an alternative version of `BobRossLong` into the R environment for this step. Please click on the *Run command* icon below to load `BobRossEpi` into R. 

```
BobRossEpi <- readr::read_csv(file = "https://bit.ly/bobross-episodes")
glimpse(BobRossEpi)
```{{execute}} 

As we can see, `BobRossEpi` has an `episode` variable with both season and episode information separated by a comma and a space (`"S01, E01"` and `"S01, E01",`, etc.). We want to use `tidyr::separate()` to split this column into `season` and `episode` using the following arguments. 

1. `data` = the name of the dataset (`BobRossEpi`)  
2. `col` = the name of the column to separate (`episode`),  
3. `into` = the new columns for the separated information (combine these with `c("season", "episode")`) 

Copy the code below and fill in the `into` section before pasting it back into the terminal and running it. 

```
tidyr::separate(data = BobRossEpi, col = episode, into = c("______", "_______"))
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

As we can see, season and episode contain the same information as the `episode
