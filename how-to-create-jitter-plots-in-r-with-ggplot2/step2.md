# Load IMDB Data

IMDB makes multiple datasets available for [download](https://datasets.imdbws.com/). We've combined the `title.ratings.tsv`, `name.basics.tsv`, and `title.principals.tsv` datasets into  the `ImdbData` dataset with the following columns:

* `tconst` = alphanumeric unique identifier of the title (used for joining)
* `nconst` = alphanumeric unique identifier of the name/person (used for joining)
* `category` = the category of job that person was in
* `primaryName` = name by which the person is most often credited
* `birthYear` = in `YYYY` format
* `averageRating` = weighted average of all the individual user ratings
* `numVotes` = number of votes the title has received
* `primaryTitle` = the more popular title/the title used by the filmmakers on promotional materials at the point of release
* `originalTitle` = original title, in the original language
* `isAdult` = `non-adult title` or `adult title`
* `startYear` = represents the release year of a title. In the case of TV Series, it is the series start year.
* `runtimeMinutes` = primary runtime of the title, in minutes
* `genres` = includes up to three genres associated with the title.
* `age_lead` = age of actor/actress at time of film (`age_lead = startYear - birthYear`)

```
# click to execute code
ImdbData <- readr::read_csv("https://oreil.ly/f1XnR")
glimpse(ImdbData)
```{{execute}}

In the following, we build a `skimr::skim()` of the `ImdbData` dataset:

```
# click to execute code
SkimImdbData <- skimr::skim(ImdbData)
summary(SkimImdbData)
```{{execute}}

First, we will review the character variables:

```
# click to execute code
SkimImdbData %>%
  skimr::yank("character")
```{{execute}}


These all look complete.

## Do These Numbers Make Sense?

The number of individual responses (`n_unique`) for each character variable is a good source for sanity checks. For example, the largest number of unique values belongs to the title id variable (`tconst` = `136925`), and this is identical to the number of rows in the dataset. The next largest number belongs to the `originalTitle` variable (`128171`), and the documentation tells us this variable is the title for the film in its original language. By itself, this number doesn't tell us much, but we can see the next largest number (`124228`) is the film's `primaryTitle`, and it makes sense that the number of unique responses for these two variables is almost the same.

It also makes sense that the `n_unique` for actor/actress (`nconst`) is close to the actor/actress `primaryName`. There should be way more titles (`originalTitle` or `primaryTitle`) than `genres`, and there are (`1056`).

Finally, we can see the two binary variables we read about above (`category` and `isAdult`) only list `2` unique values (in `n_unique`), so it appears we imported these variables correctly.

Next, we will review the `mean`, standard deviation (`sd`), minimum (`p0`), median (`p50`), maximum (`p100`), and `hist` for the numeric variables in `ImdbData`:

```
# click to execute code
SkimImdbData %>%
  skimr::focus(numeric.mean, numeric.sd,
               numeric.p0, numeric.p50, numeric.p100,
               numeric.hist) %>%
  skimr::yank("numeric")
```{{execute}}

## Do These Numbers Make Sense?

Let's take a look:

+ The average `birthYear` is `1947`, which is plausible considering the date range for movies in the IMDB (`1906` - `2021`).

+ The average movie rating is a `6.00`, which can be a little confusing considering [IMDB's rating scale](https://en.wikipedia.org/wiki/IMDb#User_ratings_of_films). Still, we can feel confident the data isn't skewed because the `mean` and median (`p50`) are relatively close to each other.

+ The number of votes (`numVotes`) is the most skewed variable because it ranges from `10` to `2334927`.

+ The `startYear` for the movie has an average of `1985`, and increases steadily from `1906` to `2021`, making sense because more films are being made every year.

+ The average length of each movie in `ImdbData` is `97.1` minutes (`runtimeMinutes`). But we can also see from the `hist` that the range for `runtimeMinutes` includes some very low and high values (`p0` = `2` and `p100` = `1500`).

The actor/actress's average age is `38.4`, with a low of `1` and a high of `98` (both plausible).

## Creating Categories from a Numerical Variable

We will proceed under the assumption that our stakeholders asked us to help explain the relationship between the average rating a movie received (`averageRating`) and the number of votes that went into the score (`numVotes`).

There are quite a few years in this dataset, so instead, we will split each measure into decades. To do this, we need a categorical variable from the `startYear` variable. The `cut()` function is handy because we can supply the number of `breaks` we want to split the numeric `startYear` variable into (`12` in this case). We will also create some clear labels for this categorical variable with the `labels` argument and make sure the format is `ordered`.

We check our new factor variable with the `fct_count()` from the `forcats` package:

```
# click to execute code
ImdbData <- ImdbData %>%
  mutate(year_cat10 = cut(x = startYear,
                          breaks = 12,
                          labels = c("1910s", "1920s", "1930s",
                                     "1940s", "1950s", "1960s",
                                     "1970s", "1980s", "1990s",
                                     "2000s",  "2010s", "2020s"),
                          ordered = TRUE))
# check the count of our factor levels
fct_count(f = ImdbData$year_cat10, sort = TRUE)
```{{execute}}
