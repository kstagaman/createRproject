# 00_setup.R

dirs <- list(
  input    = "Input",
  analysis = "Analysis",
  save     = "Saved",
  plot     = "Plots",
  script   = "Scripts"
)
for (dir in dirs) { if (!dir.exists(dir)) { dir.create(dir) } }
helpers::source.packages("packages.R")
for (file in list.files(path = dirs$script, full.names = T)) { source(file) }

###

user.seed <- 42
maxCores <- 120
redos <- c()
default.redo.state <- TRUE
set.to.false <- c()
set.to.true <- c()

###

nCores <- ifelse(Sys.getenv("HOSTNAME") == "", 3, maxCores)
setDTthreads(nCores)
assign.redo(redos, state = default.redo.state)
if (!is.null(set.to.true)) { set.redo.true(set.to.true) }
if (!is.null(set.to.false)) { set.redo.false(set.to.false) }

###
