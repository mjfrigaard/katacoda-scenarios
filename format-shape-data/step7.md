# Split columns into new columns

The 


```
tidyr::separate(data = BobRossEpi, 
                col = episode, 
                into = c("season", "episode"), 
                sep = ", ")
```
