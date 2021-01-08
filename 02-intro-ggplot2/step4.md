### Using the pipe (cont.)

[`magrittr` package](https://magrittr.tidyverse.org/) has some additional tricks that are worth knowing. For example, in the code above, you may have noticed the `data = .` argument. 

```
Data %>% 
  ggplot2::qplot(data = ., 
                 x = variable_x, 
                 y = variable_y,
                 geom = "shape")
```

The period (`.`) here is a product of the pipe syntax. We use the `.` argument because of where the `data =` argument sits inside the `qplot()` function. See the `args()` by using `args(qplot)`{{execute}}


```
function(x, y, ..., data, 
        # all other optional arguments
        facets = NULL, 
        margins = FALSE, 
        geom = "auto", 
        xlim = c(NA, NA), 
        ylim = c(NA, NA), 
        log = "", 
        main = NULL, 
        xlab = NULL, 
        ylab = NULL, 
        asp = NA, 
        stat = NULL, 
        position = NULL) 
```

We can see the `data` argument comes *after* the `x`, `y`, and any other variable arguments `...`. That means we need to tell the pipe we want the `Data` to be in the named `data = ` argument, so we use `data = .`

So by using the pipe, we can rewrite this function,

```
function(y, named_argument = x)
```

to this:

```
x %>% function(y, named_argument = .)
```
 
By placing the `data = .` on the right-hand side of the pipe operator (`%>%`) in the `named_argument` position, we're telling R to read this statement as, "*the object to the left of the `%>%` belongs in the `data` argument.*" 

See the figure below:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/figs/pipe-data-args.png)

We can demonstrate this in the code section below: 

- First we create a `diamonds` dataset from the `ggplot2` package, 
- Then we 'pipe' the data to `qplot()`  
- Then we include the `ggsave()` function (which allows us to save the graph image as a .png file)  

Click anywhere in the section below to run the code.

```
# data 
diamonds <- ggplot2::diamonds
# graph
diamonds %>% 
  ggplot2::qplot(data = ., 
                 x = carat, y = price, 
                 geom = "point")
# save
ggsave(filename = "gg-step4.png", device = "png", width = 7, height = 5, 
       units = "in")
```{{execute}}


