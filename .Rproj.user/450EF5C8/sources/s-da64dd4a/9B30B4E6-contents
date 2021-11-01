library(admiral)
library(dplyr)

eg <- readRDS("data/sdtm/eg.rds")
adsl <- readRDS("data/adam/adsl.rds")

adsl_vars <- vars(STUDYID, USUBJID, TRTSDT, TRTEDT)

adeg <- eg %>%
  left_join(select(adsl, !!!adsl_vars), by = c("STUDYID", "USUBJID"))
