### Visualizing a numerical and categorical variable

Box-plots are also great for visualizing continuous variables across the levels of a categorical variable. For example, we have the `Balance` dataset with `value`s of European Union countries budget surplus.

```{r box-plot2}
# the data
Balance %>% ggplot2::qplot(x = value, y = country, data = ., geom = "boxplot") 
```


For more on the statistics displayed in the box-plot, read up on the [`geom_boxplot()` documentation](https://ggplot2.tidyverse.org/reference/geom_boxplot.html). 

Other options for individual variables include the [`geom = "density"`](https://ggplot2.tidyverse.org/reference/geom_density.html) and [`geom = "violin"`](https://ggplot2.tidyverse.org/reference/geom_violin.html).

### Visualizing two continuous variables

What if we want to graph the relationship between two variables? In this step, we'll graph two variables from the `Brexit` dataset. Use the terminal to view this dataset with `dplyr::glimpse()` or `utils::str()`.

When we view the contents of `Brexit`, we can see the `date` column is a character variable (`<chr>`), and the other two variables--`percent_responding_right` and `percent_responding_wrong`--are numeric (`<dbl>`). 

#### Creating date variables

If we want to plot the relationship between `date` and the `percent_responding_right`, we'll first need to change the format of `date` from character to `Date`, which we can do using the [`lubridate` package](https://lubridate.tidyverse.org/) (also from the `tidyverse`). 

Copy the code below and complete the `lubridate::mdy()` function to format the `date` variable as a `Date`. 

```{r change-date-to-date}
# first reformat the date variable as a date
# Brexit <- Brexit %>% mutate(date = lubridate::mdy(____))
Brexit <- Brexit %>% mutate(date = lubridate::mdy(date))
```

Use the `base::is.double()`, `base::class()`, or `base::typeof()` function to figure out if you've formatted the new `date` variable correctly.

```{r check-date-as-date}
base::is.double(Brexit$date)
base::class(Brexit$date)
base::typeof(Brexit$date)
```

After we're sure the `date` variable has been formatted correctly, we want to 'pipe' the formatted data to the `ggplot2::qplot()` function with the new `date` variable on the `x` and the `percent_responding_right` variable on the `y`.

```{r lubridate}
Brexit %>% qplot(x = date, y = percent_responding_right, data = .)
```

The `ggplot2::qplot()` function is smart enough to automatically choose a `geom` depending on what type of variable we assign to the `x` and `y` axes. In this case, the `percent_responding_right` variable is a `<dbl>` (numeric), and we've reformatted the `date` variable into a double before we passed it to the `y` axis.

The `ggplot2::qplot()` function knows to plot the dates on the `y` axes (notice it displays only the `year`) and represent the data with `geom = "points"`.
