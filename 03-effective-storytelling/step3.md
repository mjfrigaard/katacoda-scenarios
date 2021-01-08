### Data quality

We're going to load a few datasets to demonstrate how to investigate a dataset's quality or *how well it matches our expectations*? 

These data come from the [`baseballDBR` package](https://github.com/keberwein/baseballDBR), and it contains an "R version of the 2020 edition of [Sean Lahman's Baseball Database](http://www.seanlahman.com/baseball-archive/statistics/)".

Click to install and load the `baseballDBR` package:

```
install.packages("baseballDBR")
library(baseballDBR)
```{{execute}}

### Why baseball data? 

Now, I am not going to assume everyone participating in this scenario is familiar with baseball. This exercise is arguably more rewarding if you are *not* a baseball fan. If you're working with data, part of your job to be interested in whatever you've been asked to analyze (even if it is only for the monetary reward). Analyzing and visualizing data you're not familiar with is a chance to learn something new, and it puts you in a position to ask 'out of the box' questions. 

### Viewing missing data

The first visualization we're going to create is a display of the missing data `visdat::vis_miss()` by column (or variable). We will look at the `People` dataset from the `baseballDBR` package, which contains "*Player names, DOB, and biographical info*" 

```
baseballDBR::get_bbdb(table = "People")
# view data
head(People)
```{{execute}}

We create the visualization by piping `Lahman::People` to `visdat::vis_miss()` and then to `ggplot2::coord_flip()`. We include the `ggplot2::labs()` function to add the `title` and `caption` on the graph. 

If this code looks unfamiliar to you, review the [Introduction to `ggplot2` scenario](https://www.katacoda.com/orm-mfrigaard/scenarios/02-intro-ggplot2).

```
gg_step3_people_vis_miss <- People %>%  
  visdat::vis_miss() + 
  ggplot2::coord_flip() + 
  ggplot2::labs(title = "Missing values in People data", 
                caption = "Source: https://github.com/cdalzell/Lahman")
# save
ggsave(filename = "gg-step3-people-vis-miss.png", device = "png",
        width = 7, height = 5, units = "in")
```{{execute}}

To view the graph, we will need to open it in the vscode IDE (above the console).

The output from `visdat::vis_miss()` shows us all of the variables in the `People` dataset, along with the percentage of missing values. As we can see, the majority of the missing values are in the variables with the `death` prefix (`deathDay`, `deathMonth`, and `deathYear`). Does this makes sense?

Yes, this makes sense because because most of the missing data are a result of the baseball players in the `People` dataset are alive. 

#### Other resources for missing data

Read more about visualizing missing data [here](http://naniar.njtierney.com/articles/naniar-visualisation.html) on the `visdat` package site, or on the [`inspectdf` package](https://github.com/alastairrushworth/inspectdf) website. 




