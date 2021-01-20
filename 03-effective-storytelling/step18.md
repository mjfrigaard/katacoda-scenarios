### Number of votes 

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

### Scatterplots with `geom_jitter`

We're going to view the distribution of `numVotes` across each decade in `year_cat10` with `ggplot2::geom_jitter()`. `geom_jitter()` geom is similar to `geom_point()`, except it adds "*a small amount of random variation to the location of each point*." We will set the following arguments inside the `geom_jitter()` to help demonstrate how it works. 

+ `size = 0.9` = this controls how small/large the point will be   
+ `width = 0.25` = determines how wide we want the points to 'jitter' (the default value is `.40`, so we're decreasing it slightly)  
+ `alpha = 1/6` = the alpha controls the saturation (or transparency) of the points  
+ `show.legend = FALSE` = remove the legend (it's labeled across the `x` axis)

```
# # click to execute code
gg_step18_jitter_01 <- ImdbData %>%
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
ggsave(plot = gg_step18_jitter_01,
        filename = "gg-step18-jitter-01.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step18-jitter-01.png` graph in the vscode IDE (above the Terminal console). Notice how there are a handful of extreme points above `15000000`? 

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

gg_step18_jitter_02 <- ImdbData %>% 
  filter(numVotes < 1500000) %>% 
  ggplot(aes(x = year_cat10, 
             y = numVotes)) + 
  geom_jitter(size = 0.9, 
              width = 0.25,
              alpha = 1/6, 
              show.legend = FALSE) + 
  labs_jitter_numvote_yearcat10_02
# save
ggsave(plot = gg_step18_jitter_02,
        filename = "gg-step18-jitter-02.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step18-jitter-02.png` graph in the vscode IDE (above the Terminal console). Now the extreme points above `15000000` have been removed. 

Another option is to transform the axis, which we can do with `ggplot2::scale_y_log10()`. This function changes the `y` axis scale using a base-10 log transformation.

We will also use the handy [`label_log10` function](https://bit.ly/35Ywt2q) developed by [Claus Wilke](https://wilkelab.org/)

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
gg_step18_jitter_03 <- ImdbData %>% 
  ggplot(aes(x = year_cat10, 
             y = numVotes)) + 
  geom_jitter(size = 0.9, 
              width = 0.25,
              alpha = 1/6, 
              show.legend = FALSE) + 
    scale_y_log10(labels = label_log10) + 
  labs_jitter_numvote_yearcat10_03
#   save
ggsave(plot = gg_step18_jitter_03,
        filename = "gg-step18-jitter-03.png",
        device = "png",
        width = 9,
        height = 6,
        units = "in")
```{{execute}}

Open the `gg-step18-jitter-03.png` graph in the vscode IDE (above the Terminal console). We can see the `scale_y_log10()` transformation spreads the points out more uniformly across the `y` axis and makes it more challenging to interpret the number of votes. 

Regardless of choice (removal of the extreme values or transforming the scale), we want to communicate these changes to our stakeholders. We also want to include them in any reports or write-ups to give them a distorted view of the underlying variable.

Read more about transforming a scale in [R for Data Science](https://r4ds.had.co.nz/graphics-for-communication.html?q=log10#replacing-a-scale).

