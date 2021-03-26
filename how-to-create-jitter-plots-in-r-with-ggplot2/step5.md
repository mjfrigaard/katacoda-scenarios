# Axis Transformation

Another option is to transform the axis, which we can do with `ggplot2::scale_y_log10()`. This function changes the `y` axis scale using a base-10 log transformation.

We will also use the handy [`label_log10` function](https://bit.ly/35Ywt2q) developed by [Claus Wilke](https://wilkelab.org/):

```
# click to execute code

#   load label_log10 function
source("https://bit.ly/35Ywt2q")

#  create new labels
labs_jitter_numvote_yearcat10_03 <- labs(
  title = "Number of IMDB review votes by decade",
  subtitle = "Internet Movie Database (IMDB)",
  caption = "*Number of votes log10 transformed; https://www.imdb.com",
  x = "Decade",
  y = "log10(Number of votes)")

#   create new graph
gg_step5_jitter_03 <- ImdbData %>%
  ggplot(aes(x = year_cat10,
             y = numVotes)) +
  geom_jitter(size = 0.9,
              width = 0.25,
              alpha = 1/6,
              show.legend = FALSE) +
    scale_y_log10(labels = label_log10) +
  labs_jitter_numvote_yearcat10_03
#   save
ggsave(plot = gg_step5_jitter_03,
        filename = "gg-step5-jitter-03.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open _gg-step5-jitter-03.png_ in the VS Code IDE above the Terminal console to view the graph.

We can see the `scale_y_log10()` transformation spreads the points out more uniformly across the `y` axis and makes it more challenging to interpret the number of votes.

Regardless of choice (removal of the extreme values or transforming the scale), we want to communicate these changes to our stakeholders. We also want to include them in any reports or write-ups to give them a distorted view of the underlying variable.

Read more about transforming a scale in [R for Data Science](https://r4ds.had.co.nz/graphics-for-communication.html?q=log10#replacing-a-scale).
