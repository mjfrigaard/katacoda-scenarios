# Before We Start: What Do We Expect to See?

Before starting a new project, we want to set some expectations. The questions we covered in the previous step help us understand what kind of data we'll be encountering. Sometimes we'll be dealing with unknown data, but we should know approximately how many columns and rows the new dataset will contain. We might know some basic information about the variable formats, too.

For example, we should see if we're getting date columns (`YYYY-MM-DD`), logical (`TRUE`, `FALSE`, `NA`), numerical measurements (integer (`1L`) or double (`1`)), or categorical data (character (`male` and `female`) or factor (`low`, `medium`, `high`)).

## Baseball Data

We're going to load a dataset to demonstrate a few ways to investigate a dataset's quality (or how well it matches our expectations).

This data comes from [Sean Lahman's Baseball Database](http://www.seanlahman.com/baseball-archive/statistics/).

Now, I am not going to assume everyone participating in this scenario is familiar with baseball. However, this exercise is arguably more rewarding if you are *not* a baseball fan. If you're working with data, part of your job to be interested in whatever you've been asked to analyze (even if it is only for the monetary reward).

> "...If you want to work in data visualization, you need to be relentlessly and systematically curious. You should try to get interested in anything and everything that comes your way." &ndash; Alberto Cairo, Knight Chair in Visual Journalism, University of Miami

Analyzing and visualizing data you're not familiar with is a chance to learn something new, and it puts you in a position to ask "out of the box" questions.

### Doing Your Homework

It's also essential to read any accompanying documentation for new datasets. If we read the documentation on the [Lahman website](http://www.seanlahman.com/files/database/readme2017.txt), we find out that `People` contains "*Player names, DOB, and biographical info.*"
The variables in `People` are presented in the following list:

<!-- **People table** -->

* `playerID` = A unique code assigned to each player; the `playerID` links the data in this file with records in the other files
* `birthYear` = Year player was born
* `birthMonth` = Month player was born
* `birthDay` = Day player was born
* `birthCountry` = Country where player was born
* `birthState` = State where player was born
* `birthCity` = City where player was born
* `deathYear` = Year player died
* `deathMonth` = Month player died
* `deathDay` = Day player died
* `deathCountry` = Country where player died
* `deathState` = State where player died
* `deathCity` = City where player died
* `nameFirst` = Player's first name
* `nameLast` = Player's last name
* `nameGiven` = Player's given name (typically first and middle)
* `weight` = Player's weight in pounds
* `height` = Player's height in inches
* `bats` = Player's batting hand (left, right, or both)
* `throws` = Player's throwing hand (left or right)
* `debut` = Date that player made first major league appearance
* `finalGame` = Date that player made first major league appearance (blank if still active)
* `retroID` = ID used by retrosheet
* `bbrefID` = ID used by Baseball Reference website

Most of the data pre-processing steps center around a single question: *Is this what I expected to see*? Reading the documentation gives you expectations about the data to confirm or refute (and then investigate).

Now that we have some background information on this new dataset, we will look at how well `People` meets our expectations.

Whenever we get a new data source, we should try to view the data in its native format (if possible). We can view the raw data on the [Github repository](https://resources.oreilly.com/katacoda/martin-frigaard/blob/master/data/People.csv).

### Load Data

Fortunately, we are also able to load the raw data directly into R using the `readr::read_csv()` function. We will load the `People` dataset into R using `readr::read_csv()`, and assign `"https://bit.ly/2ZMZjzv"` to the `file` argument:

```
People <- readr::read_csv(file = "https://bit.ly/2ZMZjzv")
```{{execute}}
