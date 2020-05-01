# Pivoting part 2 (re-reorganizing values in a dataset) 

Now that we have two datasets in the R environment, we can compare their structures with `dim()` (short for data `dim`ensions).

```
# click to execute code
dim(BobRoss)
```{{execute}}

*This is telling us there are `403` rows and `71` columns in `BobRoss`...*

```
# click to execute code
dim(BobRossLong)
```{{execute}}

*...vs. `27001` rows and `6` columns in `BobRossLong`!*

As we can see, the `BobRossLong` has a ton more rows, but far fewer columns. 

But what if we want to keep the dataset in it's original 'wide' format? The `tidyr::pivot_wider()` is the complement to `tidyr::pivot_longer()`, and it takes the following arguments: 

1. A data set (`BobRossLong`), 
2. Where the indexed names are stored (`names_from = object`),  
3. What variable holds the indexed values  (`values_from = present`) 

```
# click to execute code
BobRossWide <- pivot_wider(data = BobRossLong, 
                      names_from = object, 
                      values_from = present)
head(BobRossWide)
```{{execute}}

Does the `BobRossWide` dataset have the same information as the original `BobRoss` dataset? We can check with `dplyr::setdiff()` which will test for differences in the two tibbles: 

```
# click to copy code
dplyr::setdiff(x = BobRoss, y = BobRossWide)
```{{copy}}

Notice this returned an empty tibble? That means `BobRoss` and `BobRossWide` are identical (i.e. no set differences).

## Long or wide?

We've just shown two formats with the same information in them. You might be wondering which is better, and the answer is *it depends.* R prefers datasets formatted as long, but there are other reasons you might want to store (or collect) data in the wide format.

Fortunately, now you don't have to choose because you can easily change whatever arrangement the data are in!
