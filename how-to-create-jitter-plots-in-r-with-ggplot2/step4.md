### Removing Extreme Values 

Data with extreme values like this can be removed or transformed. If we have a reason to exclude these data, we can do `filter` the data to only the range we want in the graph (say `Number of votes < 1500000`), and then include this in the plot. 

Run the code below to see what this would look like:

```
# click to execute code
labs_jitter_numvote_yearcat10_02 <- labs(
  title = "Number of IMDB review votes by decade", 
  subtitle = "Internet Movie Database (IMDB)",
  caption = "*Number of votes < 1500000; https://www.imdb.com", 
  x = "Decade", 
  y = "Number of votes")

gg_step4_jitter_02 <- ImdbData %>% 
  filter(numVotes < 1500000) %>% 
  ggplot(aes(x = year_cat10, 
             y = numVotes)) + 
  geom_jitter(size = 0.9, 
              width = 0.25,
              alpha = 1/6, 
              show.legend = FALSE) + 
  labs_jitter_numvote_yearcat10_02
# save
ggsave(plot = gg_step4_jitter_02,
        filename = "gg-step4-jitter-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Click here to view the new graph: `gg-step4-jitter-02.png`{{open}}

Now the extreme points above `15000000` have been removed. 

