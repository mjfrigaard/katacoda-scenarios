### Creating data

Next we're going to create a dataset with the `tibble::tribble()` function. Access the help file (enter `??tibble::tribble` in the R console) or read the documentation on the [tibble website](https://tibble.tidyverse.org/) to see how this function works, 


```
BpData <- tibble::tribble(
    # variable names
  ~id, ~sex, ~age, ~race, ~wt_k, ~ht_m, ~pulse, ~bps_av, ~bpd_av,
  # data
  68440L, "male", 46L, "White", 80.7, "177.9", 58L, 93L, 66L,
  70780L, "female", 11L, "White", 43, "157", 96L, 93L, 73L,
  62222L, "male", 32L, "White", 80.1, "179", 78L, 104L, 73L,
  63302L, "male", 28L, "Black", 81.6, "190.2", 70L, 115L, 66L,
  68377L, "male", 74L, "White", 70.7, "173.2", 72L, 113L, 49L,
  71272L, "male", 30L, "White", 76.9, "173.2", 68L, 111L, 70L,
  62174L, "male", 80L, "White", 95.8, "168.1", 56L, 97L, 39L,
  55956L, "male", 13L, "Black", 68.2, "167.8", 80L, 112L, 43L,
  55246L, "female", 42L, "White", 56.7, "167.6", 66L, 87L, 55L,
  57725L, "female", 12L, "Mexican", 46, "157.2", 90L, 111L, 67L
)
```{{execute}}

To view the contents of `BpData`, we can enter the name into the console and a preview of the data will print to the Terminal.


```
# print data
BpData
```{{execute}}
