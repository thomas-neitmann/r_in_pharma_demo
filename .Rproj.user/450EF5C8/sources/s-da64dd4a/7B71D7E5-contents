library(admiral)
library(dplyr)

eg <- readRDS("data/sdtm/eg.rds")
adsl <- readRDS("data/adam/adsl.rds")

adsl_vars <- vars(STUDYID, USUBJID, TRTSDT, TRTEDT)

adeg <- eg %>%
  left_join(select(adsl, !!!adsl_vars), by = c("STUDYID", "USUBJID")) %>%
  derive_vars_dtm(
    new_vars_prefix = "A",
    dtc = EGDTC,
    date_imputation = NULL,
    time_imputation = "first",
    flag_imputation = "time"
  ) %>%
  derive_vars_dtm_to_dt(vars(ADTM)) %>%
  derive_var_ady() %>%
  mutate(
    AVAL = EGSTRESN,
    AVALC = EGSTRESC,
    PARAMCD = EGTESTCD
  ) %>%
  derive_param_qtc(
    by_vars = vars(STUDYID, USUBJID, VISIT, VISITNUM, ADT),
    method = "Bazett",
    set_values_to = vars(
      PARAMCD = "QTCB",
      PARAM = "Corrected QT Interval (Bazett)"
    ),
    get_unit_expr = EGSTRESU
  ) %>%
  derive_extreme_flag(
    by_vars = vars(STUDYID, USUBJID, PARAMCD),
    order = vars(ADT, VISITNUM, EGSEQ),
    new_var = ABLFL,
    mode = "last",
    filter = ADT <= TRTSDT
  ) %>%
  derive_var_base(by_vars = vars(STUDYID, USUBJID, PARAMCD)) %>%
  derive_var_chg() %>%
  derive_var_pchg() %>%
  arrange(STUDYID, USUBJID, PARAMCD, VISIT)

saveRDS(adeg, file = "data/adeg.rds")
