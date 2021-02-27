### Investigating outliers

It's always a good idea to investigate values that seem implausible. Outliers can have a big impact on data visualizations (and statistical models), so ensuring we account for them is essential for communicating with our audience. 

We're going to `filter` the `StarWars` data only observations with `mass` more than `180`, and `select` only the `name`, `height`, `mass`, `sex` and `species` columns (we chose `200` because it's approximately 2x the `p75` value).

```
StarWars %>% 
    filter(mass > 200) %>% 
    select(name, height, mass, sex, species)
```{{execute}}

We can now see this `mass` belongs to Jabba the Hutt, which makes sense if we do some [additional research](https://starwars.fandom.com/wiki/Jabba_Desilijic_Tiure).

### Build Labels

Now that we know what we're going to visualize, we can make our labels.

```
# click to execute code
labs_scatter_ht_mass_01 <- labs(
  title = "Star Wars Character's height and mass", 
  x = "Mass", 
  y = "Height")
```{{execute}}
