# Updating Labels

We are going to supply the `subtitle_dens_stars` label object to the `labs(subtitle = )` function. Creating labels this way ensures they are updated whenever the underlying data changes:

```
# click to execute code
gg_step5_density_02 <- Ramen %>%
  ggplot(aes(x = stars)) +
  geom_density(fill = "dodgerblue") +
  labs(title = "Distribution of ramen stars",
       # combine text with mean() and sd() for stars in Ramen
       subtitle = subtitle_dens_stars,
       # include source
       caption = "source: https://www.theramenrater.com/resources-2/the-list/")
# save
ggsave(plot = gg_step5_density_02,
        filename = "gg-step5-density-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open _gg-step5-density-02.png_ in the VS Code IDE above the Terminal console to view the graph.

An essential part of effective communication is *knowing your audience*. It's unlikely these exploratory graphs will be part of our final deliverable, so the audience for these graphs will likely be us! Using descriptive labels makes sure we know what we're seeing when we're viewing our graphs.
