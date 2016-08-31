#script to remake the nmisc r package

library(devtools)
# devtools::install_github("klutometis/roxygen")
library(roxygen2)

setwd("/Users/Nick/dev/nmisc")
document()

setwd("..")
install("nmisc")
