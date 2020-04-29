---
title: "Katacoda scenarios"
output: 
  html_document: 
    toc_depth: 6
    highlight: textmate
    keep_md: yes
---

I will be creating three scenarios for using R in Katacoda. They are listed below:

## Scenario 1: Format and shape your data in R with the tidyverse

### intro 

This introduces the `tidyverse` and gives a little preview of what is to come. 

### step 1

Step 1 covers how to install and load packages in R (`install.packages()` and `library()`)

### step 2

This covers the Bob Ross dataset from 538, and using the `tibble::tribble()` function to create a dataset in R. 

### step 3

Here we cover loading data into R from the `fivethirtyeight` package with `readr::read_csv()`.

### step 4

This introduces `tidyr` and `dplyr::glimpse()`. 

### step 5

We create a tidy dataset with `pivot_longer()`.

### step 6

We revert to the wide dataset with `tidyr::pivot_wider()`

### step 7

We split a column with `tidyr::separate()`

### step 8

We bring two columns back together with `tidyr::unite()`

### step 9

We change the format of a variable with `dplyr::mutate()`

### step 10

We create a new variable based on a condition with `dplyr::if_else()` and `dplyr::mutate()`.

### step 11

We create a new variable based on multiple conditions with `dplyr::case_when()` and `dplyr::mutate()`. 

### step 12

We combine creating new variables with reshaping to check our work (`dplyr::case_when()` and `dplyr::mutate()`, then `dplyr::count`, and `tidyr::pivot_wider()`).

### finish

Wrap up. 

***

*Scenario 2: Build beautiful, customized graphs and charts in R with ggplot2*

*Scenario 3: Combine narrative with numbers for effective storytelling in R*

This is the `README.Rmd` file for the Katacoda scenarios. All the scenarios and courses can be found on my profile page [here](https://katacoda.com/mjfrigaard).

