### Convert questions into actionable steps

Now that we've defined the audience for our data visualization, we can create actionable steps towards building the graphs. Knowing who will be consuming the information in our figures allows us to decide which variables we will use and how. Some questions will have multiple ways to show the correct answer and numerous sources of data to use.

If we need additional information to make the question(s) necessarily precise, we should spend more time engaging with the stakeholders/audience. Our ultimate job is to translate the stakeholder's problem or question into a dataset capable of being represented with data visualizations. 

### Batting statistics

To address the question, *"who is the greatest major league baseball (MLB) hitter?"*, we're going to use the `Batting` dataset from the Lahman database. 

We can access this using the, `baseballDBR::get_bbdb()` function. We will also visualize the missing data in `Batting` using `visdat::vis_miss()` (note we will have to set the `warn_large_data` argument to `FALSE`).

```
baseballDBR::get_bbdb(table = "Batting")
# view missing Batting data
gg_step7_batting_vis_miss <- Batting %>%  
  visdat::vis_miss(warn_large_data = FALSE) + 
  ggplot2::coord_flip() + 
  ggplot2::labs(title = "Missing values in Batting data", 
                caption = "https://lahman.r-forge.r-project.org/")
# save
ggsave(filename = "gg-step7-batting-vis-miss.png", device = "png",
        width = 7, height = 5, units = "in")
```{{execute}}

View the `gg-step7-batting-vis-miss.png` graph in the vscode IDE.

### Replace missing values 

We can see from the `skimr::skim()` output that some of the variables in `Batting` are recorded as missing (`NA`).

The missing data will cause problems when we want to calculate new metrics, so we will replace these with `tidyr::replace_na()`.

We will check these variables using the `dplyr::select_if()` function:

```
Batting <- Batting %>% 
  # replace missing values with 0
  tidyr::replace_na(list(RBI = 0, SB = 0, CS = 0, 
                         SO = 0, IBB = 0, HBP = 0, 
                         SH = 0, SF = 0, GIDP = 0))
Batting %>% 
  dplyr::select_if(is.numeric) %>% 
  skimr::skim()
```{{execute}}

As with most measurements, 'hitting' in baseball is measured in a variety of ways. So determining the 'greatest hitter' might require doing some research and asking a few questions. Read more about the `Batting` table on the [Lahman package website](https://lahman.r-forge.r-project.org/doc/Batting.html).

### Incorporating expertise

Useful visualizations incorporate the expertise and knowledge of the stakeholders/audience *and* the analyst's understanding of the data into the display. For baseball, a great example of combining game expertise with numerical and statistical acumen comes from Michael Lewis's Moneyball, 

> "*When the numbers acquire the significance of language," he later wrote, "they acquire the power to do all of the things which language can do: to become fiction and drama and poetry...and it is not just baseball that these numbers, through a fractured mirror, describe. It is a character. It is psychology, it is history, it is power, it is grace, glory, consistency, sacrifice, courage, it is success and failure, it is frustration and bad luck, it is ambition, it is overreaching, it is discipline. And it is victory and defeat, which is all that the idiot sub-conscious really understands.*"

We will use the Batting dataset's existing variables to calculate additional metrics for evaluating each player's hitting statistics. 
