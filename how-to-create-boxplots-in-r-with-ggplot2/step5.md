# Contents of a Boxplot

Box plots display many of the numbers we see in the `skimr` output. Click on the following code to create a `skimr` summary of ramen `stars` ratings in `Tray`s:

```
# click to execute code
Ramen %>%
  # filter to most common styles
  filter(style == "Tray") %>%
  # select only stars and style
  select(stars, style) %>%
  # group dataset by style
  group_by(style) %>%
  # skim grouped data
  skimr::skim() %>%
  # focus on select output
  skimr::focus(style,
               numeric.p0, numeric.p25, numeric.p50,
               numeric.p75, numeric.p100, numeric.hist) %>%
  # only return numeric values
  skimr::yank("numeric")
```{{execute}}

We can calculate the interquartile range using `dplyr`:

```
# click to execute code
Ramen %>%
  # filter to most common styles
  filter(style == "Tray") %>%
  # select only stars and style
  select(stars, style) %>%
  # group dataset by style
  group_by(style) %>%
  # summarize IQR
  summarize(
    `Stars/Tray IQR` = IQR(stars, na.rm = TRUE))
```{{execute}}

The figure below shows a boxplot for the distribution of `stars` ratings across the `Tray` level of `style`. We've labeled the summary statistics from the `skimr` output on the graph. The 25th percentile (or `p25`) is the box's first vertical line (or hinge). The 50th percentile (or `p50`) is the median and middle line of the box, and the 75th percentile (`p75`) is the last vertical line in the box (or hinge):

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/how-to-create-boxplots-in-r-with-ggplot2/img/sc-03-boxplot-diagram.png)

We've also labeled the minimum (`p0`) and maximum (`p100`) values and the interquartile range (which is similar to the standard deviation).

## Communication Tip

If your audience is not familiar with boxplots, the figure above is an example of supporting information to include. It explains *how* to read the graph, using an example from the finished chart. However, using complex plots adds mental labor to your audience and can take attention away from the point you're trying to make. Effective communication means always using the most straightforward (or most common) graphs to reveal your findings.
