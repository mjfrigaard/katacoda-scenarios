# Two levels of data wrangling 

We like to think of wrangling on two different levels. The first level deals with the data shape and structure. The second level of data wrangling refers to the format of individual variables (which we will get to in the following steps). 

Questions we should be asking ourselves about data at this level include:

1. Approximately how many rows (or observations) and columns (or variables) should we be seeing?  
2. Are all the rows unique (i.e.will each case have a row)?    
3. Does each measurement have a column (or variable)?   
4. Are these variables each measuring exactly one thing?   
3. Should we expect missing or incomplete data, and if so, why/how are they missing?   

## Reshaping data

A common task for data manipulation is moving columns to rows, or rows to columns. The `tidyr` package in R makes this easy with two `tidyr::pivot_` functions. 

## Viewing the dataset

`glimpse()` is a convenient function for examining the structure and shape of a dataset. Other options include `utils::str()` and `utils::head()`. 

```
head(BobRoss)
```{{execute}}

We can now answer two of the questions above: 

1. Approximately how many rows (or observations) and columns (or variables) should we be seeing? 403 rows, 71 columns
3. Does each measurement have a column (or variable)? *do they?*

## Pivoting part 1 (reorganizing values in a dataset) 

As we can see in the Terminal, the `BobRoss` dataset is full of the variables named for the various objects in his paintings. From `apple_frame` down to `wood_framed`, the objects have what appears to be `0`s and `1`s for values. These are called indicators, or [*binary variables*](https://en.wikipedia.org/wiki/Binary_data#Binary_variables). 

## Moving columns to rows 

The columns in `BobRoss` represent various objects in Bob Ross's paintings, and the values in the rows are whether or not the object was present or absent in a particular episode. 

We can see this by using the `utils::head()` function, which shows us the top six rows in the dataset.

```
head(BobRoss)
```{{execute}}

An image of this data arrangement is below:

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/01-orig-bob-ross.png?raw=true)

Can you think of another way to organize the same information? What if we changed the original data from having a column for each different painting object to a format with only two columns: the name of the painting `object`, and whether or not it was `present`. Take a look at the data format below: 

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/02-long-bob-ross.png?raw=true)

- the `object` column keeps track of the *thing* in the painting (`apple_frame`, `aurora_borealis`, `barn`, etc.), 
- the `present` column corresponds to the *number of times* that particular thing occurred,  
- the `season`, `episode`, `episode_num`, and `title` information repeats down the rows for every object that was originally in a column  


Data arrangements like this are typically called long or tidy, but the vital thing to know is that each value has an index in two places (in this case `object` and `present`). We can convert `BobRoss` into a long dataset using `tidyr::pivot_longer()`.

The `tidyr::pivot_longer()` function takes the following arguments: 

1. A data set (`BobRoss`), 
2. The columns we want indexed (the `c(apple_frame:wood_framed)` is shorthand for `apple_frame` through `wood_framed`),  
3. What we want the indexed names to be (`names_to = 'object'`),  
4. What we want the indexed values to be (`values_to = 'present'`)  


Click on the checkmark to run the code and see the result.

```
BobRossLong <- pivot_longer(data = BobRoss, 
                      cols = c(apple_frame:wood_framed), 
                      names_to = 'object', 
                      values_to = 'present')
# view data 
head(BobRossLong)
```{{execute}}
