# Adding Useful Labels

Although density plots create a much smoother distribution, the `y` axis is harder to interpret. To overcome this, we will add two summary statistics programmatically to the labels using the `base::paste0()` and `base::round()` functions.

Run the following code to see how this works:

```
# click to execute code
subtitle_dens_stars <- paste0("Star rating (mean +/- sd): ",
       # use round() to make sure there are only two decimals
       round(mean(Ramen$stars, na.rm = TRUE), 2),
       " +/- ",
       round(sd(Ramen$stars, na.rm = TRUE), 2))
subtitle_dens_stars
```{{execute}}

We can now supply `subtitle_dens_stars` to the `labs(subtitle = )` function.
