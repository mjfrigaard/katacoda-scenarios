# Transforming Axes

We will use small multiples again, but this time we will view a log10 transformed `numVotes` variable. Transforming an axis can sometimes make the display easier to see, but we also need to find a way to explain this change to our audience.

We will need to update our labels, add the `scale_x_log10()` layer, and use `facet_wrap()` with `year_cat10`. We will also use the handy [`label_log10` function](https://bit.ly/35Ywt2q) developed by [Claus Wilke](https://wilkelab.org/):

```
# click to execute code

# build labels
labs_avgusr_lognmvote_yearcat10 <- labs(
  title = "*Number of votes vs average individual user ratings over time",
  subtitle = "Internet Movie Database (https://www.imdb.com/)",
  caption = "*Number of votes is has been log10 transformed",
  y = "Average individual user ratings",
  x = "log10(Number of votes)")

# load label_log10 function
source("https://bit.ly/35Ywt2q")

# build plot
gg_step5_facet_02 <- ImdbData %>%
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
ggsave(plot = gg_step5_facet_02,
        filename = "gg-step5-facet-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open _gg-step5-facet-02.png_ in the VS Code IDE above the Terminal console to view the graph.

Now the small multiples show the relationship between the log10 transformed number of votes and average user rating. The majority of the data points appear concentrated around the same value for average user rating (~6.125).

## Adding A Best Fit Line

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

gg_step5_facet_03 <- ImdbData %>%
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
ggsave(plot = gg_step5_facet_03,
       filename = "gg-step5-facet-03.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open _gg-step5-facet-03.png_ in the VS Code IDE above the Terminal console to view the graph.

We can see the relationship for the log10 transformed number of votes versus average user rating is slightly positive but has become less pronounced over time. The gray band is the standard error associated with the red smoothed line we've drawn (fewer data points = more error).
