#=====================================================================#
# This is code to create: BpData
# Authored by and feedback to: mjfrigaard
# MIT License
# Version: 1.0
#=====================================================================#


# packages ----------------------------------------------------------------
suppressPackageStartupMessages(install.packages("tidyverse"))
suppressWarnings(suppressMessages(library(tidyverse)))

# create data
BpData <- tibble::tribble(
  # variable names
  ~name, ~dob, ~wt_kg, ~ht_m, ~bp_d, ~bp_s,
  # data
  "john", "1985-10-13", 100L, "2.1", 80L, 130L,
  "peter", "1979-08-04", 82L, "1.9", 65L, 126L,
  "steve", "1981-04-23", 95L, "1.7", 70L, 119L,
  "sally", "1983-03-28", 72L, "1.5", 75L, 129L,
  "beth", "1986-06-07", 76L, "1.6", 78L, 126L,
  "kate", "1982-08-19", 69L, "1.5", 74L, 121L
)
