### Data lineage: the background on our data

It's best to start a project off with a '*view of the forest from outside the trees*'. The technical term for this is [data lineage](https://en.wikipedia.org/wiki/Data_lineage#), which 

> "includes the data origin, what happens to it, and where it moves over time."

Having a "birds" eye view' of the data ensures there weren't any problems with exporting or importing. Data lineage also means understanding where the data are coming from--was it collected from an internal relational database, an external vendor, or did it come from the web or social media?

Knowing some of the technical details behind a dataset lets us frame the questions or problems we're trying to tackle. 

### Initiate R 

Let's get started! Launch an R console by clicking here -> `R`{{execute}} (Click on the *Run command* icon)

### Load packages

The package we'll use to view the entire dataset with R is [`skimr`](https://docs.ropensci.org/skimr/). We will install and load these packages below:

```
# click to execute code
install.packages(c("tidyverse", "skimr"))
library(tidyverse)
library(skimr)
```{{execute}}

### Navigating Katacoda

Let's take a quick tour of our Katacoda environment. In the next 18 steps, we'll be running code, viewing output, and creating graphs. To accomplish this, we'll need to understand what tools are at our disposal: 

**Sidebar**

You're reading this in the **Sidebar**. All of the instructions are in the Sidebar, and at the bottom, you'll find a "*Continue*" button to take you to the next step. See the image below:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/03-effective-storytelling/docs/img/sc-03-sidebar.png)

**Code blocks**

You will also find **code blocks** in the Sidebar. All the code blocks will run when you click on them (you've already run a few above!). See the image below for more examples:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/03-effective-storytelling/docs/img/sc-03-code-blocks.png)

**Terminal**

The **Terminal** is where the R code from each code block will run, along with any text **Output**. We can also use R interactively by typing them directly into the Terminal after the **Prompt `>`**. 

Go ahead and try it by typing (or copying and pasting) the following commands:

```
tidyverse::tidyverse_logo()
```

You should see the following output in the **Terminal**: 

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/03-effective-storytelling/docs/img/sc-03-terminal-code.png) 

**VSCODE (EXPLORER)**

When we create graphs, we will include the `ggplot2::ggsave()` function in the code block. This function allows us to save the graph image as a `.png` file in the **VSCODE EXPLORER**.

**VSCODE (ROOT)**

Inside the VSCODE EXPLORER, you'll find a section labeled **ROOT.** ROOT is a folder that contains our new graph files. We can open the **Graph file** by clicking on them. See the image below for an example:

![](https://raw.githubusercontent.com/mjfrigaard/katacoda-scenarios/master/03-effective-storytelling/docs/img/sc-03-explorer-root.png)

Now that we know how to navigate the Katacoda environment, we can start exploring data and building graphs!
