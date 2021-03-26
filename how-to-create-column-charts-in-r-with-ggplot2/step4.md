# Counting Top 10 Birth Countries

Column charts are great for representing counts, but first we need to know what numbers we're counting. In this example, we're interested in the 10 most common non-US birth countries for players in the `People` dataset.

The following code uses `dplyr::filter()` to find the non-US country of birth. We then use `dplyr::count()` to tally the countries, and `utils::head()` to only return the top 10.

We also use `dplyr::mutate()` with `forcats::fct_inorder()` to change the format of the `birthCountry` variable to a factor:

```
# click to execute code
People %>%
  filter(birthCountry != "USA" & !is.na(birthCountry)) %>%
  count(birthCountry, sort = TRUE) %>%
  head(10) %>%
  mutate(birthCountry = fct_inorder(birthCountry))
```{{execute}}


If we're going to build a column graph from this data, we know we'll need a way to represent both the country's name and the number of times it occurs. In this case, we have two variables in this output: `birthCountry` and `n`.

Now we have an idea of the numbers we want to include in our visualization, so we're ready to create our graph. Building graphs with the `ggplot2` syntax can be expressed in the following template:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/how-to-create-bar-charts-in-r-with-ggplot2/img/ggplot2-template.png)

If you need a refresher on `ggplot2` layers and mapping, check out the ["Build Beautiful, Customized Graphs and Charts in R with ggplot2" scenario](https://learning.oreilly.com/scenarios/-/9781492079071).
