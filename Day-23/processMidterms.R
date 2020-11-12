library(tidyverse)
library(here)

# Read in fixed width by columns
mtgrad <- read_fwf(here("Day-23", "FakeMidterms.txt"),
                   fwf_cols(college = 5, dept = 7, id = 10, 
                            name = 23, code = 5, co_num = 7, sec_num = 8, 
                            course = 22, hrs = 4, grade = 4, advisor = 21))
# DO NOT reorder until advisors are copied down
#
# Remove any rows with id NA or which doesn't start ID with @:
mtgrad %>%
     filter(!is.na(id) & str_detect(id, "^@")) ->
     mtgrad

# Copy the advisors down
currAdv <- "";
for(rowNum in seq_along(mtgrad$id)) {
     if(is.na(mtgrad[rowNum, "advisor"])) { # empty; enter last found advisor
        mtgrad[rowNum, "advisor"] <- currAdv;
     } else {
        currAdv <- mtgrad[rowNum, "advisor"]
     }
}
# Remove college, dept:
mtgrad <- select(mtgrad, -college, -dept)
# Now:  Make a table of all the first years, using common hour
# to identify the first years:
mtgrad %>%
     filter(grepl("^1ST YR", course)) -> frosh
# Take only the students who show up in that table:
semi_join(mtgrad, frosh, by = "id") %>%
     filter(!grepl("^1ST YR", course)) %>%
     arrange(name, course) ->
     fy_mid

# Get a list of students/advisors (distinct) from first years     
students <- select(fy_mid, name, id, advisor) %>% distinct()
