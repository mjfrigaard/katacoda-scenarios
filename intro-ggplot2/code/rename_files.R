# this function should identify files in a directory based on a patter, then 
# rename files based on a provided text

library(assertthat)
library(tidyverse)

# files_to_rename
files_to_rename <- fs::dir_ls(path = "drafts", regexp = "step")

# new names 
new_names <- stringr::str_replace_all(string = files_to_rename, 
                         pattern = "step", 
                         replacement = "_step")

# now rename these files
file.rename(files_to_rename, new_names)


# turn into function ------------------------------------------------------

rename_files <- function(input_dir = NULL, file_regex, old_name, new_name) {
    
    # convert to char
    assertthat::assert_that(is.character(input_dir))
    assertthat::assert_that(is.character(file_regex))
    assertthat::assert_that(is.character(old_name))
    assertthat::assert_that(is.character(new_name))
    
    # convert all to character
    old_name <- as.character(old_name)
    new_name <- as.character(new_name)
    
    # create vector of files to rename
    files_to_rename <- fs::dir_ls(path = input_dir, regexp = file_regex)
    
    
    new_names <- stringr::str_replace_all(string = files_to_rename, 
                                          pattern = old_name, 
                                          replacement = new_name)
    
    file.rename(files_to_rename, new_names)
    
}

# test 
rename_files(input_dir = "drafts", file_regex = "step", old_name = "step", new_name = "_step")
