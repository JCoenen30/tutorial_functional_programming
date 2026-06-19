#
# ------------ Mastering R: Best Practices and Essential Tools ----------- #
#
# This script:
# - Shows that you can create the functions as complex as you want
# - Shows a small note in tidy eval
# ------------------------------------------------------------------------ #

# 1. Load packages --------------------------------------------------------

## Packages
library(tidyverse)

## Functions
source("R/utils.R")

# 2. Load data ------------------------------------------------------------

## Load data
iris_tbl <- as_tibble(iris)

# 3. Analyze data ---------------------------------------------------------

## Calculate mean of numeric variables in Iris dataset, and sort them (First lines commented out are what we used to build function)
# iris_tbl |>
#     summarise(
#         across(
#             where(is.numeric), mean
#         ),
#         .by = Species
#     ) |>
#     pivot_longer(
#         cols = where(is.numeric),
#         names_to = "measure",
#         values_to = "mean"
#     ) |> 
#     group_by(measure) |>
#     arrange(
#         desc(mean),
#         .by_group = TRUE
#     ) |>
#     ungroup()
iris_tbl |>
    calc_iris_mean()


# 4. General function -----------------------------------------------------

## https://ggplot2.tidyverse.org/reference/tidyeval.html

## FUNCTION

## Apply to other datasets
calc_numeric_mean(
    data = airquality,
    group = Month
) |> 
    print(n = 50)

calc_numeric_mean(
    data = iris_tbl,
    group = Species
)







