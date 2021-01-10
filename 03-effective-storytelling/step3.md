### Before you start: what do we expect to see?

Generally speaking, we should have an idea about how many columns and rows a new dataset will contain. We should know some general information about the variable formats, too. 

For example, we should see if we're getting date columns (`YYYY-MM-DD`), logical values (`TRUE`, `FALSE`, `NA`), numerical measurements (integer (`1L`) or double (`1`)), or text data (character (`male` and `female`) or factor (`low`, `medium`, `high`)).

We're going to load a dataset to demonstrate how to investigate a dataset's quality or *how well it matches our expectations*? 

These data come from [Sean Lahman's Baseball Database](http://www.seanlahman.com/baseball-archive/statistics/)".

### Why baseball data? 

Now, I am not going to assume everyone participating in this scenario is familiar with baseball. However, this exercise is arguably more rewarding if you are *not* a baseball fan. If you're working with data, part of your job to be interested in whatever you've been asked to analyze (even if it is only for the monetary reward).

> "...if you want to work in data visualisation, you need to be relentlessly and systematically curious. You should try to get interested in anything and everything that comes your way." - Alberto Cairo, Knight Chair in Visual Journalism, University of Miami

Analyzing and visualizing data you're not familiar with is a chance to learn something new, and it puts you in a position to ask 'out of the box' questions. 

### Doing your homework

It's also important to read any accompanying documentation for new datasets. If we read the documentation on the [Lahman website](http://www.seanlahman.com/files/database/readme2017.txt), we find out that `People` contains "*Player names, DOB, and biographical info.*" 

The variables in `People` are presented below: 

**People table**

`playerID` = A unique code assigned to each player. The `playerID` links the data in this file with records in the other files     
`birthYear` = Year player was born  
`birthMonth` = Month player was born  
`birthDay` = Day player was born  
`birthCountry` = Country where player was born  
`birthState` = State where player was born  
`birthCity` = City where player was born
`deathYear` = Year player died  
`deathMonth` = Month player died  
`deathDay` = Day player died  
`deathCountry` = Country where player died   
`deathState` = State where player died  
`deathCity` = City where player died  
`nameFirst` = Player's first name  
`nameLast` = Player's last name  
`nameGiven` = Player's given name (typically first and middle)  
`weight` = Player's weight in pounds  
`height` = Player's height in inches  
`bats` = Player's batting hand (left, right, or both)          
`throws` = Player's throwing hand (left or right)  
`debut` = Date that player made first major league appearance  
`finalGame` = Date that player made first major league appearance (blank if still active)  
`retroID` = ID used by retrosheet  
`bbrefID` = ID used by Baseball Reference website   


Now that we have some background information on this new dataset, we will take a look at how well `People` meets our expectations.  

Whenever we get a new source of data, we should try to view the data in its native format (if possible). We can view the raw data on the [Github repository](https://resources.oreilly.com/katacoda/martin-frigaard/blob/master/03-effective-storytelling/data/People.csv). 

### Load data

Fortunately, we are also able to load the raw data directly into R using the `readr::read_csv()` function. We will load the `People` dataset into R using `readr::read_csv()`, and assign `"https://bit.ly/3scsHw7"` to the `file` argument. 

```
# click to execute code
People <- readr::read_csv(file = "https://bit.ly/3scsHw7")
```{{execute}}

