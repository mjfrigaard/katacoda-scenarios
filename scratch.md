
## intro.md

~~~

### Welcome!

Welcome to '*(scenario name from index.json)*'! In this scenario, we will cover how to build a **(type of graph** of a [data type].

This scenario assumes you've done some data wrangling with [`tidyr` and `dplyr`](https://katacoda.com/orm-mfrigaard/scenarios/01-format-shape-data), and [data visualization with `ggplot2`](https://www.katacoda.com/orm-mfrigaard/scenarios/02-intro-ggplot2).

### Knowing your data

It's best to start a project off with a '*view of the forest from outside the trees*'. The technical term for this is [data lineage](https://en.wikipedia.org/wiki/Data_lineage#), which

> "includes the data origin, what happens to it, and where it moves over time."

Having a "birds" eye view' of the data ensures there weren't any problems with exporting or importing. Data lineage also means understanding where the data are coming from (relational database, API, flat .csv files, etc.)?

### Tabular data

Knowing some of the technical details behind a dataset lets us frame the questions or problems we're trying to tackle. In this scenario, we will use [tabular data](https://en.wikipedia.org/wiki/Table_(information) data (i.e. [spreadsheets](https://en.wikipedia.org/wiki/Spreadsheet), Tabular data organizes information into columns and rows.

Let's load some data and get started!

~~~

## step1.md

~~~

### Initiate R

Launch an R console by clicking here -> `R`{{execute}}

### Load packages

The package we'll use to view the entire datasets with R is [`skimr`](https://docs.ropensci.org/skimr/). We will install and load these packages below:


```
install.packages(c("tidyverse", "skimr"))
library(tidyverse)
library(skimr)
```{{execute}}

### Navigating Katacoda

Let's take a quick tour of our Katacoda environment. In the next 18 steps, we'll be running code, viewing output, and creating graphs. To accomplish this, we'll need to understand what tools are at our disposal:

**Sidebar**

You're reading this in the **Sidebar**. All of the instructions are in the Sidebar, and at the bottom, you'll find a "*Continue*" button to take you to the next step. See the image below:



![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/[insert path]/img/sc-03-sidebar.png)




**Code blocks**

You will also find **code blocks** in the Sidebar. All the code blocks will run when you click on them (you've already run a few above!). See the image below for more examples:


![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/[insert path]/img/sc-03-code-blocks.png)

**Terminal**

The **Terminal** is where the R code from each code block will run, along with any text **output**. We can also use R interactively by typing them directly into the Terminal after the **Prompt `>`**.

Go ahead and try it by typing (or copying and pasting) the following commands:

```
tidyverse::tidyverse_logo()
```{{execute}}

You should see the following output in the **Terminal**:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/[insert path]/img/sc-03-terminal-code.png)


**VSCODE (EXPLORER)**

When we create graphs, we will include the `ggplot2::ggsave()` function in the code block. This function allows us to save the graph image as a `.png` file in the **VSCODE EXPLORER**.

**VSCODE (ROOT)**

Inside the VSCODE EXPLORER, you'll find a section labeled **ROOT.** ROOT is a folder that contains our new graph files. We can open the **Graph file** by clicking on them. See the image below for an example:


![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/[insert path]/img/sc-03-explorer-root.png)

The image below gives you an overview of this entire process:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/[insert path]/img/sc-03-code-run-png-view.png)


Now that we know how to navigate the Katacoda environment, we can start exploring data and building graphs!

~~~


## finish.md

~~~

### [title from index.json] in R with ggplot

In this scenario we covered how to:

1. `skim()` variables to get summary statistics  
2. [wrangling steps]
3. Build [graph type] with `package::function()`   
4. Save graph images with `ggplot2::ggsave()`  

### Thank you!

We've concluded the "*(scenario name from index.json)*"! Thank you for completing, and be sure to check out the other scenarios on [Katacoda](https://www.katacoda.com/)
