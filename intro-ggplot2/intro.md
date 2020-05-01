# Introduction to `ggplot2`

This introduction will cover how to create beautiful graphs with R's `ggplot2`, a package built with Leland Wilkinson's [The Grammar of Graphics](https://www.amazon.com/Grammar-Graphics-Statistics-Computing/dp/0387245448).

Launch an R console by clicking here -> `R`{{execute}} (Click on the *Run command* icon)

Load the `tidyverse` package below. 

```
install.packages("tidyverse")
library(tidyverse)
```{{execute}}

Load some data.

```
diamonds <- ggplot2::diamonds
```{{execute}}


Create a graph.

```
ggplot2::qplot(x = carat, y = price, data = diamonds)
```{{execute}}
