## Pivoting (reorganizing values in a dataset) 

As we can see in the Terminal, the `BobRoss` dataset is full of the variables named for the various objects in his paintings. From `apple_frame` all the way down to `wood_framed`, the objects are listed with what appears to be `0`s and `1`s for values. These are called indicators, or [*binary variables*](https://en.wikipedia.org/wiki/Binary_data#Binary_variables). 

### Counting

We can get an idea for how many `0`s and `1`s using `dplyr::count()`. We will count the number of `bushes` that show up in the Bob Ross paintings dataset below. 

```
count(BobRoss, bushes)
```{{copy}}

### Moving columns to rows 

We want to create a dataset with two columns: one for keeping track of the object in the painting, and another corresponding to the number of times that particular object occurred. Data arrangements like this are typically called long or tidy, but the important thing to know is that each value is indexed in two places (in this case `object` and `present`).

The `tidyr::pivot_longer()` function takes the following arguments: 

1. A data set (`BobRoss`), 
2. The columns we want indexed (the `c(apple_frame:wood_framed)` is shorthand for `apple_frame` through `wood_framed`),  
3. What we want the indexed names to be (`names_to = 'object'`),  
4. What we want the indexed values to be (`values_to = 'present'`)  


Click on the check mark to run the code and see the result.

```
BobRossLong <- tidyr::pivot_longer(data = BobRoss, 
                      cols = c(apple_frame:wood_framed), 
                      names_to = 'object', 
                      values_to = 'present')
# view data 
dplyr::glimpse(BobRossLong)
```{{execute}}


