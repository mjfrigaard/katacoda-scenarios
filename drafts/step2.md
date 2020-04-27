## Creating data

It's hard to learn any of R's capabilities without some data. One quick and easy way to get data into R is to create some data 'by hand'. We will create a data set with the `tibble::tribble()` function below.

```
SmallMtCars <- tibble::tribble(~make, ~mpg, ~cyl, ~hp,
                         "Mazda RX4",   21,    6, 110,
                     "Mazda RX4 Wag",   21,    6, 110,
                        "Datsun 710", 22.8,    4,  93,
                    "Hornet 4 Drive", 21.4,    6, 110,
                 "Hornet Sportabout", 18.7,    8, 175)
```{{execute}}

Access the help file (enter `??tibble::tribble` in the R console) or read the documentation on the [tibble website](https://tibble.tidyverse.org/) to see how this function works,

To view the contents of `SmallMtCars`, we can enter the name into the console and a preview of the data will print to the Terminal.


```
# print data
SmallMtCars
```{{execute}}
