# packages.R

library(data.table)
library(helpers)
library(magrittr)
library(RColorBrewer)
library(RedoControl)
library(tidyverse)

citations.dir <- "Saved/Citations_history"
if (!dir.exists(citations.dir)) { dir.create(citations.dir) }
write_bib(file = file.path(citations.dir, paste0("package_citations_", Sys.Date(), ".bib")))
