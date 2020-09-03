# Data frames

iris

# We created a data frame ourselves:
patient_data <- 
    data.frame(
        Name = c("Steve Smith", "Marge Simpson", "Stewart Griffin"),
        Age = c(15, 36, 1),
        Treatment = c("A", "B", "C")
    )

# Investigate structure with str():
str(patient_data)

# Can look at an individual column with "$":
patient_data$Age

# also does partial matching:
patient_data$Trea

iris$Sepal.Length

# Data frame with different length vectors:
data.frame(
    x = 1:2,
    y = 1:10
)
# recycling
data.frame(
    case = 1:20,
    treatment = "A"
)

# We can also subset data frames with indices:
# dataframe[rows, columns]
patient_data[1,2]

# Takes ranges:
patient_data[1:2, 2:3]  
iris[1:10,]
iris[1:5, 1:2]

# Logical conditions:
iris$Sepal.Length > 5
iris[iris$Sepal.Length > 5, ]

# Lots of options: <, >, >=, <=, ==, !=

# Built-in functions:
mean(iris$Sepal.Length)
median(iris$Sepal.Length)
sd(iris$Sepal.Length)

# Plot
# Scatterplot is through `plot`:
plot(iris$Sepal.Length, iris$Sepal.Width)
?plot

# Let's label our plot:
plot(x = iris$Sepal.Length, y = iris$Sepal.Width,
     main = "This is my Plot")

# Histograms:
hist(iris$Sepal.Length)
?hist

# Load a data set: using read.table:
cs_ap_data <- read.table("Day-01/pass_06_13.csv",
                         sep = ",",
                         header = TRUE)
# Tabulate a column with table:
table(cs_ap_data$state)

# Some of these have *'s in them:
str(cs_ap_data)

# Some imported as character:
mean(cs_ap_data$hispanic_passed)

# New York pass rates:
NY_res <- cs_ap_data[ cs_ap_data$state == "New York", c("year", "total", "passed")]

# Percentage pass rate for New York by year:
NY_res$perc_passed <- NY_res$passed / NY_res$total 
NY_res
