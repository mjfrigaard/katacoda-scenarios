### Adjusting the Bins

Run the code below to see how the distribution looks with 20 `bins`. Note we also include the `color = "white"` argument to ensure we can see each bar separately. 

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

Let's view the graph we just created:

`gg-step4-hist-02.png`{{open}} 

The `stars` values fit into `20` bins better than the default `30` because we can see where values are concentrated (and the high frequency of 5-star ratings).
