# 00_setup.R

first.pkg <- gsub(
  "library\\(|\\)", "",
  grep("^library", readLines("packages.R", n = 5), value = T)[1]
)
if (!{first.pkg %in% names(sessionInfo()$otherPkgs)}) {
  source("packages.R") %>% suppressWarnings()
}


maxCores <- 50
redos <- c()
default.redo.state <- TRUE
set.to.false <- c()
set.to.true <- c()

dirs <- list(
  input    = "Input",
  analysis = "Analysis",
  save     = "Saved",
  plot     = "Plots",
  script   = "Scripts"
)
for (dir in dirs) { if (!dir.exists(dir)) { dir.create(dir) } }
for (file in list.files(path = dirs$script, full.names = T)) { source(file) }

nCores <- ifelse(Sys.getenv("HOSTNAME") == "", 3, maxCores)
setDTthreads(nCores)
assign.redo(redos, state = default.redo.state)
if (!is.null(set.to.true)) { set.redo.true(set.to.true) }
if (!is.null(set.to.false)) { set.redo.false(set.to.false) }

##
