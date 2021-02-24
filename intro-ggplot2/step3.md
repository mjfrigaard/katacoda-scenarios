### the pipe `%>%`

A major reason for using the `tidyverse` is the pipe operator from the [`magrittr` package](https://magrittr.tidyverse.org/). 

The pipe (`%>%`) is what's referred to as syntactic sugar (yes, that's [really a term](https://en.wikipedia.org/wiki/Syntactic_sugar)) because it's,

"*syntax within a programming language that is designed to make things easier to read or to express*" 

Assume the same dataset `Data`, and two variables `variable_x` and `variable_y`. If we wanted to use the pipe with the `ggplot2::qplot()` function, it would look like the code below:

```
Data %>% ggplot2::qplot(data = ., x = variable_x, y = variable_y, geom = "shape")
```

#### How the pipe works

Writing R code this way makes it easier to combine function calls, and it's easier for to read. For example, if we had to wrangle our data before creating a graph (which we almost always do), we wouldn't want to read the functions inside out: 

```r
# instead of this...
function_02(function_01(x), y) 

# we see this
x %>% function_01() %>% function_02(y) 
```
