# Two levels of data wrangling 

We like to think of wrangling on two different levels. The first level deals with the data shape and structure. The second level of data wrangling refers with the format of the actual variables (which we will get to in the following steps). Questions we should be asking ourselves about data at this level include:

1. Approximately how many observations (or rows) should we be seeing?  
2. Are all the rows unique (i.e.will each case have a row)?    
3. Does each variable have a column?   
4. Are these variables each measuring exactly one thing?   
3. Should I be expecting missing or incomplete data, and if so, why/how are they missing?   

## Reshaping data

A common task for data manipulation is moving columns to rows, or rows to columns. We refer to this as data The `tidyr` package in R makes this easy with the `tidyr::pivot_` functions. We'll be importing and restructuring the Bob Ross dataset.


We will load the data into R using `fivethirtyeight::bob_ross`. First we have to install the package into the R environment, 

```
install.packages("fivethirtyeight")
```{{execute}}

Then we load the library. 

```
library(fivethirtyeight)
```{{execute}}

Now we can assign the `bob_ross` data frame into the `BobRoss` object. 

```
BobRoss <- fivethirtyeight::bob_ross
```{{execute}}

### View a dataset

We can view the `BobRoss` dataset using `dplyr`'s `glimpse()` function, which shows the data in a transposed view (the variables are presented horizontally, which as much data as possible printed to the screen).

```
BobRoss %>% glimpse(78)
```{{copy}}


`dplyr::glimpse()` is a very handy function for examining the structure and shape of a dataset. Other options include `utils::str()` and `utils::head()`. 
