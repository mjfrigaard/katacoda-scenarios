
# Pivoting part 1 (reorganizing values in a dataset) 

As we can see in the Terminal, the `BobRoss` dataset is full of the variables named for the various objects in his paintings. From `apple_frame` down to `wood_framed`, the objects have what appears to be `0`s and `1`s for values. These are called indicators, or [*binary variables*](https://en.wikipedia.org/wiki/Binary_data#Binary_variables). 

### Counting

We can get an idea for how many `0`s and `1`s using `dplyr::count()`. We will count the number of `bushes` that show up in the Bob Ross paintings dataset below. 

```
count(BobRoss, bushes)
```{{copy}}

### Moving columns to rows 

The columns in `BobRoss` represent various objects in Bob Ross's paintings, and the values in the rows are whether or not the object was present or absent in a particular episode. 

We can see this by using the `utils::head()` function, which shows us the top six rows in the dataset.

```
head(BobRoss)
```{{execute}}

An image of this data arrangement is below:

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/01-orig-bob-ross.png?raw=true)

Can you think of another way to organize the same information? What if we changed the original data from having a column for each different painting object to a format with only two columns: the name of the painting `object`, and whether or not it was `present`. 

The `object` columns would keep track of the *thing* in the painting (`apple_frame`, `aurora_borealis`, `barn`, etc.), and the `present` column would correspond to the *number of times* that particular thing occurred. To do this, we'd also have to repeat the `season`, `episode`, `episode_num`, and `title` information down the columns for every object that was originally in a column. The data would look like the image below:

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/02-long-bob-ross.png?raw=true)

Data arrangements like this are typically called long or tidy, but the vital thing to know is that each value has an index in two places (in this case `object` and `present`).

The `tidyr::pivot_longer()` function takes the following arguments: 

1. A data set (`BobRoss`), 
2. The columns we want indexed (the `c(apple_frame:wood_framed)` is shorthand for `apple_frame` through `wood_framed`),  
3. What we want the indexed names to be (`names_to = 'object'`),  
4. What we want the indexed values to be (`values_to = 'present'`)  


Click on the checkmark to run the code and see the result.

```
BobRossLong <- tidyr::pivot_longer(data = BobRoss, 
                      cols = c(apple_frame:wood_framed), 
                      names_to = 'object', 
                      values_to = 'present')
# view data 
head(BobRossLong)
```{{execute}}
