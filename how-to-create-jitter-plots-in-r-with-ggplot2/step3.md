### Scatterplots with `geom_jitter`

We want to examine how the `numVotes` variable changed over time (`year_cat10`). We want each decade on the `x` axis and the `numVotes` for each film on the `y`. Let's review the `numVotes` variable below with `skimr::skim()`

```
ImdbData$numVotes %>% skimr::skim()
```{{execute}}

We can see the values for this variable are concentrated, or skewed, towards `0`. However, we know enough information to build our labels.

```
labs_numvotes_yearcat10 <- labs(
  title = "Number of IMDB review votes by decade", 
  subtitle = "Internet Movie Database (IMDB)",
  caption = "https://www.imdb.com/", 
  x = "Decade", 
  y = "Number of votes")
```{{execute}}

We're going to view the distribution of `numVotes` across each decade in `year_cat10` with `ggplot2::geom_jitter()`. `geom_jitter()` geom is similar to `geom_point()`, except it adds "*a small amount of random variation to the location of each point*." We will set the following arguments inside the `geom_jitter()` to help demonstrate how it works. 

+ `size = 0.9` = this controls how small/large the point will be   
+ `width = 0.25` = determines how wide we want the points to 'jitter' (the default value is `.40`, so we're decreasing it slightly)  
+ `alpha = 1/6` = the alpha controls the saturation (or transparency) of the points  
+ `show.legend = FALSE` = remove the legend (it's labeled across the `x` axis)

```
# # click to execute code
gg_step3_jitter_01 <- ImdbData %>%
  ggplot(aes(x = year_cat10,
             y = numVotes,
             fill = year_cat10)) +
  geom_jitter(size = 0.9, 
            width = 0.25,
            alpha = 1/6, 
            show.legend = FALSE) + 
  guides(fill = FALSE) +
  # add labels
  labs_numvotes_yearcat10
# save
ggsave(plot = gg_step3_jitter_01,
        filename = "gg-step3-jitter-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Click here to view the new graph: `gg-step3-jitter-01.png`{{open}} 

Notice how there are a handful of extreme points above `15000000`? 
