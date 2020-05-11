## Using the pipe cont.

[`magrittr` package](https://magrittr.tidyverse.org/) has some additional tricks that are worth knowing. For example, in the code above, you may have noticed the `data = .` argument. 

```
Data %>% 
  ggplot2::qplot(data = ., 
                 x = variable_x, 
                 y = variable_y,
                 geom = "shape")
```

The period (`.`) here is a product of the pipe syntax. We use the `.` argument because of where the `data =` argument sits inside the `qplot()` function. See the `args()` 

```
function(x, y, ..., data, facets = NULL, margins = FALSE, geom = "auto", 
    xlim = c(NA, NA), ylim = c(NA, NA), log = "", main = NULL, 
    xlab = NULL, ylab = NULL, asp = NA, stat = NULL, position = NULL) 
```

We can see the `data` argument comes *after* the `x`, `y`, and any other variable arguments `...`. We need to tell the pipe we want the `Data` to be in the named `data = ` argument, so we use `data = .`

This makes this: 

```
function(y, named_argument = x)
```

the same thing as this

```
x %>% function(y, named_argument = .)
```
 
By placing the `data = .` on the right-hand side of the pipe operator (`%>%`) in the named argument position, we are telling R to read this statement as, "*the object to the left of the `%>%` belongs in the `data` argument.*" 


See the figure below:

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/pipe-data-args.png?raw=true)
