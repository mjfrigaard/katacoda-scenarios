### Summary of Votes by Year Categories

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

### Summary of Average Individual User Ratings by Year Categories 

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

### Facetting for Multiple Comparisons

We want to make direct comparisons across time by placing an individual plot for each decade within the same view. The best way to accomplish this is by using small multiples, where we repeat the same graph for each snapshot of time and present them in a grid.

The functions for creating small multiples in `ggplot2` are `facet_wrap()` or `facet_grid()`. We will demonstrate this below using the former, and we also make some adjustments to the `x` axis to make it easier to read:

Inside the `ggplot2::scale_x_continuous()` function:

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


gg_step4_facet_01 <- ImdbData %>%
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
ggsave(plot = gg_step4_facet_01,
        filename = "gg-step4-facet-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Click here to open the graph `gg-step4-facet-01.png`{{open}}

We can see how small multiples allow for more incisive comparisons. The relationship between votes and average user rating becomes slightly evident as time progresses. A few data points approach the `8.75` line in 1960 and 1970, and there appears to be a slight upward trend for average user rating from 1990-2020.
