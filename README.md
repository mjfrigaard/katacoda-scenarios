---
title: "Katacoda scenarios"
output: 
  html_document: 
    toc_depth: 6
    highlight: textmate
    keep_md: yes
---

I will be creating three scenarios for using R in Katacoda. They are listed below:

## Scenario 1: Format and shape your data with R in the tidyverse

### intro 

This introduces the `tidyverse` and gives a little preview of what is to come. 

<img src="figs/intro.png" width="1440" />

### step 1

Step 1 covers how to install and load packages in R (`install.packages()` and `library()`). It also covers some basic information about functions.

<img src="figs/step1.png" width="1351" />

<img src="figs/00-name-arg.png" width="624" />

<img src="figs/00-position-arg.png" width="538" />

### step 2

This covers the Bob Ross dataset from 538, and using the `BobRoss <- fivethirtyeight::bob_ross` function to create a dataset in R. 

<img src="figs/step2.png" width="1225" />

<img src="figs/00-538-bob-ross.png" width="1476" />


### step 3

Here we cover loading data into R from the `fivethirtyeight` package with `tibble::tribble()`.

<img src="figs/step3.png" width="1227" />

### step 4

This introduces `tidyr` and `dplyr::glimpse()`. 

<img src="figs/step4.png" width="1256" />

### step 5

We create a tidy dataset with `pivot_longer()`.

<img src="figs/step5.png" width="1212" />

<img src="figs/01-orig-bob-ross.png" width="1716" />

<img src="figs/02-long-bob-ross.png" width="1338" />

### step 6

We revert to the wide dataset with `tidyr::pivot_wider()`

<img src="figs/step6.png" width="1246" />

### step 7

We split a column with `tidyr::separate()`

<img src="figs/step7.png" width="1246" />


### step 8

We bring two columns back together with `tidyr::unite()`

<img src="figs/step8.png" width="1302" />

### step 9

We change the format of a variable with `dplyr::mutate()`

<img src="figs/step9.png" width="1250" />

<img src="figs/03-original-data.png" width="564" />

<img src="figs/04-pivot-longer.png" width="1776" />

<img src="figs/05-pivot-wider.png" width="980" />

### step 10

We create a new variable based on a condition with `dplyr::if_else()` and `dplyr::mutate()`.

<img src="figs/step10.png" width="1404" />

### step 11

We create a new variable based on multiple conditions with `dplyr::case_when()` and `dplyr::mutate()`. 

<img src="figs/step11.png" width="1243" />

### step 12

We combine creating new variables with reshaping to check our work (`dplyr::case_when()` and `dplyr::mutate()`, then `dplyr::count`, and `tidyr::pivot_wider()`).

<img src="figs/step12.png" width="1231" />

### finish

Wrap up. 

<img src="figs/finish.png" width="1437" />

***

Coming soon!

*Scenario 2: Build beautiful, customized graphs and charts in R with ggplot2*

*Scenario 3: Combine narrative with numbers for effective storytelling in R*

This is the `README.Rmd` file for the Katacoda scenarios. All the scenarios and courses can be found on my profile page [here](https://katacoda.com/mjfrigaard).

