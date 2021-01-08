### Single variable graphs: batting average 

Below we pass the `Batting` dataset to the `ggplot2::ggplot(aes())` function, and map `batting_avg` to the `x` axis. Next we add a `ggplot2::geom_histogram()` and labels with `ggplot2::labs()`:

*Run the code below by clicking in the gray area*

```
gg_step9_batting_hist_1 <- Batting %>% 
  ggplot2::ggplot(aes(x = batting_avg)) + 
  ggplot2::geom_histogram() + 
  ggplot2::labs(title = "Batting Average",  
                x = "Batting Average = Hits / At-Bats",
                y = "Count",
                caption = "https://lahman.r-forge.r-project.org/")

# save
ggsave(filename = "gg-step9-batting-hist-1.png", device = "png",
        width = 7, height = 5, units = "in")
```{{execute}}

View the `gg-step9-batting-hist-1.png` graph in the vscode IDE. 

### Adjust the bins

We can use the `bins` argument in `geom_histogram()` to change the shape of the distribution. The graph below sets the `bins` to `45`. Run the code to see how the graph changes shape.  

*Run the code below by clicking in the gray area*

```
gg_step9_batting_hist_bin45 <- Batting %>% 
  ggplot2::ggplot(aes(x = batting_avg)) + 
  ggplot2::geom_histogram(bins = 45) + 
  ggplot2::labs(title = "Batting Average", 
                x = "Batting Average = Hits / At-Bats",
                y = "Count",
                caption = "https://lahman.r-forge.r-project.org/")
# save
ggsave(filename = "gg-step9-batting-hist-bin45.png", device = "png",
       width = 7, height = 5, units = "in")
```{{execute}}

View the `gg-step9-batting-hist-bin45.png` graph in the vscode IDE. 

The distribution of `batting_avg` shows us that most of the values are around `0.25`, which was also displayed in the `skimr::skim()` result.


