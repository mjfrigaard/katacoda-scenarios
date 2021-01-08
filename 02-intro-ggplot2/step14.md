### Adding labels 

Titles and labels are important because they give readers the context of the information they see in a graph. Without some additional information about the data, the audience is just staring at lines, points, colors, etc.

`ggplot2` has a few options for labeling graphs, but we recommend using the standard `ggplot2::labs()` function. It's easy to remember, and it has most of the necessary arguments you'll need for almost all the graphs you'll build. 

#### Using the `ggplot2::labs()` function

Below is a set of arguments that match the title and labels from the 'Better' graph from the Medium article. 

![](https://github.com/mjfrigaard/katacoda-data-wrangle-viz-show/blob/master/figs/12-bremore-better.png?raw=true)

As you can see, the Economist article chose to remove the `x` and `y` axes labels, but we think it's clearer to leave them in. Run the code below to create the `labs_eco` layer.

```
labs_eco <- ggplot2::labs(title = "Bremorse", 
                subtitle = "'In hindsight, do you think Britain was right or wrong to vote to leave the EU?'", 
                caption = "Source: NatCen Social Research", 
                x = "Date", 
                y = "Percent (%)")
```{{execute}}

We store the labels in the `labs_eco` object, which we can add to the `gg_p13_y` object and reassign this to the `gg_p14_labs` object.

Copy the code below to assign the labels layer to the plot object. 

```
gg_p14_labs <- gg_p13_y + labs_eco

ggsave(filename = "gg-step14-labs.png", device = "png", 
       width = 7, height = 5, units = "in")
```{{execute}}

View the `gg-step14-labs.png` image in the vscode IDE.

Labels are also important for keeping track of your work. If you're exploring a dataset using graphs (a process called [Exploratory Data Analysis](https://en.wikipedia.org/wiki/Exploratory_data_analysis), or EDA), the labels can help you remember what transformations or changes you made to the data under hood.   
