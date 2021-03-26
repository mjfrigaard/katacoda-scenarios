# Adjusting the Bins

Run the following code to see how the distribution looks with 20 `bins`. Note that we also include the `color = "white"` argument to ensure we can see each bar separately:

```
# click to execute code
gg_step4_hist_02 <- Ramen %>%
  ggplot(aes(x = stars)) +
  geom_histogram(bins = 20, color = "white") +
  labs(
       title = "Distribution of ramen stars",
       subtitle = "bins = 20",
       caption = "source: https://www.theramenrater.com/resources-2/the-list/")
# save
ggsave(plot = gg_step4_hist_02,
        filename = "gg-step4-hist-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Let's view the graph we just created.
Open _gg-step4-hist-02.png_ in the VS Code IDE above the Terminal console to view the graph.

The `stars` values fit into `20` bins better than the default `30` because we can see where values are concentrated (and the high frequency of 5-star ratings).
