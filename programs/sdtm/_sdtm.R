seq_fun <- function(.df, n){
  spl <- split(seq_along(.df$USUBJID), .df$USUBJID)
  sp <-lapply(spl, function(x){seq_along(x)})
  unlist(sp)
}

source("programs/sdtm/dm.R")
source("programs/sdtm/ds.R")
source("programs/sdtm/ex.R")
source("programs/sdtm/eg.R")
