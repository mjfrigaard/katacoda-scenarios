### Single variable distributions (2)

The previous step demonstrated how to use a histogram to view the distribution of a single variable. We needed to adjust the `bins` in the histogram to make its shape easier to interpret. Density plots use [kernel smoothing](https://ggplot2-book.org/statistical-summaries.html) to create cleaner distributions. 


### Build a density plot

We're going to use `ggplot2::geom_density()` to view a density plot of the `stars` variable in `Ramen`. We will use `fill` to color the area underneath the density line with `"dodgerblue"`.

```
# click to execute code
gg_step6_density_01 <- Ramen %>% 
  ggplot(aes(x = stars)) + 
  geom_density(fill = "dodgerblue") + 
  labs(title = "Distribution of ramen stars", 
  caption = "source: https://www.theramenrater.com/resources-2/the-list/")
# save
ggsave(plot = gg_step6_density_01,
       filename = "gg-step6-density-01.png",
       device = "png",
       width = 9,
       height = 6,
       units = "in")
```{{execute}}

Open the `gg-step6-density-01.png` graph in the vscode IDE (above the Terminal console). 

### Adding useful labels 

Although density plots create a much smoother distribution, the `y` axis is harder to interpret. To overcome this, we will add two summary statistics programmatically to the labels using the `base::paste0()` and `base::round()` functions. 

Run the code below to see how this works: 

```
# click to execute code
subtitle_dens_stars <- paste0("Star rating (mean +/- sd): ", 
       # use round() to make sure there are only two decimals
       round(mean(Ramen$stars, na.rm = TRUE), 2),
       " +/- ",
       round(sd(Ramen$stars, na.rm = TRUE), 2))
subtitle_dens_stars
```{{execute}}

We can now supply `subtitle_dens_stars` to the `labs(subtitle = )` function. 

Creating labels this way ensures they are updated whenever the underlying data change.  

```
# click to execute code
gg_step6_density_02 <- Ramen %>% 
  ggplot(aes(x = stars)) + 
  geom_density(fill = "dodgerblue") + 
  labs(title = "Distribution of ramen stars", 
    # combine text with mean() and sd() for stars in Ramen
    subtitle = subtitle_dens_stars,
    # include source
    caption = "source: https://www.theramenrater.com/resources-2/the-list/")
# save
ggsave(plot = gg_step6_density_02,
       filename = "gg-step6-density-02.png",
       device = "png",
       width = 9,
       height = 6,
       units = "in")
```{{execute}}


Open the `gg-step6-density-02.png` graph in the vscode IDE (above the Terminal console). 

As we've said, an essential part of effective communication is **knowing your audience**. It's unlikely these exploratory graphs will be part of our final deliverable, so the audience for these graphs will likely be us! 

Using descriptive labels makes sure we know what we're seeing when we're viewing our graphs.
