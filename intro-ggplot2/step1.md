# Create your first graph


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
