# Combining two columns 

Just like with the two `pivot_` functions, there is an opposite version of `tidyr::separate()` called `tidyr::unite()`. The `unite()` function takes multiple columns and sticks them together into a single new column. 

#### *First a little house cleaning...*

We've accumulated quite a few datasets in our R environment, which can make things seem cluttered. You can check the objects in R using `ls()`. 

```
# click to execute code
ls()
```{{execute}}

Yikes--so many Bob Ross's! We will remove the `BobRoss` and `BobRossStep7` datasets using `rm(BobRoss, BobRossStep7)`.

```
# click to execute code
rm(BobRoss, BobRossStep7)
```{{execute}}

Now check again with `ls()` just to make sure. Remove any additional datasets with `rm()`

#### *...back to `unite()`*

We'll load another alternative version of `BobRossLong` into R and view it with `head()` 

```
# click to execute code
BobRossStep8 <- readr::read_csv(file = "https://bit.ly/bob-ross-step8")
head(BobRossStep8)
```{{execute}}

Now use `tidyr::unite()` with the following arguments:

1. `data` = `BobRossStep8`

2. the columns we want to unite (`season_text` and `episode_text`) 

3. the new column name (`col = episode_new`) 

4. And `sep =`, a regular expression pattern to place between the two columns we're uniting (in this case, it's `E`). 

Fill in the code below to use `unite()`.

```
# click to copy code
unite(data = BobRossStep8, season_text, episode_text, col = '___________', sep = "E")
```{{copy}}

If you've filled in the function correctly, you should see the following data set:

```
# A tibble: 27,001 x 4
   episode_new title               object          present
   <chr>       <chr>               <chr>             <dbl>
 1 S01E01      A WALK IN THE WOODS apple_frame           0
 2 S01E01      A WALK IN THE WOODS aurora_borealis       0
 3 S01E01      A WALK IN THE WOODS barn                  0
 4 S01E01      A WALK IN THE WOODS beach                 0
 5 S01E01      A WALK IN THE WOODS boat                  0
 6 S01E01      A WALK IN THE WOODS bridge                0
 7 S01E01      A WALK IN THE WOODS building              0
 8 S01E01      A WALK IN THE WOODS bushes                1
 9 S01E01      A WALK IN THE WOODS cabin                 0
10 S01E01      A WALK IN THE WOODS cactus                0
# … with 26,991 more rows
```

As we can see, `unite()` placed the `E` between `season_text` and `episode_text`. 

Now we should feel more comfortable answering the last two questions related to this level of data wrangling:

3. Does each measurement have a column (or variable)? *Yes, and if not I can pivot the data into another arrangement* 

4. Are these variables each measuring exactly one thing? *Yes, and if not I can separate/unite columns to capture that one thing* 
