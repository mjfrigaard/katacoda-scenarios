### On-base and slugging percentage 

A true measure of hitting should include more than just a player's batting average. We also want to account for a player's ability to get on base (on-base percentage). In order to calculate the on-base percentage variable, we'll need the following variables: 

- `H`: Hits: times reached base because of a batted, fair ball without error by the defense  
- `X2B`: Doubles: hits on which the batter reached second base safely  
- `X3B`: Triples: hits on which the batter reached third base safely  
- `HR`: Homeruns  

*Run the code below by clicking in the gray area*

```
Batting %>% 
  select(c(H, X2B, X3B, HR)) %>% 
  skimr::skim()
```{{execute}}

The code below will calculate the `onbase_perc` variable using the `dplyr::mutate()`, and checks the new variable with the `skimr::skim()` function:

*Run the code below by clicking in the gray area*

```
# Calculate on base percentage (onbase_perc)
Batting <- Batting %>% 
  mutate(onbase_perc = (H + BB + HBP) / (AB + BB + HBP + SF),
         onbase_perc = round(x = onbase_perc, digits = 2))
Batting %>%
  select(c(H, AB, X2B, X3B, HR, batting_avg, onbase_perc)) %>% 
  skimr::skim()
```{{execute}}

Slugging percentage is also a measure of batting productivity, because it includes the player's ability to advance runners already on base. 

We can calculate and check the slugging percentage (`slug_perc`) variable below:

*Run the code below by clicking in the gray area*

```
# Calculate slugging percentage (slug_perc)
Batting <- Batting %>% 
  mutate(slug_perc = (H - X2B - X3B - HR + 2*X2B + 3*X3B + 4*HR) / AB,
         slug_perc = round(slug_perc, digits = 3))
Batting %>% 
  select(c(H, AB, X2B, X3B, HR, 
           batting_avg, onbase_perc, slug_perc)) %>% 
  skimr::skim()
```{{execute}}

These two metrics are typically combined as the OPS, or *on-base percentage plus slugging*. 

Below we create the `onbase_slug_perc` by adding `onbase_perc` and `slug_perc`, and we check all four new variables (`batting_avg`, `onbase_perc`, `slug_perc`, and `onbase_slug_perc`)

```
Batting <- Batting %>% 
  mutate(onbase_slug_perc = onbase_perc + slug_perc)
Batting %>% 
  select(c(batting_avg, onbase_perc, slug_perc, onbase_slug_perc)) %>% 
  skimr::skim()
```{{execute}}
