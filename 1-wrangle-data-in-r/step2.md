### Creating data

It's hard to learn any of R's capabilities without some data. One quick and easy way to get data into R is to create some data 'by hand'. We will create a data set with the `tibble::tribble()` function below.

```
band_member_heights <- tibble::tribble(
    # variable names
  ~name,     ~band, ~height_cm,
  # data
  "Mick",  "Stones",     177.8,
  "John", "Beatles",     177.8,
  "Paul", "Beatles",     178.4)
```{{execute}}

Access the help file (enter `??tibble::tribble` in the R console) or read the documentation on the [tibble website](https://tibble.tidyverse.org/) to see how this function works, 

To view the contents of `BpData`, we can enter the name into the console and a preview of the data will print to the Terminal.


```
# print data
BpData
```{{execute}}
