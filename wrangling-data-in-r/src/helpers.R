# =====================================================================#
# This is code to create: helpers.R
# Authored by and feedback to: @mjfrigaard
# MIT License
# Version: 1.0
# =====================================================================#


# packages ----------------------------------------------------------------

library(NHANES)
library(datapasta)
library(tidyverse)

# get NHANES sample data --------------------------------------------------
# NHANES %>%
#   dplyr::select(
#     ID, Gender, Age, Race1,
#     Weight, Height, Pulse, BPSysAve, BPDiaAve) %>%
#     dplyr::sample_n(tbl = ., size = 10) %>%
#     datapasta::tribble_paste()

NHANES %>% count(Race1)

# BpData ------------------------------------------------------------------
# these are from the NHANES package
BpData <- tibble::tribble(
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



# video game data ---------------------------------------------------------
# clean dataset from lizawood's github
url <- "https://raw.githubusercontent.com/lizawood/apps-and-games/master/PC_Games/PCgames_2004_2018_raw.csv"

# read in raw data
VideoGamesRaw <- url %>%
  read_csv() %>%
  janitor::clean_names()

datapasta::dp_set_max_rows(num_rows = 50000)

VideoGames = VideoGamesRaw %>%
    
  mutate(
      # numeric
    price = as.numeric(price),
    
    score_rank = word(score_rank_userscore_metascore, 1),
    
    average_playtime = word(playtime_median, 1),
    
    median_playtime = word(playtime_median, 2),
    
    median_playtime = str_remove(median_playtime, "\\("),
    
    median_playtime = str_remove(median_playtime, "\\)"),
    
    average_playtime = 60 * as.numeric(str_sub(string = average_playtime, 
                                               start = 1,
                                               end = 2)) + 
                            as.numeric(str_sub(string = average_playtime, 
                                               start = 4, 
                                               end = 5)),
    
    median_playtime = 60 * as.numeric(str_sub(string = median_playtime, 
                                              start = 1, 
                                              end = 2)) + 
                           as.numeric(str_sub(string = median_playtime, 
                                              start = 4, 
                                              end = 5)),
    
               metascore = as.double(str_sub(string = score_rank_userscore_metascore, 
                                              start = -4, 
                                              end = -3))) 
