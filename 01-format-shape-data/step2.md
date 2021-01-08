### Data in packages

It's hard to learn any of R's capabilities without a dataset. There are multiple ways to get datasets into the R environment, but we'll cover that in another scenario.

Today we'll be using a dataset from the [`fivethirtyeight` package](https://cran.r-project.org/web/packages/fivethirtyeight/vignettes/fivethirtyeight.html) in R. This package has over 100 datasets from articles on the website [FiveThirtyEight](https://fivethirtyeight.com/).

The dataset we will be using today comes from the article ["A Statistical Analysis of the Work of Bob Ross."](https://fivethirtyeight.com/features/a-statistical-analysis-of-the-work-of-bob-ross/)

![](https://github.com/mjfrigaard/katacoda-scenarios/blob/master/figs/00-538-bob-ross.png?raw=true)

Bob Ross was the host of [The Joy of Painting](https://en.wikipedia.org/wiki/The_Joy_of_Painting), a painting educational program from 1980 - 1994.

We'll load the `BobRoss` dataset into R using `fivethirtyeight::bob_ross`.

First, we have to install and load the package into the R environment.

```
# click to execute code
install.packages("fivethirtyeight")
library(fivethirtyeight)
```{{execute}}

Now we can assign the `bob_ross` data frame into the `BobRoss` object.

```
# click to execute code
BobRoss <- fivethirtyeight::bob_ross
```{{execute}}

As we noted earlier, functions are like verbs in the R language, and the data we've created is the object. Similar to English grammar, the verbs (functions) do things to the objects. We can build data objects in R using a variety of methods, but typically we'll be loading data from an outside source into the R environment.


```
# click to execute code
# print data
BobRoss
```{{execute}}

We should pay attention to the information printed in `BobRoss`. As we can see, it's contained in a `tibble`.

```
# A tibble: 403 x 71
   episode season episode_num title apple_frame aurora_borealis  barn beach
   <chr>    <dbl>       <dbl> <chr>       <int>           <int> <int> <int>
 1 S01E01       1           1 A WA…           0               0     0     0
 2 S01E02       1           2 MT. …           0               0     0     0
 3 S01E03       1           3 EBON…           0               0     0     0
 4 S01E04       1           4 WINT…           0               0     0     0
 5 S01E05       1           5 QUIE…           0               0     0     0
 6 S01E06       1           6 WINT…           0               0     0     0
 7 S01E07       1           7 AUTU…           0               0     0     0
 8 S01E08       1           8 PEAC…           0               0     0     0
 9 S01E09       1           9 SEAS…           0               0     0     1
10 S01E10       1          10 MOUN…           0               0     0     0
# … with 393 more rows, and 63 more variables: boat <int>, bridge <int>,
#   building <int>, bushes <int>, cabin <int>, cactus <int>,
#   circle_frame <int>, cirrus <int>, cliff <int>, clouds <int>, conifer <int>,
#   cumulus <int>, deciduous <int>, diane_andre <int>, dock <int>,
#   double_oval_frame <int>, farm <int>, fence <int>, fire <int>,
#   florida_frame <int>, flowers <int>, fog <int>, framed <int>, grass <int>,
#   guest <int>, half_circle_frame <int>, half_oval_frame <int>, hills <int>,
#   lake <int>, lakes <int>, lighthouse <int>, mill <int>, moon <int>,
#   mountain <int>, mountains <int>, night <int>, ocean <int>,
#   oval_frame <int>, palm_trees <int>, path <int>, person <int>,
#   portrait <int>, rectangle_3d_frame <int>, rectangular_frame <int>,
#   river <int>, rocks <int>, seashell_frame <int>, snow <int>,
#   snowy_mountain <int>, split_frame <int>, steve_ross <int>, structure <int>,
#   sun <int>, tomb_frame <int>, tree <int>, trees <int>, triple_frame <int>,
#   waterfall <int>, waves <int>, windmill <int>, window_frame <int>,
#   winter <int>, wood_framed <int>
```

`tibble`s print the dimensions of the dataset (`# A tibble: 403 x 71`), numerical indices for rows (far left), and the type of variable in the dataset (`<chr>` variables have text information vs. `<dbl>` and `<int>` variables which contain numbers), and additional information about the data when it's too big to print on the screen (`… with 393 more rows, and 63 more variables:`). Read more about `tibble`s in [this chapter of R for Data Science](https://www.oreilly.com/library/view/r-for-data/9781491910382/ch07.html#tibbles). 
