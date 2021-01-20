### Communicating relationships

A graph describing a relationship answers a certain kind of question. These questions center around topics like divergence ("as x goes increases/decreases, y moves up/down"), correlations ("how much does each unit of y increase/decrease with each unit of x?"), or time-series ("how does x change over time?").

When presenting a graph with relationships, consider the context and framing for the conclusions your audience will draw. Is this good news? For example, if the chart displays a drop in sales over time, anticipate how this will change your presentation's tone, and be ready to answer questions. It's also important not to confuse your audience when designing graphs. Relationships with 'good news' should have the data points showing a positive trend (i.e., as x values increase, so do y values) and vice-versa. You don't want to find yourself in a situation where you're explaining that your graph doesn't show what you're audience is *seeing*.

If the relationship is sufficiently complex, consider using small multiples to compare the information in a series of graphs. Pay close attention to the x and y-axis when building small multiple plots, so the audience knows what comparisons to make.  

### Communication (outliers)

If there are extreme values in your data, investigate why these outliers exist. Determine if you should include the outliers, or, if you decide to remove them, document this justification and communicate it clearly with your audience/stakeholders. 

Read more about visualizing missing data [here](http://naniar.njtierney.com/articles/naniar-visualisation.html) and on the [`visdat` package site](https://docs.ropensci.org/visdat/), or on the [`inspectdf` package](https://github.com/alastairrushworth/inspectdf) website.

In the `StarWars` dataset, we saw how removing Jabba the Hutt changed the relationship between `mass` and `height`.


![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/03-effective-storytelling/docs/img/gg_step13_scatter_01-1.png?raw=true)


![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/03-effective-storytelling/docs/img/gg_step13_scatter_02-1.png?raw=true)


### Comunication (scales)

We should make sure we are presenting the scales in our graphs. For example, we calculated the percentage of female characters in comic book publishers, and we made sure the `y` axis included the appropriate units. 

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/03-effective-storytelling/docs/img/gg_step16_line_02-1.png?raw=true)


We also used text annotations to highlight and label the details we wanted our audience to focus on.

### Communication (transformation)

If we find a variable skewed and need to transform it, we should make sure the stakeholders understand what we've done. We also need to communicate the additional effort to interpret the results.

We use the log10 transformation on the number of votes in the IMDB dataset to see its relationship to average user ratings. 


![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/03-effective-storytelling/docs/img/gg_step20_facet_03-1.png?raw=true)

We should include accompanying information on interpreting the `x` axis and any other graphs or tables built with the transformed variable.

### Thank you!

We've concluded the "**Use graphs and data for effective storytelling**"! Thank you for completing, and be sure to check out the other scenarios on [Katacoda](https://www.katacoda.com/)

