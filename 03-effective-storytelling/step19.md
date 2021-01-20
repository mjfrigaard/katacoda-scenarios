### Average individual user ratings

The `averageRating` gives us the *weighted average of all the individual user ratings*. We will refresh our memory about this variable by taking a quick look at the `skimr::skim()` output below: 

```
ImdbData$averageRating %>% 
  skimr::skim()
```{{execute}}

The distribution for `averageRating` looks evenly distributed around the mean and median, and the `hist` looks relatively symmetrical. We will see if this holds for `averageRating` when we look at it across the levels of `year_cat10`.

We now know enough about what we're expecting to see in the graph to build the labels for the average individual user ratings (`averageRating`) vs. time (`year_cat10`).

```
labs_avgratng_yearcat10 <- labs(
  title = "Average IMDB individual user ratings by decade", 
  subtitle = "Internet Movie Database (IMDB)",
  caption = "https://www.imdb.com/", 
  x = "Decade", 
  y = "Average individual user ratings")
```{{execute}}

### Violin plots with `geom_violin`

We're going to view the distribution of `averageRating` using the `ggplot2::geom_violin()` function. This function takes the following arguments: 

+ map `year_cat10` to `fill` *inside* the initial `ggplot(aes())` functions  
+ set `show.legend = FALSE` inside the `geom_violin()` function  

```
# # click to execute code
gg_step19_violin_01 <- ImdbData %>%
  ggplot(aes(x = year_cat10,
             y = averageRating,
             fill = year_cat10)) +
  geom_violin(show.legend = FALSE) + 
  # add labels
  labs_avgratng_yearcat10
# save
 ggsave(plot = gg_step19_violin_01,
        filename = "gg-step19-violin-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step19-violin-01.png` graph in the vscode IDE (above the Terminal console). 

We can see the violin plot shows us the `averageRating` variable as a smoothed colored area, with tails extending out to the ends of the distribution (towards the violin's 'neck'). The colored areas' width in the graph shows us that the distribution (or spread) for `averageRating` has increased over time.

The next section will examine how the `numVotes` and `averageRating` relate to each other over time. 
