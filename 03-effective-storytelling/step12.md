### Communicating column/bar charts

Now that we've created a few graphs, we should stop and consider what narrative information we've contained in each plot. We used column and bar charts for displaying the counts for two categorical variables: 

- `bats`, which measures whether MLB players are left-handed (`L`), right-handed (`R`), both (`B`), or if these data are missing (`NA`)  
- `birthCountry`, which tells us the 'Country of Birth' for each MLB player  

We can use these graphs to convey *comparison* information. For example, we can see from the bar graph that most MLB players are right-handed batters. 


#### Bar graph 

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/03-effective-storytelling/docs/img/gg_step6_bar_01-1.png)



The column chart displays similar information. The columns can be used for comparing the frequency of one country to the other. We've also arranged the columns in a way that makes it clear which country appears the most and which country appears the least. 

#### Column graph 

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/03-effective-storytelling/docs/img/gg_step6_col_02-1.png)


The text to accompany your graphs will largely depend on the context of the problem you're trying to solve (or question you're trying to answer), but there are a few general guidelines we can apply to each type of graph. 

### Communcation (labels)

Titles should be objective and neutral, expressing the "who," "what," and "where" of the figure's measurements. Avoid jargon and unnecessary descriptive words. Stick with 1) what data was measured, 2) when the data was measured, and 3) how the data was counted (i.e., the units).

When you are building labels, plan on providing enough information that the chart becomes a 'stand-alone product.' By this, we mean that if a new observer viewed your graph, they would at minimum be able to understand what point the figure was trying to make (i.e., "this graph shows the values in X variable," or "this figure shows the relationship between X and Y").

### Communication (distributions)

We've explored the distribution of the `stars` rating variable in the `Ramen` dataset by itself in the histogram and density plot and across the top five `type`s in the ridgeline plot and box-plot. 

#### Histogram

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/03-effective-storytelling/docs/img/gg_step7_hist_02-1.png)


#### Density graph


![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/03-effective-storytelling/docs/img/gg_step6_density_02-1.png)


#### Ridgeline plot


![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/03-effective-storytelling/docs/img/gg_step7_ridge_01-1.png)

#### Box-plot

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/03-effective-storytelling/docs/img/gg_step8_boxplot_01-1.png)

Distribution plots are useful if we're answering exploratory questions about a variable before calculating statistics or building a model. Histograms, density, and ridgeline plots can quickly tell us if a variable has a normal (bell-shaped) distribution, which is a crucial assumption to check before modeling. Box-plots require a higher degree of statistical literacy for interpretation, so we recommend confirming your audience is familiar with these graphs before relying on them. Summary statistics are also vital to include with distribution graphs (usually in a supplementary table) because it tethers the figure to mathematical values. 

The information from these exploratory charts gives your narrative context and frames the problem. If we were telling a story, this would be the portion that tells us the setting or universe in which our characters live.
