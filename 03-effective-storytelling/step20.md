### Small multiples

We've been exploring the relationship between the number of votes and average user rating for movies in the IMDB movies dataset. So far, we've looked at each variable's distribution, and we discovered the number of votes has increased over time with a skewed distribution. The average user movie rating distribution has 'flattened' over time, but the location (i.e., the `mean` and `median`), has remained relatively stable.

Recall that we can use `skimr` to check these summary statistics.

#### Number of votes (summary)

Below is the `mean`, standard deviation (`sd`), minimum (`p0`), 25th percentile (`p25`), median (`p50`), 75th percentile (`p75`), maximum (`p100`), and `hist` for the `numVotes`, grouped by `year_cat10`.

```
# click to execute code
ImdbData %>%
  group_by(year_cat10) %>%
  select(year_cat10, numVotes) %>%
  skimr::skim() %>%
  skimr::focus(numeric.mean, numeric.sd,
               numeric.p0, numeric.p50, numeric.p100,
               numeric.hist)
```{{execute}}


#### Average individual user ratings (summary)

Below is the `mean`, standard deviation (`sd`), minimum (`p0`), 25th percentile (`p25`), median (`p50`), 75th percentile (`p75`), maximum (`p100`), and `hist` for the `averageRating`, grouped by `year_cat10`.

```
# click to execute code
ImdbData %>%
  group_by(year_cat10) %>%
  select(year_cat10, averageRating) %>%
  skimr::skim() %>%
  skimr::focus(numeric.mean, numeric.sd,
               numeric.p0, numeric.p50, numeric.p100,
               numeric.hist)
```{{execute}}

How do you think the relationship between `numVotes` and `averageRating` will look?

### Votes vs. user rating

Below we create labels and build a scatter plot with the two numeric variables (`numVotes` and `averageRating`)

```
# click to execute code

#   build labels
labs_avgusr_nmvote <- labs(
  title = "Number of Votes vs average individual user ratings",
  subtitle = "Internet Movie Database (IMDB)",
  caption = "https://www.imdb.com/",
  x = "Number of votes",
  y = "Average individual user ratings")

#   build graph
gg_step20_scatter_01 <- ImdbData %>%
  ggplot(aes(x = numVotes,
             y = averageRating)) +
  geom_point(size = 1.2,
              alpha = 1/5,
              show.legend = FALSE) +
  labs_avgusr_nmvote

# save
ggsave(plot = gg_step20_scatter_01,
        filename = "gg-step20-scatter-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step20-scatter-01.png` graph in the vscode IDE (above the Terminal console).

The scatter plot shows a majority of the points concentrated at the lower end of `numVotes` and the mean/median of `averageRating`. However, these points extend out diagonally to a few cases with high values for both the `averageRating` *and* `numVotes`. This pattern indicates that more votes are related to higher average user ratings for some movies.

### log10(Votes) vs. user rating

Below we're going to rebuild the scatterplot between `numVotes` and `averageRating`. Note what we include the log10 transformation information in multiple places, so we don't confuse our audience.

```
# click to execute code

#   build labels
labs_avgusr_lognmvote <- labs(
  title = "Number of Votes vs average individual user ratings",
  subtitle = "Internet Movie Database (https://www.imdb.com/)",
  caption = "Number of votes is has been log10 transformed",
  y = "Average individual user ratings",
  x = "log10(Number of votes)")

#   build plot
gg_step20_scatter_02 <- ImdbData %>%
  ggplot(aes(x = numVotes,
             y = averageRating)) +
  geom_point(size = 1.2,
              alpha = 1/6,
              show.legend = FALSE) +
  # add log10 transformation
    scale_x_log10(labels = label_log10) +
  # add label
  labs_avgusr_lognmvote

# save
ggsave(plot = gg_step20_scatter_02,
        filename = "gg-step20-scatter-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step20-scatter-02.png` graph in the vscode IDE (above the Terminal console).

We can see the log10 transformation of the `numVotes` has shifted the points across the new `x` axis scale. The distributions' shape shows us a trend similar to the scatterplot above but reduces the over-plotting.

### Facetting for multiple comparisons

We want to make direct comparisons across time by placing an individual plot for each decade within the same view. The best way to accomplish this is by using small multiples, where we repeat the same graph for each snapshot of time and present them in a grid.

The functions for creating small multiples in `ggplot2` are `facet_wrap()` or `facet_grid()`. We will demonstrate this below using the former, and we also make some adjustments to the `x` axis to make it easier to read:

inside the `ggplot2::scale_x_continuous()` function:

+ set `limits` to `10` (the minimum) and `2334927` (the maximum)  
+ the `breaks` argument specifies how we want to 'break up' our `x` axis. We will use the minimum, `1167464` (which is 0.5 x the maximum), and the maximum  
+ `labels` what text do we want to display at each `break`?

The `ggplot2::facet_wrap()` function uses a `~` followed by the categorical variable (`year_cat10`) we've specified in the `ggplot(aes(group = ))` argument.

Now we can build our labels and small multiples graph.

```
# click to execute code

#   build labels
labs_avgusr_nmvote_yearcat10 <- labs(
  title = "Number of votes vs average individual user ratings over time",
  subtitle = "Internet Movie Database (IMDB)",
  caption = "https://www.imdb.com",
  y = "Average individual user ratings",
  x = "Number of votes")


gg_step20_facet_01 <- ImdbData %>%
  ggplot(aes(x = numVotes,
             y = averageRating,
             group = year_cat10)) +
  geom_point(size = 0.5,
              alpha = 1/10,
              show.legend = FALSE) +
  # add x scale attributes
  scale_x_continuous(limits = c(10, 2334927),
                     breaks = c(10, 1167464, 2334927),
                     labels = c('10', '~1.2M', '~2.3M')) +
  # add facet
    facet_wrap(~ year_cat10) +
  labs_avgusr_nmvote_yearcat10

# save
ggsave(plot = gg_step20_facet_01,
        filename = "gg-step20-facet-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step20-facet-01.png` graph in the vscode IDE (above the Terminal console).

We can see how small multiples allow for more incisive comparisons. The relationship between votes and average user rating becomes slightly evident as time progresses. A few data points approach the `8.75` line in 1960 and 1970, and there appears to be a slight upward trend for average user rating from 1990-2020.

Now we will use small multiples on the log10 transformed `numVotes` variable, which means we need to update our labels, add the `scale_x_log10()` layer, and use  `facet_wrap()` with `year_cat10`.

```
# click to execute code

#   build labels
labs_avgusr_lognmvote_yearcat10 <- labs(
  title = "*Number of votes vs average individual user ratings over time",
  subtitle = "Internet Movie Database (https://www.imdb.com/)",
  caption = "*Number of votes is has been log10 transformed",
  y = "Average individual user ratings",
  x = "log10(Number of votes)")

gg_step20_facet_02 <- ImdbData %>%
  ggplot(aes(x = numVotes,
             y = averageRating,
             group = year_cat10)) +
  geom_point(size = 0.5,
             alpha = 1/10,
             show.legend = FALSE) +
  # add log10 x axis
    scale_x_log10(labels = label_log10) +
  # facet wrap on decades
    facet_wrap(~ year_cat10) +
  # add labels
  labs_avgusr_lognmvote_yearcat10

# save
ggsave(plot = gg_step20_facet_02,
        filename = "gg-step20-facet-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step20-facet-02.png` graph in the vscode IDE (above the Terminal console).

Now the small multiples show the relationship between the log10 transformed number of votes and average user rating. The majority of the data points appear concentrated around the same value for average user rating (~`6.125`).

### Adding the best fit line (`geom_smooth`)

We can use `ggplot2`'s `geom_smooth()` function to draw a smoothed 'best-fit line' through the data points in each decade. Modeling is beyond the scope of this scenario, but feel free to read more about building models in this chapter of [R for Data Science](https://r4ds.had.co.nz/model-intro.html).

For now, know the following:

+ `method = 'lm'` tells geom_smooth to fit the best straight line through the data points  
+ `size = 0.75` is the size of the line  
+ `color = "firebrick2"` will make the line color red  
+ `fullrange = TRUE` will draw the line through the entire range of the graph  

```
# click to execute code

#   build labels
labs_avgusr_lognmvote_yearcat10_lm <- labs(
  title = "*Number of votes vs average individual user ratings over time",
  subtitle = "Internet Movie Database (https://www.imdb.com/)",
  caption = "*Number of votes is has been log10 transformed; lm smooth line",
  y = "Average individual user ratings",
  x = "log10(Number of votes)")

gg_step20_facet_03 <- ImdbData %>%
  ggplot(aes(x = numVotes,
             y = averageRating,
             geoup = year_cat10)) +
  geom_point(size = 0.5,
              alpha = 1/10,
              show.legend = FALSE) +
  # add smoothed line
  geom_smooth(method = 'lm',
              size = 0.75,
              color = "firebrick2",
              fullrange = TRUE) +
  # add x axis attributes
    scale_x_log10(labels = label_log10) +
  # add facets
    facet_wrap(~ year_cat10)

# save
ggsave(plot = gg_step20_facet_03,
       filename = "gg-step20-facet-03.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step20-facet-03.png` graph in the vscode IDE (above the Terminal console). We can see the relationship for the log10 transformed number of votes vs. average user rating is slightly positive but has become less pronounced over time. The gray band is the standard error associated with the red smoothed line we've drawn (fewer data points = more error).
