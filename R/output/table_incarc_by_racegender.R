# Builds a LaTeX table of mean arrests by race and gender.
# See the pivoting vignette for how to use pivot functions.
# vignette("pivot")
# Documentation for the kableExtra package is here:
# https://cran.r-project.org/web/packages/kableExtra/vignettes/awesome_table_in_pdf.pdf

read_csv(here("data/NLSY97_clean.csv")) %>%
  
  # summarize arrests by race and gender
  group_by(race, gender) %>%
  summarize(incarc_status = mean(incarc_status)) %>%
  
  # pivot the values from race into columns
  pivot_wider(names_from = race, values_from = incarc_status) %>%
  
  # rename columns using snakecase
  rename_with(to_title_case) %>%
  
  # create the kable object. Requires booktabs and float LaTeX packages
  # changed title name
  kbl(
<<<<<<< HEAD
    caption = "Mean Months in Incarceration in 2002 by Race and Gender",
=======
    caption = "MMean Months in Incarceration in 2002 by Race and Gender",
>>>>>>> 19fd96d7cead030b870087c64311efa78001d235
    booktabs = TRUE,
    format = "latex",
    label = "tab:summarystats"
  ) %>%
  kable_styling(latex_options = c("striped", "HOLD_position")) %>%
  
  write_lines(here("tables/incarc_by_racegender.tex"))
  