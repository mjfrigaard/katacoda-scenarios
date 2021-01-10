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

![](https://resources.oreilly.com/katacoda/martin-frigaard/raw/master/03-effective-storytelling/docs/img/sc-03-sidebar.png)

**Code blocks**

You will also find **code blocks** in the Sidebar. All the code blocks will run when you click on them (you've already run a few above!). See the image below for more examples:

![](https://resources.oreilly.com/katacoda/martin-frigaard/raw/master/03-effective-storytelling/docs/img/sc-03-code-blocks.png)
