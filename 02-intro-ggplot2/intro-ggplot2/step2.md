### Install and load the tidyverse

Launch an R console by clicking here -> `R`{{execute}} (Click on the *Run command* icon)

Load the `tidyverse` package by typing or copying and pasting the code below.

```
install.packages("tidyverse")
library(tidyverse)
```{{execute}}

### Terms and definitions: `geoms` and `aes`thetics

A *geom* (or geometric object) is the 'thing' we see on a graph or plot (this includes dots or points, lines, bars, etc.).

*geoms* are combined with aesthetic mappings, which are properties of the 'thing' on the plot or graph (this includes things like color, size, position, and shape).

So every graph or plot has a geom, and that geom will also have some visual properties called aesthetics.

### Starting with quick plots

We will start using `ggplot2` with the `qplot()` function. `qplot()` is short for 'quick plot', and it takes the following arguments: 

```
ggplot2::qplot(data = Data, # assume dataset 'Data'
               x = variable_x, # single column on the x
               y = variable_y, # single column on the y
               geom = "shape") # the 'thing' on the graph
```
